---
omit_header_text: true
categories:
  - awesome
date: 2017-05-07 12:00:00
featured_image: /images/awesome-lists-are-awesome.jpg
tags:
  - awesome
  - guides
  - curated-list
  - comics
title: "Things I share to programmers"
url: /2017/05/14/things-i-share-to-programmers/
---


> Don't reinvent the wheel

So many things to read, cool stuff to try, great tools to use but where can we start? Answer inside.

<!--more-->

Hi, I've repeated myself quite a few times and shared these awesome things to a few ones, so here they are on a single page! :)

## Where are you?

Know where you are, there's so much to learn. Focus on the things *you* want to do. I wanted to learn Computer science in general, programming apps, web apps, websites, apis, deploying servers, etc. I found myself doing a lot of things in Front-end, Back-end and Devops. 

![kamranahmedse/developer-roadmap chose your path](https://camo.githubusercontent.com/2e6d200ca77e11ad11721c4cbff86104bd005eac/68747470733a2f2f692e696d6775722e636f6d2f71426c5436374e2e706e67)

[This roadmap is very accurate](https://github.com/kamranahmedse/developer-roadmap), know where you're going.

## Sindre Sorhus

If you don't know **[Sindre Sorhus](https://sindresorhus.com/)**, well go see his stuff right now, it's magic 🦄. He has a lot of [very neat projects on Github](https://github.com/sindresorhus) and [many great posts on his blog](https://blog.sindresorhus.com/). His [Ask Me Anything (AMA)](https://blog.sindresorhus.com/answering-anything-678ce5623798) is really fun to read.

## Awesome

> Don't reinvent the wheel

Are you looking for places to get started on a subject, technology or anything? Start from the [awesome list of awesome lists](https://awesome.re) ([Sindre Sorhus](https://sindresorhus.com/) is the guy behind this). 

### Django

I'm a [django framework](https://www.djangoproject.com/) fan so I really enjoy the [awesome-django list](http://awesome-django.com/). 

**You must read [12factor](https://12factor.net/)** and you must also **[Obey the Testing Goat!](http://www.obeythetestinggoat.com/)**, we need more tests and less shitty code with well designed apps. Stop wasting your time.

* [Factory boy](https://factoryboy.readthedocs.io/en/latest/) In your tests
* [Faker](http://faker.readthedocs.io/en/master/) In your tests
* [django-rest-framework](http://www.django-rest-framework.org/) If you're about to create an api

### Angular

I don't prefer angular more than other frontend frameworks, but I used to work with it quite a few times.

If you're about to start a project, you may want to compare frontend frameworks, have a look to [todo mvc](http://todomvc.com/).

* Learning Angular 1? See [awesome angular 1 list](https://github.com/gianarb/awesome-angularjs). 
* Angular 2? See [awesome angular 2 list](https://github.com/AngularClass/awesome-angular)

### Terminal

![xkcd sandwich](https://imgs.xkcd.com/comics/sandwich.png)
> Proper User Policy apparently means Simon Says.
> [source xkcd](https://www.xkcd.com/149/)

As usual, [awesome-shell](https://github.com/alebcay/awesome-shell).

#### Learning the command line

You should read [The art of command line](https://github.com/jlevy/the-art-of-command-line) and learn all the things in section _Everyday use_.

![xkcd tar](https://imgs.xkcd.com/comics/tar_2x.png)
> I don't know what's worse--the fact that after 15 years of using tar I still can't keep the flags straight, or that after 15 years of technological advancement I'm still mucking with tar flags that were 15 years old when I started.
> [Source xkcd](https://www.xkcd.com/1168/)

Install [tldr](http://tldr-pages.github.io/) and start learning. 

```bash
tldr tar
```
```
  tar

  Archiving utility.
  Often combined with a compression method, such as gzip or bzip.

  - Create an archive from files:
    tar cf target.tar file1 file2 file3

  - Create a gzipped archive:
    tar czf target.tar.gz file1 file2 file3

  - Extract an archive in a target folder:
    tar xf source.tar -C folder

  - Extract a gzipped archive in the current directory:
    tar xzf source.tar.gz

  - Extract a bzipped archive in the current directory:
    tar xjf source.tar.bz2

  - Create a compressed archive, using archive suffix to determine the compression program:
    tar caf target.tar.xz file1 file2 file3

  - List the contents of a tar file:
    tar tvf source.tar

```

You get the point ;)

#### Shell pimping

I personally use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) with [sindresorhus's pure theme](https://github.com/sindresorhus/pure) and a few plugins setup. Further reading at **[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)**.

### OS

#### Windows

![windows 7 xkcd](https://imgs.xkcd.com/comics/windows_7.png)
> Disclaimer: I have not actually tried the beta yet.  I hear it's quite pleasant and hardly Hitler-y at all.
> [Source xkcd](https://xkcd.com/528/)

You should use [chocolatey package manager](https://chocolatey.org/) to install things. I recommend using [conemu](https://conemu.github.io/) (`choco install conemu`) with [`git bash`](https://git-scm.com/downloads) (`choco install git`) for your daily windows terminal stuff. Other [terminal alternatives here](https://github.com/Awesome-Windows/Awesome#terminal). 

Jump to **[windows awesome list](https://github.com/Awesome-Windows/Awesome)** directly for more great stuff in general ;)

Oh and if I still have your attention, you may want to [disable windows spying on you](https://fix10.isleaked.com/). Have fun reading [reasons not using microsoft by Richard Stallman](https://stallman.org/microsoft.html).

#### MacOS

![macos xkcd](https://imgs.xkcd.com/comics/felidae.png)
> 'Smilodon fatalis' narrowly edged out 'Tyrannosaurus rex' to win this year's Most Badass Latin Names competition, after edging out 'Dracorex hogwartsia' and 'Stygimoloch spinifer' (meaning 'horned dragon from the river of death') in the semifinals.
> [Source xkcd](https://xkcd.com/1056/)

You should setup [quick look plugins](https://github.com/sindresorhus/quick-look-plugins), use [iterm](https://www.iterm2.com/) because the terminal that comes with MacOs isn't fun. Have a look to these [mac os tips and tricks from sindresorhus](https://blog.sindresorhus.com/macos-tips-tricks-13046cf377f8). Some tools worth paying for:

* [Alfred](https://www.alfredapp.com/) Spotlight replacement with way too many features. Buy it mostly for its clipboard manager, it's really great :)
* [little snitch](https://www.obdev.at) Really nice firewall if you like seeing what your apps are doing on the internets
* [Dash](https://kapeli.com/dash) offline documentation fast access
* [iStat Menus](https://bjango.com/mac/istatmenus/) (and other apps from bjango), it's nice if you have the money ;)

There are many great applications out there, I found these worth paying for, but there are way much more, as usual, [awesome list]()

#### Linux

![xkcd linux](https://imgs.xkcd.com/comics/linux_user_at_best_buy.png)
> We actually stand around the antivirus displays with the Mac users just waiting for someone to ask.
> [Source xkcd](https://www.xkcd.com/272/)

I worked on [Ubuntu](https://www.ubuntu.com/) in the past but I was tired of always installing `ppas`. [Archlinux](https://www.archlinux.org/) is awesome, very nice wiki, but kind of hard to setup and maintain. I really enjoyed my time on [Fedora](https://getfedora.org/). If you use Fedora, have a look to [Fedy](https://www.folkswithhats.org/), it's quite handy.

Anyway, have a look to [awesome linux](https://github.com/aleksandar-todorovic/awesome-linux).

### Git

![xkcd git](https://imgs.xkcd.com/comics/git.png)
> If that doesn't fix it, git.txt contains the phone number of a friend of mine who understands git. Just wait through a few minutes of 'It's really pretty simple, just think of branches as...' and eventually you'll learn the commands that will fix everything.
> [Source xkcd](https://xkcd.com/1597/)

Oh man, too much things to say about git. See **[development-environment section on awesome.re](https://github.com/sindresorhus/awesome#development-environment)**, there are multiple git lists out there.

I also wrote [a post and gave a presentation about git](https://gableroux.com/presentation/2016/11/21/version-control/) where I recorded this asciinema:

[![asciicast](https://asciinema.org/a/6eudi47vuw1dgges25bnpver4.png)](https://asciinema.org/a/6eudi47vuw1dgges25bnpver4)

---

I suppose you get it now, find the stuff you need in [awesome lists of awesome lists](https://awesome.re) and enjoy.

## Search engine

> Why are you always typing `! something` in your browser's search bar? 

Well I prefer using [duckduckgo](https://duckduckgo.com/) search engine. It's not tracking me and it has [a lot of `bangs`](https://duckduckgo.com/bang). See for yourself, try searching [`!wa pikachu`](https://duckduckgo.com/?q=%21wa+pikachu).

## Take notes

There are plenty of tools for taking notes, I personally like [Github gists](https://gist.github.com/) with [markdown](https://guides.github.com/features/mastering-markdown/) and syntax highlighting. If you start noting things early, you'll end up with a nice database of snippets where you can search for things. Bonus point if you put some of them public! 🤗

## Install editorconfig everywhere

Install [editorconfig](http://editorconfig.org/) in all your IDEs and Text editors so you don't mess up line endings and tab spacing anymore. 😉

## Learning a new programming language?

You know `c#` but you never wrote a line of `python`? Have a look to [Learn X in Y Minutes](https://learnxinyminutes.com/). If you already know the basics, things will go fast. It's more about the syntax, but It's a really nice reference.

---

I'll probably add more things here. If you have suggestions, feel free to poke me or [open an issue](https://github.com/GabLeRoux/gableroux.github.io/issues).
Hope you enjoyed this and that you learned a few things.
