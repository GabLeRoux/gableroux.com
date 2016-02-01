---
layout: post
title:  "Python interpreter autocomplete + history with ~/.pythonrc"
date:   2015-07-27 15:00:00
categories: python
tag: dotfile history python pythonrc autocomplete
---

![Hello ~/.pythonrc](/images/hello-pelican.jpg)

Using great tools is great, using autocompletion with great tools is even better!

<!-- more -->

## Ever used python interpreter?

You should, [install python][install-python] if it's not already the case and run `python` in your terminal. Awesome, an interpreter!

## Autocomplete

Yes that's right, here is what you're looking for. Create this file:

`~/.pythonrc`

{% highlight python %}
import atexit, os, sys, readline, rlcompleter

readline.parse_and_bind('tab:complete')

print(".pythonrc :: AutoCompletion Loaded")

# History
historyPath = os.path.expanduser("~/.pyhistory")


def save_history(historyPath=historyPath):
    import readline
    readline.write_history_file(historyPath)
    print(".pythonrc :: history saved to " + historyPath)

if os.path.exists(historyPath):
    readline.read_history_file(historyPath)

atexit.register(save_history)
{% endhighlight %}

Then, you need to tell python interpreter to use this `~/.pythonrc` file, so add the following line somewhere in an `rc` file (either `~/.bashrc` if you're using [bash][bash] or `~/.zshrc` for the awesome [oh-my-zsh][oh-my-zsh])

{% highlight python %}
export PYTHONSTARTUP=~/.pythonrc
{% endhighlight %}

You can also run this directly in your shell if you want to test before editing your rc file.

That's it, fire up a terminal, run `python` again and enjoy autocompletion with tab.

![pythonrc terminal example](/images/python-interpreter-autocompletion.png)

[install-python]: https://www.python.org/downloads/
[bash]: https://fr.wikipedia.org/wiki/Bourne-Again_shell
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh