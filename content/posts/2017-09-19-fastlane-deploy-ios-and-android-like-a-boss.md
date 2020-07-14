---
categories:
  - saglacio
date: 2017-09-19 19:00:00
featured_image: /images/fastlane-automate-deployment-like-a-boss.jpg
tags:
  - fastlane
  - presentation
  - ios
  - android
  - deployment
title: "Fastlane: deploy ios and android like a boss"
url: /2017/09/19/fastlane-deploy-ios-and-android-like-a-boss/
---


> Sorry, we can't deploy, john is on vacation

Your team shouldn't rely on only one person to release your mobile apps.

<!--more-->

Once again, I gave a presentation at the [SagLacIO][saglacio]. This time, it was about **[Fastlane][Fastlane]**. Here are a few links to get you started.

## Getting started

Install ruby and start having fun:

```bash
sudo gem install fastlane
fastlane init
```

Then follow instructions. If your app has both ios and android (ex; cordova, ionic, react native, hybrid project), I recommend starting with ios. You can add android support later by [following the android documentation](https://docs.fastlane.tools/getting-started/android/setup/).

## Useful Links

* Official website: [fastlane.tools](https://fastlane.tools)
* Github: [github.com/fastlane/fastlane](https://github.com/fastlane/fastlane)
* Getting started: [fabric.io/features](https://fabric.io/features/)
* Example public repos using fastlane: [github.com/fastlane/examples](https://github.com/fastlane/examples)
* Documentation: [docs.fastlane.tools](https://docs.fastlane.tools/)
* Plugins: [docs.fastlane.tools/plugins/available-plugins](https://docs.fastlane.tools/plugins/available-plugins/)
* The guy behind Fastlane: [Felix Krause (krausefx)](https://krausefx.com)

## How to solve the "only one person can release an ios app"

You may share the certs by your own or **Follow [codesigning.guide](https://codesigning.guide/)** and let `fastlane match` handle everything for you!

## Here goes the slides

I gave a quick explanation of what problems fastlane solves and I went trough a complete example of doing the `fastlane init` and `fastlane ios beta` to send an app on itunes connect!

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <iframe src="https://docs.google.com/presentation/d/143Sj5xU_ZhMGYRg74NHw8Fky98ZxBY_-u7ltYCkHQhw/embed?start=false&loop=false&delayms=3000" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

---

If you have suggestions, feel free to poke me or [open an issue](https://github.com/GabLeRoux/gableroux.github.io/issues).

[saglacio]: http://saglac.io
[fastlane]: https://fastlane.tools/