---
layout: post
title:  "Save saltstack console colored output to file"
date:   2016-02-09 19:00
categories: tips
tags: saltstack console output
featured_image: /images/saltstack-colors-output.jpg
---

Not an expert with Salt yet, but wow, saltstack is such a great tool! Like colored output? What about saving colors to your log files?

<!-- more -->

Saltstack's output has colors for the great good, green when result is pass, pink when it's modified and red when it fails. Pretty much what you'd expect, easier to see what's wrong. Now when you start running commands on multiple servers, salt is pretty much handy, but what if you'd like to share the output with a teamate? Go for it, copy paste, plain white/black text. Here's a solution :)

## Console colors introduction

See [Bash Prompt HOWTO: Colors](http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html) for reference ;)

Now let's say I want cyan output
{% highlight bash %}
CYAN="\[\033[0;36m\]"
YELLOW="\[\033[0;33m\]"
NO_COLOUR="\[\033[0m\]"
echo "$CYAN\colors $NO_COLOUR\are $YELLOW\mainstream"
{% endhighlight %}

cool (todo: fixme)

## Keep colors 

Now, if you write this to a file

{% highlight bash %}
echo "$CYAN\colors $NO_COLOUR\are $YELLOW\mainstream" > a_file.txt
{% endhighlight %}

Have a look to this file, and it's plain text.

{% highlight bash %}
cat a_file.txt
colors are mainstream
{% endhighlight %}

Solution: `grep` to the rescue

echo "$CYAN\colors $NO_COLOUR\are $YELLOW\mainstream" | grep --color=always > a_file.txt

There are a few options available;

{% highlight bash %}
grep --color=auto
grep --color=always
grep --color=false (todo: confirm me)
{% endhighlight %}

## Read colored output from file

{% highlight bash %}
cat a_file.txt | less -r
{% endhighlight %}

`-r` is necessary as you'll see color codes in plain text otherwise, thanks to [this answer on stackoverflow](http://superuser.com/a/36045/55267) and it's first comment.

## keep salt colored output

Haven't talked much about salt, but in our case, salt command has a `--force-color` parameter [added here](https://github.com/saltstack/salt/issues/4121) which does similar to what grep does as shown above.

Solution to keep salt output looks pretty much like this:

{% highlight bash %}
salt-call state.highstate -l debug --force-color | tee salt.log
{% endhighlight %}

Using tee to keep std::out in current console + keeping it's output in a file at the same time. Since we're using `--force-color`, output keeps color. Now to read `salt.log`, you simply use `less -r`

{% highlight bash %}
cat salt.log | less -r
{% endhighlight %}

Awesome, salt colors!
