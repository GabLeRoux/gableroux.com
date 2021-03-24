---
omit_header_text: true
categories:
    - presentation
date: 2021-03-23 20:00:00
featured_image: /images/nextjs-tests-versel-deployment-saglacio.png
tags:
    - saglacio
    - presentation
    - react
    - jest
    - testing
    - vercel
title: "next.js + tests + vercel deployment"
---

I gave a presentation at the [SagLacIO][saglacio] on how to setup **jest** testing in **NextJS** and deploy with **Vercel**.

<!--more-->

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQQeCIYpB3U7AfJtFoSiDe8SECrDQw6_chVais4jj2KwTOqOaONrNoKV3OrNKoA3GMmJmJK50wpLl7f/embed?start=false&loop=false&delayms=3000" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

## Example project

The following project was created as part of this presentation:

* https://gitlab.com/gableroux/my-awesome-next-app

 The files you should be interested in:

 * [`package.json`](https://gitlab.com/gableroux/my-awesome-next-app/-/blob/main/package.json): package versions and commands
 * [`setupTests.js`](https://gitlab.com/gableroux/my-awesome-next-app/-/blob/main/setupTests.js): The config used by `npm run test` (aka `next test`)
 * [`jest.config.js`](https://gitlab.com/gableroux/my-awesome-next-app/-/blob/main/jest.config.js): the `jest` config
 * [`.babelrc`](https://gitlab.com/gableroux/my-awesome-next-app/-/blob/main/.babelrc): the `babel` config
 * [`tests/index.test.js`](https://gitlab.com/gableroux/my-awesome-next-app/-/blob/main/src/tests/index.test.js): The test being executed
 * [`.gitlab-ci.yml`](https://gitlab.com/gableroux/my-awesome-next-app/-/blob/main/.gitlab-ci.yml): The file telling gitlab-ci to run the build and the tests

## The real solution

Thanks to [@m0xx](https://github.com/m0xx) for pointing this out; **Use NextJS examples directly instead**:  
https://github.com/vercel/next.js/tree/master/examples/with-jest

```bash
npx create-next-app --example with-jest with-jest-app
```

🎉

## Links from the presentation

* https://tlm.ninja/
* https://totemastudio.com/
* **https://nextjs.org/docs**
* https://medium.com/frontend-digest/setting-up-testing-library-with-nextjs-a9702cbde32d
* **https://jestjs.io/**
* https://github.com/keyz/identity-obj-proxy
* https://medium.com/@nate.d.gage/configuring-jest-with-next-js-6670f0026dd9
* https://stackoverflow.com/questions/62690747/next-js-api-is-back-end
* **https://vercel.com/**
* **https://gitlab.com/gableroux/my-awesome-next-app**
* **https://my-awesome-next-app.vercel.app/**

---

If you have suggestions, feel free to poke me or [open an issue](https://github.com/GabLeRoux/gableroux.github.io/issues).

[saglacio]: http://saglac.io
