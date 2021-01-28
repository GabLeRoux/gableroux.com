---
layout: post
title: "Run Unity3d tests with gitlab-ci and docker"
date: 2018-05-12 19:00
categories: unity3d
tags: unity docker ci gitlab-ci
featured_image: /images/run-unity3d-tests-with-gitlab-ci-and-docker.jpg
---

I code video games in my spare time with [Totema Studio](https://totemastudio.com/) and I wish more video game developers would write more tests and stop loosing time building everything manually.

<!-- more -->

I started working on building Unity projects in the cloud a few months ago and started the two following public projects on Gitlab:

* [gableroux/unity3d](https://gitlab.com/gableroux/unity3d)
* [gableroux/unity3d-gitlab-ci-example](https://gitlab.com/gableroux/unity3d-gitlab-ci-example)

I was able to create Docker images with Unity3d installed inside, ready to run commands in some projects, but I quickly hit a wall with activating Unity3d inside docker. Unity doesn't provide an easy way to activate its license via command line, but thanks to some awesome contributors, we found a workaround! 

## How to build Unity3d projects in the cloud

This is probably what you're looking for. Before we get started, make sure you have some basic knowledge about Docker, Continuous Integration and Unity3d. I recommand you follow Getting Started for each of the above.

* [Getting started with docker]()
* [Getting started with gitlab-ci]()
* [Getting started with Unity3d]()

If you don't have a repository and a Unity project yet, follow this:

1. Create a repository at [gitlab.com](https://gitlab.com)
2. Clone the repository you just created on your computer
3. Make sure you use the right [.gitignore](https://github.com/github/gitignore/blob/master/Unity.gitignore), download it and place that file at the root of your project. You don't want to track the files generated by Unity that are different for everyone.
4. Create the Unity project using your locally installed Unity3d inside your local repository
5. Commit and push from here

Now we're ready to get started. 

---

If you have suggestions, feel free to poke me or [open an issue](https://github.com/GabLeRoux/gableroux.github.io/issues).

[saglacio]: http://saglac.io
[totemastudio]: https://totemastudio.com