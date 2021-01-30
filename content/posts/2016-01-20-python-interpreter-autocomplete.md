---
omit_header_text: true
categories:
    - python
date: 2016-01-20 15:00:00
featured_image: /images/pythonrc-history.png
tag: dotfile history python pythonrc autocomplete Jupyter interpreter
title: "Python interpreter autocomplete + history with ~/.pythonrc"
aliases:
    - /2016/01/20/python-interpreter-autocomplete/
    - /python/2016/01/20/python-interpreter-autocomplete/
---


Using great tools is important, using autocompletion with great tools is even better. Update: use [Jupyter][Jupyter], it's just amazing!

<!--more-->

## Never used python interpreter?

Try it now! [Install python][install-python] if it's not already the case and run `python` in a terminal. There you go, you're now inside a python interpreter!

![Bare python interpreter example](/images/python-interpreter.png)

## Get interpreter autocompletion and history

> I did an update, inspired by [twneale/gist:5245670](https://gist.github.com/twneale/5245670).

Here is what you're looking for, create this file:

`~/.pythonrc`

```python
import atexit
import os

try:
    import readline
except ImportError:
    print(".pythonrc :: Module readline not available.")
else:
    import rlcompleter

    readline.parse_and_bind("tab: complete")
    print(".pythonrc :: AutoCompletion Loaded")

    history_file = os.path.join(os.path.expanduser("~"), ".pyhistory")
    print(".pythonrc :: history file:", history_file)


    def save_history(history=history_file):
        import readline
        readline.write_history_file(history)
        print(".pythonrc :: history saved to " + history)


    def load_history(history=history_file):
        try:
            readline.read_history_file(history)
        except IOError:
            pass

    load_history()
    atexit.register(save_history)

    del readline, rlcompleter, atexit, history_file

# In addition to os, import some useful things

# noinspection PyUnresolvedReferences
import re

# noinspection PyUnresolvedReferences
from collections import *

# noinspection PyUnresolvedReferences
from itertools import *

```


Then, you need to tell python interpreter to use this `~/.pythonrc` file, so add the following line somewhere in an `rc` file (either `~/.bashrc` if you're using [bash][bash] or `~/.zshrc` for the awesome [oh-my-zsh][oh-my-zsh])

```python
export PYTHONSTARTUP=~/.pythonrc
```

You can also run this directly in your shell if you want to test before editing your `rc` file.

That's it, fire up a terminal, run `python` again and enjoy autocompletion when you hit `tab` key :D

![pythonrc terminal example](/images/python-interpreter-autocompletion.png)

All commands you type in a local interpreter are now recorded to `~/.pyhistory`. Hit `tab` when experimenting with modules from the interwebs and it will be much easier to discover all the things ✌🏻

## Want more?

For advanced usage, there are a few interpreters available that provide features out of the box such as syntax highlighting while you type:

* [bpython][bpython]
* [DreamPie][DreamPie]
* [IPython][IPython]
* [ptpython][ptpython]

I used [IPython][IPython] for a while and it's great:

![IPython usage example](/images/python-interpreter-ipython-usage-example.png)

## Even better, use [Jupyter][Jupyter]

[Jupyter][Jupyter] lets you manage notebooks with live code, syntax highlighting, visualizations, markdown and even [has a few extensions][Jupyter-extensions]. It's really worth [the try][Jupyter-try].

```bash
pip3 install jupyter
jupyter notebook
```

You'll love it and it's even more fun when used with `numpy` and `matplotlib`.

![jupyter localhost example](/images/python-interpreter-jupyter.png)

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
