---
categories:
  - presentation
date: 2016-03-30 19:00
featured_image: /images/letsencrypt-all-the-things.jpg
tags:
  - saglacio
  - letsencrypt
  - https
  - revealjs
title: "Let’s Encrypt all the things"
url: /2016/03/30/letsencrypt-saglacio/
---


This site is being served as **https** and yours can be too! Keep reading and find out how to get free valid browser trusted https certificates. Slides of my talk at the [SagLacIO][saglacio] inside!

<!--more-->

## What's Let’s Encrypt?

> Let’s Encrypt is a new Certificate Authority:
> It’s **free**, **automated**, and **open**.

Have a look at [Let’s Encrypt website][letsencrypt] and their [FAQ][faq] if you didn't do it yet!

## Getting started

I'll jump straight to what's interesting; What are the steps to have a fully working and valid free https certificate on a website behind `nginx` and how to get a nice score on [ssltest][ssltest].

Most of the things needed to get started are described on [Let’s Encrypt getting started page][getting-started] along with most up to date information.

Have a look to [Get HTTPS for free! on Github][gethttpsforfree] which shows you what happens in the background when using the client. Everything is client side!

### Install Letsencrypt

Grab Letsencrypt official client on your server this way:

```bash
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto --help
```

### nginx configuration

Thanks to [@jipiboily][jipiboily], he shared me the awesome [letsecure.me][letsecure] website. Here's how my updated nginx configuration looks like:
`/etc/nginx/site-available/gableroux.conf`

{% highlight nginx %}
# gableroux.com configuration generated from salt

## https redirect
server {
  listen 80;
  listen [::]:80;
  server_name gableroux.com;

  location ~ '/.well-known/acme-challenge' {
    default_type "text/plain";
    root /var/www;
  }

  location / {
    return 301 https://$server_name$request_uri;
  }
}

## www removal
server {
  listen 80;
  listen [::]:80;
  server_name www.gableroux.com;

  location ~ '/.well-known/acme-challenge' {
    default_type "text/plain";
    root /var/www;
  }

  location / {
    return 301 https://gableroux.com$request_uri;
  }
}

## Main server config
server {
  listen 443 ssl http2;
  server_name gableroux.com;
  root /var/www/gableroux.com/_side;

  index  index.html;

  ### SSL Config (using Letsencrypt)
  ssl_certificate /etc/letsencrypt/live/gableroux.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/gableroux.com/privkey.pem;

  # Generate ssl_dhparam using `openssl dhparam -out dhparams.pem 4096`
  ssl_dhparam /etc/nginx/dhparams.pem;

  # Secure headers
  add_header Strict-Transport-Security "max-age=31557600; includeSubDomains";
  add_header X-Frame-Options "SAMEORIGIN";
  add_header X-Content-Type-Options "nosniff";
  add_header X-Xss-Protection "1";
  ## allows google fonts from stylesheets and google analytics for scripts
  ## Using 'unsafe-inline' due to some pages still doing this (angular app somewhere)
  ## Commented as this was to restrictive. Most of the things here are static anyway
  #add_header Content-Security-Policy "default-src 'self' *.googleapis.com *.google-analytics.com *.facebook.net *.facebook.com *.feedly.com; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline'; img-src 'self'";

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;

  ssl_session_timeout 5m;
  ssl_session_cache shared:SSL:128m;
  ssl_stapling on;
  ssl_stapling_verify on;

  # Your favorite resolver may be used instead of the Google one below
  resolver 8.8.8.8;

  ### Logs
  access_log  /var/log/nginx/gableroux.com.access.log;
  error_log   /var/log/nginx/gableroux.com.error.log;

  ### Serve root
  location / {
    root  /var/www/gableroux.com/_site;

    #### Todo: better 404
  }
}
```

It should get you on tracks.

`_site` is the public folder of my static website, but really, this is up to you. Grab what fits your needs in the config ;)

### Request a cert + renew command

First, create a config file:  

`/usr/local/etc/le-renew-webroot.ini`
{% highlight ini %}
rsa-key-size = 4096
email = lebreton.gabriel@gmail.com
domains = gableroux.com, www.gableroux.com
webroot-path = /var/www/
```

