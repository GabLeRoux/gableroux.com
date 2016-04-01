---
layout: post
title:  "Let’s Encrypt all the things"
date:   2016-03-30 19:00
categories: presentation
tags: saglacio letsencrypt https revealjs
featured_image: /images/letsencrypt-all-the-things.jpg
---

This site is being served as **https** and yours can be too! Keep reading and find out how to get free valid browser trusted https certificates. Slides of my talk at the [SagLacIO][saglacio] inside!

<!-- more -->

## What's Let’s Encrypt?

> Let’s Encrypt is a new Certificate Authority:
> It’s **free**, **automated**, and **open**.

Have a look at [Let’s Encrypt website][letsencrypt] and their [FAQ][faq] if you didn't do it yet!

## Getting started

I'll jump straight to what's interesting; What are the steps to have a fully working and valid free https certificate on a website behind `nginx` and how to get a nice score on [ssltest][ssltest].

Most of the things needed to get started are described on [Let’s Encrypt getting started page][getting-started] along with most up to date informations.

Have a look to [Get HTTPS for free! on github][gethttpsforfree] which shows you what happens in the background when using the client. Everything is client side!

### Install letsencrypt

Grab letsencrypt official client on your server this way:

{% highlight bash %}
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto --help
{% endhighlight %}

### nginx configuration

Note: Thanks to [@jipiboily][jipiboily], he shared me the awesome [letsecure.me][letsecure] website and here's what my nginx configuration looks like now (a bit different from what I've shown in my slides):
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

  ### SSL Config (using letsencrypt)
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
  ## Using 'unsafe-inline' as we're not nazis...
  add_header Content-Security-Policy "default-src 'self'; style-src 'self' 'unsafe-inline' *.googleapis.com; script-src 'self' 'unsafe-inline' *.google-analytics.com";

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
{% endhighlight %}

This is what my nginx config looks once rendered by my custom salt commands (not covered here tough) It should get you on tracks.

`_site` is the public folder of my static website, but really, this is up to you. grab what fits your needs in the config ;)

### Request a cert + renew command

First, create a config file:  

`/usr/local/etc/le-renew-webroot.ini`
{% highlight ini %}
rsa-key-size = 4096
email = lebreton.gabriel@gmail.com
domains = gableroux.com, www.gableroux.com
webroot-path = /var/www/
{% endhighlight %}

Then run the following:

{% highlight bash %}
letsencrypt-auto certonly -a webroot --renew-by-default \
--config /usr/local/etc/le-renew-webroot.ini
{% endhighlight %}

Yay https! Now run the above command in a daily cron job at a random hour to auto renew! That's it, **no more human intervention ever**. Let’s Encrypt certificates expires after 3 months, you don't want to do this by hand ;).

Try running [ssltest on gableroux.com][ssltest_gableroux]. Spoiler, it looks like this:  
![A+ ssltest gableroux.com result](/images/gableroux-ssltest-a-plus.png)

## The slides

Btw, there are a few interesting links at the end of the slides.

<div class="responsive-iframe-wrapperr">
    <div class="responsive-iframe">
        <img class="ratio" src="https://placehold.it/16x9"/>
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
