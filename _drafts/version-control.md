---
layout: post
title:  "Y U NO GIT"
date:   2015-06-04 12:00
categories: tips
tags: version-control git presentation
featured_image: /images/y-u-no-git.jpg
---

[Git][git] is a must have tool known as *the stupid content tracker*. Every programmer should learn to use it as soon as they can. Git will save you time and could even save your life (yep). I gave that presentation at the UQAC [SagLacIO][saglacio] Special edition!

<!-- more -->

I took many courses in Computer Science, some database courses where I learned to use Solaris and old stuff (seriously...). I learned OpenGL, hardcoded some [3d molecular thing with it][opengl-3d-molecules-hardecoded-xyz], also wrote an [audio visualizer][IndustrialSoundsAndStuff] in java and many other things. But there's one thing I learned by myself: **git** and I strongly recommend you to learn it too! Slides at the end of post ;)

## Why version control

It's not much about having _version numbers_ or anything, it's just about **being able to work with others**. Git is not just a version control application, it's a collaboration tool. Did you know **github currently has more than 2.7M code repositories** available to public? So please, don't reinvent the wheel!

## Learn git

This is what you want to start with:
* [learn.github.com][learn.github.com]

## Handy resources

To quickly lookup commands, I recommend you to use [tldr][tldr]

    npm install -g tldr
    tldr --update
    tldr tldr


>      tldr
>
>      Simplified man pages.
>
>      - Get typical usages of a command (hint: this is how you got here!):
>        tldr command
>
>      - Update the local cache of tldr pages:
>        tldr --update

And these are very useful links concerning git (links from my last slide):

* [sindresorhus/awesome](https://github.com/sindresorhus/awesome)
* [phillipadsmith/awesome-github](https://github.com/phillipadsmith/awesome-github)
* [arslanbilal/git-cheat-sheet](https://github.com/arslanbilal/git-cheat-sheet)
* [git-tips/tips](https://github.com/git-tips/tips)
* [stevemao/awesome-git-addons](https://github.com/stevemao/awesome-git-addons)
* [stefanbuck/awesome-browser-extensions-for-github](https://github.com/stefanbuck/awesome-browser-extensions-for-github)
* [tiimgreen/github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet)


## Slides

When writing my slides, **[I recorded a 22min git session][git-asciinema]** and created an **[example git repository on github][GabLeRoux/git-commands-example]**.

<div class="responsive-iframe-wrapperr">
    <div class="responsive-iframe">
        <img class="ratio" src="http://placehold.it/16x9"/>
        <iframe src="https://docs.google.com/presentation/d/1ynQabkehsa3bXKSh3ZTS36vfho5_zymROdu_wGxMwQc/embed?start=false&loop=false" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

See full page [presentation website][presentation]

[git]: http://www.git.com
[opengl-3d-molecules-hardecoded-xyz]: https://github.com/GabLeRoux/opengl-3d-molecules-hardecoded-xyz
[IndustrialSoundsAndStuff]: https://github.com/GabLeRoux/IndustrialSoundsAndStuff
[learn.github.com]: https://learn.github.com/
[GabLeRoux/git-commands-example]: https://github.com/GabLeRoux/git-commands-example
[presentation]: https://docs.google.com/presentation/d/1Gna63HoVNrDhrbnGHd5Dzi_gafMu8cFc-VvpbAHUL90/embed?start=false&loop=false
