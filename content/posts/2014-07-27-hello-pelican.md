---
categories:
  - news
date: 2014-07-27 15:00:00
featured_image: /images/hello-pelican.jpg
tags:
  - Pelican
  - hello-world
title: "Hello Pelican"
url: /2014/07/27/hello-pelican/
---


Hi there,  
Welcome to my blog. This is my first post (in fact, it's my second). I first attempted to create my blog with [wagtail][wagtail] but I had a [blocking issue][blocking-issue]. *Edit: problem solved, but I'm happy with pelican!* Anyway, I'm glad you're here, I made a branch and moved my work to [Pelican][pelican].

<!--more-->

It's probably more convenient for my simple website. I can't tell a lot about pelican as I did not play much with it yet, but it seems very easy to work with. Oh and I love writing in `markdown`, that's probably because of Github ReadMe files Eh.

## Pelican

Here's how I got started with `pelican` running `$ pelican-quickstart`

{% highlight text %}
pelican-quickstart
Welcome to pelican-quickstart v3.4.0.

This script will help you create a new Pelican-based website.

Please answer the following questions so this script can generate the files
needed by Pelican.

> Where do you want to create your new web site? [.]
> What will be the title of this web site? GabLeRoux
> Who will be the author of this web site? GabLeRoux
> What will be the default language of this web site? [en]
> Do you want to specify a URL prefix? e.g., http://example.com   (Y/n) y
> What is your URL prefix? (see above example; no trailing slash) http://www.gableroux.com
> Do you want to enable article pagination? (Y/n) y
> How many articles per page do you want? [10] 5
> Do you want to generate a Fabfile/Makefile to automate generation and publishing? (Y/n) y
> Do you want an auto-reload & simpleHTTP script to assist with theme and site development? (Y/n) y
> Do you want to upload your website using FTP? (y/N) n
> Do you want to upload your website using SSH? (y/N) y
> What is the hostname of your SSH server? [localhost] gableroux.com
> What is the port of your SSH server? [22]
> What is your username on that server? [root] ***************
> Where do you want to put your web site on that server? [/var/www] *********************
> Do you want to upload your website using Dropbox? (y/N) n
> Do you want to upload your website using S3? (y/N) n
> Do you want to upload your website using Rackspace Cloud Files? (y/N) n
> Do you want to upload your website using GitHub Pages? (y/N) n
Done. Your new project is available at *******/***/********/*****
�F�
```

Ok so not quite sure about that last line, but my stuff is ready to go now :). Thanks to the [documentation](http://docs.getpelican.com/), it's very well explained and easy to follow.

### Plugins!

Now that my site is up and running, I'll need to try the [plugins](https://github.com/getpelican/pelican-plugins). I'm only using the `sitemap` plugin atm tho :P

### Themes! 

If you're reading this post, you see the theme I made. If you want to create your own theme, that's easy! have a look at [pelican-themes](https://github.com/getpelican/pelican-themes) on GitHub.

You can then insert this in your pelican settings:

```bash
    THEME = "/home/user/pelican-themes/theme-name"
```

## What's next

There's not much on my site right now, but I'll keep updating this place by posting cool stuff. I'll be using [Disqus](https://disqus.com/) on this site so feel free to comment and talk about stuff. I have a small [todo list here](/todo/), I'll add some things to fix here and there and will note some articles and apps to talk about ^^.

[wagtail]: http://wagtail.io/
[blocking-issue]: http://stackoverflow.com/questions/24976561/wagtail-pages-giving-none-url-with-live-status
[pelican]: http://blog.getpelican.com/