Then run the following:

```bash
letsencrypt-auto certonly -a webroot --renew-by-default \
--config /usr/local/etc/le-renew-webroot.ini
```

Yay https! Now run the above command in a daily cron job at a random hour to auto renew!  Let’s Encrypt certificates expires after 3 months and you don't want to do this by hand ;). That's it, **no more human intervention ever**.

Try running [ssltest on gableroux.com][ssltest_gableroux]. Spoiler, it looks like this:  
![A+ ssltest gableroux.com result](/images/gableroux-ssltest-a-plus.png)

## Edit: [OpenSSL Padding Oracle vulnerability (CVE-2016-2107)](https://blog.cloudflare.com/yet-another-padding-oracle-in-openssl-cbc-ciphersuites/)

So there is a new problem in the wild!
My ssltest went from an A+ to an F in no time!  Here's an handy tool to verify vulnerability:
[FiloSottile/CVE-2016-2107](https://github.com/FiloSottile/CVE-2016-2107)

Solution: *upgrade to [openssl](http://www.linuxfromscratch.org/blfs/view/svn/postlfs/openssl.html) 1.0.2h (64bit)*

On trusty Ubuntu 14.04 LTS

    openssl version -v

> OpenSSL 1.0.1f 6 Jan 2014

These will take a few minutes to run:

    wget https://www.openssl.org/source/openssl-1.0.2h.tar.gz
    tar -xzvf openssl-1.0.2h.tar.gz
    cd openssl-1.0.2h
    sudo ./config
    sudo make
    sudo make install
    sudo ln -sf /usr/local/ssl/bin/openssl $(which openssl)
    openssl version -v

> OpenSSL 1.0.2h  3 May 2016

Inspired by [Miguel's solution](http://www.miguelvallejo.com/updating-to-openssl-1-0-2g-on-ubuntu-server-12-04-14-04-lts-to-stop-cve-2016-0800-drown-attack/)

I was still getting the error, and I found this blog post: [How to fix high severity OpenSSL bugs (Memory corruption, Padding oracle) in Ubuntu, CentOS, RedHat, OpenSuse and other Linux servers](https://bobcares.com/blog/fix-high-severity-openssl-bugs-memory-corruption-padding-oracle-ubuntu-centos-redhat-opensuse-linux/)

    apt-get install --only-upgrade libssl1.0.0

Now verify it did apply the patch by reading the changelog:

    zgrep -ie "CVE-2016-2107" /usr/share/doc/libssl1.0.0/changelog.Debian.gz

>    - debian/patches/CVE-2016-2107.patch: check that there are enough
>    - CVE-2016-2107

Great! But still an F

From [nginx announcement](http://mailman.nginx.org/pipermail/nginx-announce/2016/000179.html), upgrade nginx to `1.11.1-1`.

    sudo apt-get install --upgrade nginx

Now let's verify again locally

    CVE-2016-2107 gableroux.com
    2016/06/10 13:32:17 Vulnerable: false

Awesome, scoring *A+* again, solved! :)

## The slides

Btw, there are a few interesting links at the end of the slides.

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <!-- todo: update me to https and host here -->
        <iframe src="https://letsencrypt.gableroux.com/" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

See full page [presentation website][presentation]

[presentation]: https://letsencrypt.gableroux.com/
[saglacio]: http://saglac.io
[letsencrypt]: https://www.letsencrypt.org/
[faq]: https://community.letsencrypt.org/t/frequently-asked-questions-faq/26
[getting-started]: https://letsencrypt.org/getting-started/
[ssltest]: https://www.ssllabs.com/ssltest/
[ssltest_gableroux]: https://www.ssllabs.com/ssltest/analyze.html?d=gableroux.com&hideResults=on&latest
[jipiboily]: http://jipiboily.com/
[letsecure]: https://letsecure.me/secure-web-deployment-with-lets-encrypt-and-nginx/
[gethttpsforfree]: https://gethttpsforfree.com/