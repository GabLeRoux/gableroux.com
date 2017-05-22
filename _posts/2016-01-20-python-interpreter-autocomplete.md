---
layout: post
title:  "Python interpreter autocomplete + history with ~/.pythonrc"
date:   2016-01-20 15:00:00
categories: python
tag: dotfile history python pythonrc autocomplete Jupyter interpreter
featured_image: /images/pythonrc-history.png
---

Using great tools is important, using autocompletion with great tools is even better. Update: use [Jupyter][Jupyter], it's just amazing!

<!-- more -->

## Never used python interpreter?

Try it now! [Install python][install-python] if it's not already the case and run `python` in a terminal. There you go, you're now inside a python interpreter!

![Bare python interpreter example](/images/python-interpreter.png){: .center-block }

## Get interpreter autocompletion and history

Here is what you're looking for, create this file:

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

You can also run this directly in your shell if you want to test before editing your `rc` file.

That's it, fire up a terminal, run `python` again and enjoy autocompletion when you hit `tab` key :D

![pythonrc terminal example](/images/python-interpreter-autocompletion.png){: .center-block }

All of the commands you type in a local interpreter are now recorded to `~/.pyhistory`. Hit `tab` when experimenting with modules from the interwebs and it will be much easier to discover all the things :)

## Want more?

For advanced usage, there are a few interpreters available that provide features out of the box such as syntax highlighting while you type:

* [bpython][bpython]
* [DreamPie][DreamPie]
* [IPython][IPython]
* [ptpython][ptpython]

I used [IPython][IPython] for a while and it's great:

![IPython usage example](/images/python-interpreter-ipython-usage-example.png){: .center-block }

## Even better, use [Jupyter][Jupyter]

[Jupyter][Jupyter] lets you manage notebooks with live code, syntax highlighting, visualizations, markdown and even [has a few extensions][Jupyter-extensions]. It's really worth [the try][Jupyter-try].

{% highlight bash %}
pip3 install jupyter
jupyter notebook
{% endhighlight %}

You'll love it and it's even more fun when used with `numpy` and `matplotlib`.

![jupyter localhost example](/images/python-interpreter-jupyter.png){: .center-block }

Oh and you can save them [as gists][the-zen-of-python.ipynb] which is wonderful for sharing and embedding:

<script src="https://gist.github.com/GabLeRoux/a0bdab051ea6bd6f2a2b55dcb336e677.js?file=the-zen-of-python.ipynb"></script>

Neat eh?

---

Found a typo? Have a suggestion? [Open an issue](https://github.com/gableroux/gableroux.github.io/issues) or send me a [pull-request](https://github.com/gableroux/gableroux.github.io/pulls)!

[bash]: https://fr.wikipedia.org/wiki/Bourne-Again_shell
[bpython]: https://bpython-interpreter.org
[DreamPie]: http://www.dreampie.org/
[install-python]: https://www.python.org/downloads/
[IPython]: http://ipython.org/
[Jupyter]: https://jupyter.org/
[Jupyter-extensions]: http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions.html
[Jupyter-try]: https://try.jupyter.org/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[ptpython]: https://github.com/jonathanslenders/ptpython
[the-zen-of-python.ipynb]: https://gist.github.com/GabLeRoux/a0bdab051ea6bd6f2a2b55dcb336e677
