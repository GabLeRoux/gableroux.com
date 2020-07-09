---
layout: post
title:  "Install redmine on centos 7"
date:   2015-09-31 18:00
categories: tips
tags: redmine application howto
featured_image: /images/redmine-centos.jpg
---

A coworker had to install [redmine][redmine], I didn't know the tool, but I like challenges. Turns out [redmine documentation for centos] is getting old, we gave a try and wow, this is not as easy as it seems.

<!-- more -->

If you are here because you want to install redmine from scratch, I strongly suggest you to use something like the [one click digital ocean image](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-one-click-install-redmine-on-ubuntu-14-04-image), it will take you 5 minutes and you'll be done.

## Still there?

Close your eyes, this will be ugly.

## Redmine installation on CemtOS 7

```bash
sudo apt-get install redmine redmine-mysql mysql-server -y
```

You should use mariadb instead of mysql for [the following 10 reasons](https://seravo.fi/2015/10-reasons-to-migrate-to-mariadb-if-still-using-mysql)

Install apache2 (haven't tried with nginx here, its usually better than apache, but not covered here sorry)

```bash
sudo apt-get install apache2 libapache2-mod-passenger -y
sudo cp /usr/share/doc/redmine/examples/apache2-passenger-host.conf /etc/apache2/sites-available/

gem install bundler
```

## Customize apache2-passenger-host.conf (listen 80)

```bash
vim /etc/apache2/sites-available/apache2-passenger-host.conf
```

Have a look to its content and comment, if you're new to this, don't edit ;)

## Edit passenger conf

Add `PassengerDefaultUser www-data` to `passenger.conf`

```bash
vim /etc/apache2/mods-available/passenger.conf
```

## Customize apache2.conf (NameServer)

```bash
vim /etc/apache2/apache2.conf

sudo ln -sf /usr/share/redmine /var/lib/redmine/default/passenger
sudo a2ensite apache2-passenger-host.conf
sudo service apache2 reload
```

Almost done. Todo: finish this post one day, I never posted this, but could be handy for someone unless they managed to make it easier :O
