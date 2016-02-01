---
layout: post
title:  "Install redmine on centos 7"
date:   2015-09-31 18:00
categories: redmine application howto
---

A collegue had to install [redmine][redmine] once and I gave this a look. Turns out [redmine documentation for centos] is getting old, we gave a try and wow, this is not as easy as it seems.

<!-- more -->

If you are here because you want to install redmine from scratch, I really suggest you use something like the one click digital ocean image, it will take you 5 minutes and this includes creating your account and loging into the app.

## Still there? 

Close your eyes, this will be ugly.

# Redmine installation on ubunutu 14.04 x64

    sudo apt-get install redmine redmine-mysql mysql-server -y

# mariadb root password: yaV1diV8Ac9kesH3cY3wuB4Ab4Fou
# MySQL application password for redmine/instances/default: iR3oC4kEwt7yU6Wyef3hed4or6Oc2

    sudo apt-get install apache2 libapache2-mod-passenger -y
    sudo cp /usr/share/doc/redmine/examples/apache2-passenger-host.conf /etc/apache2/sites-available/

    gem install bundler

# customize apache2-passenger-host.conf (listen 80)

    vim /etc/apache2/sites-available/apache2-passenger-host.conf

# passenger conf

add `PassengerDefaultUser www-data` to `passenger.conf`

    vim /etc/apache2/mods-available/passenger.conf

# customize apache2.conf (NameServer)

    vim /etc/apache2/apache2.conf

    sudo ln -sf /usr/share/redmine /var/lib/redmine/default/passenger
    sudo a2ensite apache2-passenger-host.conf
    sudo service apache2 reload
