---
layout: post
title:  "Test all the things in gitlab-ci with docker by example"
date:   2018-01-16 20:15
categories: saglacio
tags: gitlab gitlab-ci ci docker testing example presentation
featured_image: /images/test-all-the-things-in-gitlab-ci-with-docker-by-example.jpg
---

Do you write tests? Or do you skip them because it's too complicated to run? Or maybe developers of your team just don't care? You should take a few minutes and setup a CI so you can enforce good practice. Good news, you can test all the things automagically in **[gitlab-ci][gitlab-ci]** with [docker][docker] and very low efforts 🤘

<!-- more -->

I gave a presentation at the [SagLacIO][saglacio]. This time, it was about **[gitlab-ci][gitlab-ci]**.

## Getting started

First, you'll need an account at [gitlab.com][gitlab.com]. If it's not already the case, _just do it_. [Gitlab's free tier (Community Edition (CE))](https://about.gitlab.com/products/) gives you a ton of features, unlimited free hosted repositories, 2000 CI build minutes per month, etc. You can even run your own runners in case you bust that limit.

## Useful Links

* [gitlab.com][gitlab.com]
* [gitlab-ci documentation](https://docs.gitlab.com/ce/ci/) 📗
* [.gitlab-ci.yml documentation](https://docs.gitlab.com/ce/ci/yaml/README.html) 📕
* [.gitlab-ci.yml **linter**: gitlab.com/ci/lint](https://gitlab.com/ci/lint/) ✅
* [gitlab-ci **nodejs** example project](https://gitlab.com/gableroux/gitlab-ci-example-nodejs)
* [gitlab-ci **docker** example project](https://gitlab.com/gableroux/gitlab-ci-example-docker)
* [gitlab-ci **django** example project](https://gitlab.com/gableroux/gitlab-ci-example-django)
* [**Unity3D Docker** project](https://gitlab.com/gableroux/unity3d) running in gitlab-ci and [published to docker hub](https://hub.docker.com/r/gableroux/unity3d/)
* [How to publish docker images to docker hub from gitlab-ci on stackoverflow](https://stackoverflow.com/questions/45517733/how-to-publish-docker-images-to-docker-hub-from-gitlab-ci)

## Here goes the slides

Scroll through the slides, you'll have fun 🤘

<div class="responsive-iframe-wrapperr">
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
