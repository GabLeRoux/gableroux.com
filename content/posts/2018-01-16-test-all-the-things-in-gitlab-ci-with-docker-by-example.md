---
categories:
  - saglacio
date: 2018-01-16 20:15:00
featured_image: /images/test-all-the-things-in-gitlab-ci-with-docker-by-example.jpg
tags:
  - gitlab
  - gitlab-ci
  - ci
  - docker
  - testing
  - example
  - presentation
title: "Test all the things in gitlab-ci with docker by example"
url: /2018/01/16/test-all-the-things-in-gitlab-ci-with-docker-by-example/
---


Do you write tests? Or do you skip them because it’s too complicated to run? Or maybe developers on your team just don’t care? You should take a few minutes and set up CI so you can enforce good practices. Good news, you can test [all the things](http://knowyourmeme.com/memes/all-the-things) automagically in [GitLab CI/CD](https://about.gitlab.com/features/gitlab-ci-cd/) with Docker and very little effort 🤘

<!--more-->

_Edit: This blog post was [re-posted on gitlab.com's blog](https://about.gitlab.com/2018/02/05/test-all-the-things-gitlab-ci-docker-examples/) 🎉_

I gave a presentation at the [SagLacIO][saglacio]. This time, it was about **[gitlab-ci][gitlab-ci]**.

## Getting started

First, you’ll need an account at [GitLab.com][gitlab.com]. If you don’t already have one, you can open an account with no problem. [GitLab’s free tier](https://about.gitlab.com/products/) gives you a ton of features, unlimited free hosted repositories, 2,000 CI build minutes per month, etc. You can even use your own task runners in case you bust that limit.

## Useful Links

* [GitLab.com][gitlab.com]
* [GitLab CI/CD documentation](https://docs.gitlab.com/ee/ci/README.html) 📗
* [.gitlab-ci.yml documentation](https://docs.gitlab.com/ee/ci/yaml/README.html) 📕
* [.gitlab-ci.yml linter: gitlab.com/ci/lint](https://gitlab.com/ci/lint/) ✅
* [gitlab-ci nodejs example project](https://gitlab.com/gableroux/gitlab-ci-example-nodejs)
* [gitlab-ci Docker example project](https://gitlab.com/gableroux/gitlab-ci-example-docker)
* [gitlab-ci django example project](https://gitlab.com/gableroux/gitlab-ci-example-django)
* [Unity3D Docker project](https://gitlab.com/gableroux/unity3d) running in gitlab-ci and published to [Docker Hub](https://hub.docker.com/r/gableroux/unity3d/)
* [How to publish Docker images to Docker Hub from gitlab-ci on Stack Overflow](https://stackoverflow.com/questions/45517733/how-to-publish-docker-images-to-docker-hub-from-gitlab-ci)

## Here go the slides

Scroll through the slides from my presentation on GitLab CI/CD at [SagLacIO][saglacio], you’ll have fun 🤘

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <iframe src="https://docs.google.com/presentation/d/10835yig54EbR_OQcxSXURkPk_0zkhLxaWHdRdXb-yWw/embed?start=false&loop=false&delayms=3000" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

---

If you have suggestions, feel free to poke me or [open an issue](https://github.com/GabLeRoux/gableroux.github.io/issues).

[saglacio]: http://saglac.io
[gitlab-ci]: https://about.gitlab.com/features/gitlab-ci-cd/
[docker]: https://www.docker.com/
[gitlab.com]: https://gitlab.com/