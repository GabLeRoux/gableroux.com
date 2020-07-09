---
categories:
  - presentation
date: 2016-11-21 21:00
featured_image: /images/y-u-no-git.jpg
tags:
  - version-control
  - git
title: "Y U NO GIT"
url: /2016/11/21/version-control/
---


[Git][git] is a must have tool known as *the stupid content tracker*.  
Every programmer should learn to use it as soon as they can. Git will save you time and could even save your life (yep). I gave that presentation at the UQAC [SagLacIO][saglacio] Special edition! Thank you all, that was an awesome night!

<!--more-->

# Git, l'arbre de la vie

I learned **git** by myself and I want you to learn it too!

## Version control?

YES! You want to time travel in your code and into other people's code! Git is a **collaboration tool**, it's about **being able to work with people** but it's also great for working alone! Did you know **Github currently has more than 2.7M repositories** publicly available? Please, don't reinvent the wheel!

## Learn git

This is what you want to start with:  
[learn.github.com][learn.github.com]

And remember:  
![when in doubt, git commit](/images/when-in-doubt-git-commit-meme.png)

## Starting a new repository?

Make sure you add the right [`.gitignore`](https://git-scm.com/docs/gitignore) file from the [github/gitignore repository](https://github.com/github/gitignore) for your project. You don't want to track useless/generated files with git!

## Are you a student?

Save money, get Github pro for free and way more with the [github backpack](https://education.github.com/pack)! If you're only looking for private repositories (ex, for your homework), [Bitbucket](https://bitbucket.org/) offers free private repositories for teams < 5. :)

## Handy resources

### tldr
I recommend you to install [tldr][tldr]

    npm install -g tldr
    tldr --update
    tldr tldr

    tldr

    Simplified man pages.

    - Get typical usages of a command (hint: this is how you got here!):
      tldr command

    - Update the local cache of tldr pages:
      tldr --update

Or you can [see it in action on tldr.ostera.io](https://tldr.ostera.io/)

### Must click links
These are the very useful links from my last slide:

* [sindresorhus/awesome](https://github.com/sindresorhus/awesome) (It's not about git, but definitely deserves a click)
* [phillipadsmith/awesome-github](https://github.com/phillipadsmith/awesome-github)
* [arslanbilal/git-cheat-sheet](https://github.com/arslanbilal/git-cheat-sheet)
* [git-tips/tips](https://github.com/git-tips/tips)
* [stevemao/awesome-git-addons](https://github.com/stevemao/awesome-git-addons)
* [stefanbuck/awesome-browser-extensions-for-github](https://github.com/stefanbuck/awesome-browser-extensions-for-github)
* [tiimgreen/github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet)


## Slides

When writing my slides, **[I recorded a 22min git session][git-asciinema]** and created an **[example git repository on Github][GabLeRoux/git-commands-example]**.

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <iframe src="https://docs.google.com/presentation/d/1ynQabkehsa3bXKSh3ZTS36vfho5_zymROdu_wGxMwQc/embed?start=false&loop=false" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

[Direct link to presentation][presentation]

[saglacio]: http://saglac.io
[git-asciinema]: https://asciinema.org/a/6eudi47vuw1dgges25bnpver4
[git]: http://www.git.com
[learn.github.com]: https://learn.github.com/
[tldr]: http://tldr-pages.github.io/
[GabLeRoux/git-commands-example]: https://github.com/GabLeRoux/git-commands-example
[presentation]: https://docs.google.com/presentation/d/1Gna63HoVNrDhrbnGHd5Dzi_gafMu8cFc-VvpbAHUL90/embed?start=false&loop=false