---
layout: post
title:  "Save saltstack console colored output to file"
date:   2016-02-09 19:00
categories: tips
tags: saltstack console output
featured_image: /images/such-terminal-colors.png
---

Not an expert with Salt yet, but wow, saltstack is such a great tool! Like colored output? What about saving colors to your log files?

<!-- more -->

Saltstack's output has colors for the great good, green when result is pass, pink when it's modified and red when it fails. Pretty much what you'd expect, easier to see what's wrong. Now when you start running commands on multiple servers, salt is pretty much handy, but what if you'd like to share the output with a teamate? Go for it, copy paste, plain white/black text. Here's a solution :)

## Console colors

See [Bash Prompt HOWTO: Colors](http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html) for reference ;)

Here are some env variable colors

{% highlight text %}
export TEXT_BLACK=$'\033'\[30m
export TEXT_RED=$'\033'\[31m
export TEXT_GREEN=$'\033'\[32m
export TEXT_YELLOW=$'\033'\[33m
export TEXT_BLUE=$'\033'\[34m
export TEXT_MAGENTA=$'\033'\[35m
export TEXT_CYAN=$'\033'\[36m
export TEXT_WHITE=$'\033'\[37m
{% endhighlight %}

Values are [ANSI Escape Codes](https://en.wikipedia.org/wiki/ANSI_escape_code). These environment variables comes by default with [Oh-my-zsh](http://ohmyz.sh/) :)
 
{% highlight bash %}
echo "$TEXT_CYAN colors $TEXT_GREEN are $TEXT_RED mainstream"
{% endhighlight %}

![example for the above](/images/colors-in-shell-example.png){: .center-block }

## Colors and files

Now, depending on your shell, writing this to a shell with `>` should keep these ANSI characters, so when you `cat` the file again, you should see it with colors.

{% highlight bash %}
echo "$TEXT_CYAN colors $TEXT_GREEN are $TEXT_RED mainstream" > colored_file.txt && cat colored_file.txt
{% endhighlight %}

In my case, colors are kept and I'm happy with it, but sometimes, it's not the case depending on the command

## Read colored output from file

Depending on your shell and configuration, `less` command may not need additional parameters, but if you try to pipe a colored file to less and don't get any colors, try with `-r` parameter:

{% highlight bash %}
cat colored_file.txt | less -r
{% endhighlight %}

Thanks to [this answer on stackoverflow](http://superuser.com/a/36045/55267) and its comments.

## keep salt colored output

Haven't talked much about salt yet, but writing salt output to a file doesn't keep ANSI colors. Luckily for us, salt command has a `--force-color` parameter [added here](https://github.com/saltstack/salt/issues/4121).

![Salt colored output example](/images/salt-colored-output.png){: .center-block }

Solution to keep salt output looks pretty much like this:

{% highlight bash %}
salt-call state.highstate -l debug --force-color | tee salt.log
{% endhighlight %}

Awesome, salt colors!

## What about clear text?

I you want to remove colored output, there are a few solutions available, here's a [question asking for a regex to remove ANSI Escape codes](http://superuser.com/q/380772/55267). My favorite answer is pretty much [ansi-strip-cli npm module](https://github.com/chalk/strip-ansi-cli)

{% highlight bash %}
npm install --g strip-ansi-cli
{% endhighlight %}

Usage:

{% highlight bash %}
cat colored_file.txt | strip-ansi
{% endhighlight %}

No more colors :)

## Fun

Have a look to [lolcat](http://osxdaily.com/2014/07/03/lolcat-rainbow-terminal-command-output/), that's what I used in the header picture.