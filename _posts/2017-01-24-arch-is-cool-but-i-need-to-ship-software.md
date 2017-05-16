---
layout: post
title:  "Arch Linux is cool, but I need to ship software"
date:   2017-01-24 18:00
categories: presentation
tags: saglacio linux archlinux antergos fedora
featured_image: /images/arch-is-cool-but-i-need-to-ship-software.jpg
---

[Arch Linux][archlinux] is a very powerful and amazing linux distribution. You get full control on everything. It has bleeding edge software and it's surprisingly stable if you know what you're doing. However, sometimes, things can go wrong.

<!-- more -->

You want a really neat linux distribution with a rock solid package manager that lets you install whatever you want? You're a linux power user tired of **installing [so many PPAs][ubuntu-ppas] to get what you want (Ubuntu)?**  Arch Linux is what you're looking for! It has a powerful package manager ([pacman] or you can also install [aura][aura]), top notch documentation and it's really fun to use. It may not be as easy as you'd think, but I'm sure you can get it to work. In this presentation, I talked about my journey with one of the most amazing Linux distro I ever used. \<3

## Enjoy the slides

<div class="responsive-iframe-wrapperr">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <iframe src="https://docs.google.com/presentation/d/1XN_qvV55ktoHY9QiRiqjTXtCfUTS9X-QANCujlmKZXE/embed?start=false&loop=false" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

## Links you need to visit

* [Arch wiki][archlinux]
* [Awesome linux][awesome-linux]
* [Antergos][antergos] 

Anthergos will make your setup easier (as shown by the step by step in the slides). The only sad thing about Anthergos is that the Arch community may bitch you for not using raw commands to setup your distro. I personally think it's ok to use it. It's cool to do everything by your own, but _sometimes_ it's easier with a UI. Way better than using windows anyway IMHO ;)

Oh and btw, you can use Arch Linux as a server, but I think it's more clever to use a distro where all your coworkers are comfortable with.

## Spoiler alert #1: I moved to Fedora

One thing I really liked about Fedora is its **Problem Reporting application** that comes with it. 

<!-- TODO: add a picture of Problem Reporting application here -->

My laptop was kind of easy to break. Bad Nvidia support, multi display glitches, CPU temperature above threshold, random crashes whatever reason, etc.

If you move to [Fedora][fedora], you may like to use this cool software: [Fedy][Fedy].
 
> Fedy lets you install multimedia codecs and additional software that Fedora doesn't want to ship, such as MP3 support, Adobe Flash, Oracle Java, and much more, with just a few clicks.
> To install Fedy in Fedora, open a Terminal and run the following command:

{% highlight bash %}
    curl https://www.folkswithhats.org/installer | sudo bash
{% endhighlight %}

_Note: don't install things from the internet before reading it, so read it first_

{% highlight bash %}
    curl https://www.folkswithhats.org/installer
{% endhighlight %}

Also, most of the internet will tell you to _disable SELinux_. **Don't do this**. You'll lose time with it and you won't figure out it's that piece of software that [blocked your docker volumes][docker-selinux] ([StackOverflow question][docker-selinux-so]), but you should really **[stop disabling selinux][stop-disabling-selinux]**.

## Spoiler alert #2: I returned to MacOS

Sometimes, your job gives you a laptop with an apple logo  to ship ios apps. If that's also your case, have a look to this [amazing MacOS awesome list][awesome-macos]. Sounds like I'll prepare a presentation about productivity tools on MacOS but in the meantime, have a look to [Things I share to programmers][things-i-share-to-programmers].

[ubuntu-ppas]: https://launchpad.net/ubuntu/+ppas
[aura]: https://github.com/aurapm/aura
[pacman]: https://wiki.archlinux.org/index.php/pacman
[stop-disabling-selinux]: https://stopdisablingselinux.com/
[docker-selinux-so]: http://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker
[docker-selinux]: http://www.projectatomic.io/blog/2016/03/dwalsh_selinux_containers/
[iterm]: https://iterm2.com/
[antergos]: https://antergos.com/
[awesome-fedora]: https://github.com/strongrandom/awesome-fedora
[fedora]: https://getfedora.org/
[awesome-linux]: https://github.com/aleksandar-todorovic/awesome-linux
[awesome-macos]: https://github.com/iCHAIT/awesome-macOS
[Fedy]: https://www.folkswithhats.org/ 
[archlinux]: https://www.archlinux.org/

[things-i-share-to-programmers]: {% post_url 2017-05-14-things-i-share-to-programmers %}