---
layout: post
title:  "Pelican Gruntfile"
date:   2014-08-17 12:00
categories: Pelican grunt gruntfile coffeescript
---

![grunt](/images/grunt-logo-large.jpg)

Now that I use [grunt, the JavaScript Task Runner][gruntjs] my life has changed! It makes task automation so cool that it is a must have in every web project (and even sometime in other projects!). There's also a great alternative called [Gulp.js][gulpjs]. It is probably better if you are starting, but because I am used to Grunt, I did not move to that fancy new tool *yet*.

<!-- more -->

## Pelican automation

I searched `pelican gruntfile` on [duckduckgo][duckduckgo] and found nothing very interesting. There is this [grunt-pelican repo][grunt-pelican-repo] but it doesn't seem to work right at the time of writing this article and its ReadMe is missing some code. 

Because pelican is easy to use, I decided to make my own `gruntfile` instead! After around half an hour, I managed to get something interesting.

### How to

First, create a `package.json` file to save dependencies using this command:

{% highlight bash %}
npm init
{% endhighlight %}

Then, install the fun stuff

{% highlight bash %}
npm install --save-dev grunt-coffeelint grunt-contrib-coffee grunt-contrib-connect grunt-contrib-jshint   grunt-contrib-sass grunt-contrib-watch grunt-shell load-grunt-tasks
{% endhighlight %}

Everything will be saved in your `package.json`, so next time you want to install them, you only have to run `npm install`. The package file will contain something like this:

{% highlight json %}
"devDependencies": {
    "coffeelint": "^1.5.6",
    "grunt-coffeelint": "0.0.13",
    "grunt-contrib-coffee": "^0.11.1",
    "grunt-contrib-connect": "^0.8.0",
    "grunt-contrib-jshint": "^0.10.0",
    "grunt-contrib-sass": "^0.7.4",
    "grunt-contrib-watch": "^0.6.1",
    "grunt-shell": "^0.7.0",
    "load-grunt-tasks": "^0.6.0"
}
{% endhighlight %}
### The Gruntfile

Here's my awesome `Gruntfile.coffee`:

{% highlight coffeescript %}
module.exports = (grunt) ->
  # Load all grunt tasks.
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    # watch for files and load tasks when files change
    watch:
      coffee:
        files: ['theme/gableroux/static/js/*.coffee']
        tasks: ['coffeelint', 'coffee', 'shell']
      jshint:
        files: ['theme/gableroux/static/js/*.js']
        tasks: ['jshint', 'shell']
      md:
        files: ['content/**/*.md', '!output', '!node_modules']
        tasks: ['shell']
      scss:
        files: ['theme/gableroux/static/css/**/*.scss']
        tasks: ['scss', 'shell']
      output:
        options:
          livereload: true
        files: ['output/**/*']

    # execute pelican to generate static files
    shell:
      pelican:
        command: "pelican"

    scss:
      options:
        style: 'expanded'
      files:
        'theme/gableroux/static/css/main.css': 'theme/gableroux/static/css/main.scss'

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      all:
        src: ['theme/gableroux/static/js/*.coffee']

    jshint:
      options:
        jshintrc: 'theme/gableroux/static/js/jshintrc'
      all:
        src: ['theme/gableroux/static/js/*.js']

    coffee:
      compile:
        expand: true
        src: ['theme/gableroux/static/js/*.coffee']
        ext: '.js'

    connect:
      server:
        options:
          port: 8000
          hostname: '*'
          base: 'output'

    clean:
      test:
        src: ['output']

  grunt.registerTask 'test', [
    'coffeelint'
    # 'jshint'
  ]

  # Default task when typing grunt without parameter in the cli.
  grunt.registerTask 'default', [
    'test'
    'shell'
    'connect'
    'watch'
  ]
{% endhighlight %}

*Note*: make sure you have `pelican` installed with `pip install pelican`. Replace `gableroux` with your own theme name (where your magic files are stored) and enjoy the Grunt awesomeness by running `grunt` in a terminal.

Here's the `jshintrc` file I used:

{% highlight json %}
{
    "esnext": true,
    "bitwise": true,
    "camelcase": true,
    "curly": true,
    "eqeqeq": true,
    "immed": true,
    "indent": 4,
    "latedef": true,
    "newcap": true,
    "noarg": true,
    "quotmark": "single",
    "undef": true,
    "unused": false,
    "strict": true,
    "trailing": true,
    "smarttabs": true,
    "white": true
}
{% endhighlight %}

And my `coffeelint.json` file:

{% highlight json %}
{
  "indentation": {
    "value": 2
  },
  "max_line_length": {
    "level": "ignore"
  },
  "line_endings": {
    "level": "error"
  },
  "arrow_spacing": {
    "level": "error"
  },
  "space_operators": {
    "level": "error"
  },
  "cyclomatic_complexity": {
    "level": "error"
  },
  "empty_constructor_needs_parens": {
    "level": "error"
  },
  "no_empty_param_list": {
    "level": "error"
  },
  "no_unnecessary_fat_arrows": {
    "level": "error"
  }
}
{% endhighlight %}

> Why coffeescript? Visit [coffeescript's website][coffeescript], click on "try coffeescript", copy/paste my Gruntfile.coffee and see how it is easier to read in coffee. Consider this as syntax sugar, but when it comes to [extending javascript classes][coffeescript-classes], I really prefer using coffeescript.

## The fun part
Now, when I write new content in markdown files, or when I edit my theme, my browser **automagically** refresh my website using [LiveReload Chrome Extension][livereload] on my second screen. Having a workflow updating like this lets me write quality content (can you confirm this?), instead of running a bunch of scripts manually every time only to fix a typo on a blog post.

Grunt rocks.  
Enjoy

## September 2015 edit

You should use [Browser Sync][browsersync] instead, it's even more awesome!

[gruntjs]: http://www.gruntjs.com/
[gulpjs]: http://gulpjs.com/
[duckduckgo]: https://duckduckgo.com/
[grunt-pelican-repo]: https://github.com/chuwy/grunt-pelican/
[livereload]: https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
[coffeescript]: http://coffeescript.org/
[coffeescript-classes]: http://coffeescript.org/#classes
[browsersync]: http://www.browsersync.io/