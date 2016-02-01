---
layout: post
title:  "Y U NO GIT"
date:   2015-06-04 12:00
categories: tutorial
tags: version-control git
---

![git diff terminal](/images/y-u-no-git.jpg)

[Git][git] is a must have tool for programmers known as *the stupid content tracker*. Every programmer should learn to use it as soon as they can. Git could save a couple days and could even save your life (yep, git will save your life, it did with mine). 

<!-- more -->

I took many courses in Computer Science, some database courses where I learned to use Solaris and old stuff (seriously...). did some modelisation, algorithms, learned object oriented programming, learned OpenGL, hardcoded some [3d molecular thing with it][opengl-3d-molecules-hardecoded-xyz] also wrote an [audio visualizer][IndustrialSoundsAndStuff] in java etc. But there's one thing I learned at school without a course, and that is **git**. *Note: I enjoyed my courses, but I had to learn git by my own, not easy at first, though, really worth it.*
  
# Why version controlling
It's not much about having _version numbers_ or anything, it's just about *being able to work with others*. Git is not just a version control application, it's a collaboration tool. Did you know github currently has more than 2.7M code repositories available to public? This is a lot of code. 

**Don't share code on dropbox again, don't share code on a usb key, don't even think about it**.

> but it works

Saying dropbox works for code sharing is like saying [bogosort][bogosort] is a good sorting algorithm.

    def bogo(data):
        while notInOrder(data):
            data = shuffle(data)
        return data

*tldr;* let's say you want to sort cards, you throw them all on the ground at the same time, you pick them up and check if they're sorted. Repeat until cards are in order.

> Alright, show me how to git

Before we get started, let's get familiar with some words I will be using:

* `repository`: The place where all the code, history and files will be stored
* `commit`: An action from a programmer that says hey, I `modified` these files, `added` these,`deleted` these and `renamed` these.
* `branch`: They are like copies of your code inside the `repository`. Default branch is named `master`
* `remote`: It is a place somewhere else where you can send your code. You may have more than one! You can have a production server, [Github][github], [bitbucket][bitbucket], your private [gitlab][gitlab] etc.

## Getting started

Fire up a terminal (learn it this way first so you know what's going on behind the scene later). To create a new repository, `cd` into your project and `git init .`.

> Initialized empty Git repository in /Users/gableroux/temp/random_stuff/.git/

A folder named `.git` will be created. This folder contains all the informations, settings and history of the repository. Now run `git status`

> On branch master
> 
> Initial commit
> 
> nothing to commit (create/copy files and use "git add" to track)    

We see we're on branch `master`, we are at the first commit of this repository. Now what? They say create/copy files and use git add to track. It's all about *tracking changes*. For our example, we create a new file in the same directory. `touch hello.txt`. This new file could be anything, now run `git status` again. Here's what we get

> On branch master
> 
> Initial commit
> 
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
> 
>     hello.txt

nothing added to commit but untracked files present (use "git add" to track)

We are still on the Initial commit, there are `Untracked files`, that means we can track them! As they say, let's use `git add`.

> Nothing specified, nothing added.
> Maybe you wanted to say 'git add .'?

Oh so we need to specify something, ok boss, `git add hello.txt`. You won't get any output, but the command did work, run `git status` and see what's going on now.

> On branch master
> 
> Initial commit
> 
> Changes to be committed:
>   (use "git rm --cached <file>..." to unstage)
> 
>     new file:   hello.txt

### Commit

"Changes to be committed", in other words, nothing is currently commited, we need to `commit`, if we run `git commit`, this will bring your default editor

> 2 # Please enter the commit message for your changes. Lines starting
> 3 # with '#' will be ignored, and an empty message aborts the commit.
> 4 # On branch master
> 5 #
> 6 # Initial commit
> 7 #
> 8 # Changes to be committed:
> 9 #       new file:   hello.txt
> 10 #

Simply write a message here, this message is used to described your changes, for example: "Added useless hello.txt file" could be all fine here. Now if you're on linux, the editor that will open may be [vim][vim], Search online for basic usage, but in short, ctrl+c gets you in command input mode, `i` geets you in "insert mode" so to write text in vim, `ctrl+c`, `i` type some text, `ctrl+c` to get in command mode again, `:wq` + enter. `w` stands for write and `q` stands for quit. Voilà, you just made a commit.

> [master (root-commit) 84c7af3] Added useless hello.txt file
> 1 file changed, 0 insertions(+), 0 deletions(-)
> create mode 100644 hello.txt

Note: you can skip the editor/vim part by prividing a parameter to git commit command: `git commit -m "Added useless hello.txt file"`. The editor is still usefull when you do big changes with a lot of files where you want to describe the reasons for your changes. keep it straight to the point, people doesn't read much.

### git log

Ok so we've made a commit, what's next?

    git log

> commit 84c7af3fc886d80df2677a164ed667f3fbb4e17a
> Author: Gabriel Le Breton <lebreton.gabriel@gmail.com>
> Date:   Tue Sep 8 21:44:29 2015 -0400
>
>     Added useless hello.txt file
> (END)

Oh look, some informations! the commit hash is unique for every commit ([at least it should][how-much-of-a-git-sha-is-generally-considered-necessary-to-uniquely-identify-a]).

Let's say I have to write a small app with a colleague that must return all possible combinations of a list of styles and within a user interface.

    insert gamejam style generator here

Well that's a nice code snippet, it works from the command line, but it needs a ui. I wrote this code and my colleague didn't touch a line of code yet; his reason: I started coding so he was waiting for me to send him the code. He says he will start working on it when I'm done. WRONG. if you're that kind of guy, stop being that kind of guy (or girl). [Divide and conquer](https://en.wikipedia.org/wiki/Divide_and_conquer_algorithms).

[git]: http://www.git.com
[opengl-3d-molecules-hardecoded-xyz]: https://github.com/GabLeRoux/opengl-3d-molecules-hardecoded-xyz
[IndustrialSoundsAndStuff]: https://github.com/GabLeRoux/IndustrialSoundsAndStuff
[bogosort]: https://en.wikipedia.org/wiki/Bogosort
[vim]: http://www.vim.org
[how-much-of-a-git-sha-is-generally-considered-necessary-to-uniquely-identify-a]: http://stackoverflow.com/questions/18134627/how-much-of-a-git-sha-is-generally-considered-necessary-to-uniquely-identify-a
