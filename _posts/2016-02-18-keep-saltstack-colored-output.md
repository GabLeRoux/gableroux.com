---
layout: post
title:  "Save saltstack console colored output to file"
date:   2016-02-18 8:00
categories: tips
tags: saltstack console output
featured_image: /images/such-terminal-colors.jpg
---

Not an expert with Salt yet, but wow, saltstack is such a great tool! Like colored output? What about saving colors to your log files? Chrome extension inside (help needed!)

<!-- more -->


---

> Hey, before we begin, I started playing around with colors in a terminal and tough it could be cool to have a chrome extension for this. Let's create [<i class="fa fa-github"></i> ANSI colors chrome extension][ansi-colors-chrome-extension] together!

---

## Alright let's begin

Saltstack's output has colors for the great good, green when result is pass, pink when it's modified and red when it fails.

![saltstack-output-example](/images/colors-in-shell-saltstack.png){: .center-block }

Pretty much what you'd expect, easier to see when something goes wrong. Now when you start running commands on multiple servers, salt is pretty much handy, but what if you'd like to share the output with a teamate? Go for it, copy paste, plain white/black text. Here's a solution :)

## Console colors

See [Bash Prompt HOWTO: Colors][Bash-Prompt-HOWTO/x329] for reference ;)

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

Values are [ANSI Escape Codes][ANSI_escape_code]. These environment variables comes by default with [Oh-my-zsh][oh-my-zsh] :)
 
{% highlight bash %}
echo "$TEXT_CYAN colors $TEXT_GREEN are $TEXT_RED mainstream"
{% endhighlight %}

![example for the above](/images/colors-in-shell-example.png){: .center-block }

## Colors and files

Now, depending on your shell, writing this to a shell with `>` should keep these ANSI characters, so when you `cat` the file again, you should see it with colors.

{% highlight bash %}
echo "$TEXT_CYAN colors $TEXT_GREEN are $TEXT_RED mainstream" > colored_file.txt && cat colored_file.txt
{% endhighlight %}

In my case, colors are kept and I'm happy with it (using [Oh-my-zsh][oh-my-zsh] with [iterm2 terminal emulator][iterm2]), but sometimes, it's not the case depending on the command or the shell being used.

## Read colored output from file

Depending on your shell and configuration, `less` command may not need additional parameters, but if you try to pipe a colored file to less and don't get any colors, try with `-r` parameter:

{% highlight bash %}
cat colored_file.txt | less -r
{% endhighlight %}

Thanks to [this answer on stackoverflow](http://superuser.com/a/36045/55267) and its comments.

## keep salt colored output

Haven't talked much about salt in current post so lets beggin. Writing salt output to a file doesn't keep ANSI colors. Luckily for us, salt command has a `--force-color` parameter [added in salt issue #4121][salt#4121].

![Salt colored output example](/images/salt-colored-output.png){: .center-block }

Solution to keep salt output looks pretty much like this:

{% highlight bash %}
salt-call state.highstate -l debug --force-color > salt.log
{% endhighlight %}

{% highlight bash %}
cat salt.log
{% endhighlight %}

Awesome, salt colors!

## What about clear text?

I you want to remove colored output, there are a few solutions available, here's a [question asking for a regex to remove ANSI Escape codes](http://superuser.com/q/380772/55267). My favorite answer is pretty much [ansi-strip-cli npm module][strip-ansi-cli]

{% highlight bash %}
npm install --g strip-ansi-cli
{% endhighlight %}

Usage:

{% highlight bash %}
cat colored_file.txt | strip-ansi
{% endhighlight %}

No more colors :)

Otherwise, you can strip output with `perl -pe 's/\x1b\[[0-9;]*[mG]//g'`.

{% highlight bash %}
cat colored_file.txt | perl -pe 's/\x1b\[[0-9;]*[mG]//g'
{% endhighlight %}

## salt solution

So with salt, I managed to get both output using the following:

{% highlight bash %}
salt-call state.highstate -l debug --force-color \
| tee salt-colored.log \
| tee >(strip-ansi > salt.log)
{% endhighlight %}

Prefer not to bloat your system with npm?

{% highlight bash %}
salt-call state.highstate -l debug --force-color \
| tee salt-colored.log \
| tee >(perl -pe 's/\x1b\[[0-9;]*[mG]//g' > salt.log)
{% endhighlight %}

Now you can enjoy salt output in both ways :)

{% highlight bash %}
cat salt-colored.log
cat salt.log
{% endhighlight %}

## What's the `tee` command?

Thanks to [tldr pages][tldr]

{% highlight bash %}
tldr tee
{% endhighlight %}

{% highlight text %}
  tee
  Read from standard input and write to standard output and files.

  - Copy standard input to each FILE, and also to standard output:
    echo "example" | tee FILE

  - Append to the given FILEs, do not overwrite:
    echo "example" | tee -a FILE
{% endhighlight %}

## Some random stuff because why not

Get [lolcat](http://osxdaily.com/2014/07/03/lolcat-rainbow-terminal-command-output/) for the lolz

{% highlight bash %}
gem install lolcat
{% endhighlight %}

![man ascii lolcat](/images/man-ascii-lolcat.png){: .center-block }

[ansi-colors-chrome-extension]: https://github.com/gableroux/ansi-colors-chrome-extension
[Bash-Prompt-HOWTO/x329]: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
[ANSI_escape_code]: https://en.wikipedia.org/wiki/ANSI_escape_code
[tldr]: http://tldr-pages.github.io/
[strip-ansi-cli]: https://github.com/chalk/strip-ansi-cli
[salt#4121]: https://github.com/saltstack/salt/issues/4121
[oh-my-zsh]: http://ohmyz.sh/
[iterm2]: https://iterm2.com/