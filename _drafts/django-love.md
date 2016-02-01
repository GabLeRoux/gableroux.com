---
layout: post
title:  "Django Love"
date:   2014-09-16 12:00
categories: django python
---

![django-love](/images/django-love.jpg)

> Django: The Web framework for perfectionists with deadlines

<!-- more -->

[Django](https://djangoproject.com) is an awesome [mvt](https://docs.djangoproject.com/en/dev/faq/general/#django-appears-to-be-a-mvc-framework-but-you-call-the-controller-the-view-and-the-view-the-template-how-come-you-don-t-use-the-standard-names) python framework that makes coding wonderful. It gets the job done in an elegant and awesome way.

In this article, I will cover:

* Django <span class="label label-info">good practices</span>
* Coding style
* Nice tips on how to import data from an older site
* I'll show you a project I open sourced to give you a real world example (aww yeah, pull requets are welcome).
  
## Why django

I used to work with some web frameworks usually written in php, [symfony](http://symfony.com/), [Laravel 4](http://laravel.com/), [Code igniter](http://www.codeigniter.com/), [Cake PHP](http://cakephp.org/), [Joomla](http://www.joomla.org/) (better than before, but still not impressed) and [Worpdress](https://wordpress.org/) (last two aren't really frameworks, wordpress may be considered a cms if you install a bunch of plugins like [Advanced Custom Fields](https://wordpress.org/plugins/advanced-custom-fields/) but that's another debate). Those tools are cool and powerful, but let's try something else than php. Learn Python and discover Django! Hard to handle at first when you're new to python but trust me, it makes you proud of your code and it's worth the time reading the docs as it does alot of things quickly out of the box so you'll have more time for what's important to solve.

If you are new to programming, continue reading at your own risk. If you're a programmer, but never used python before, you should at least read the [Learn X in Y minutes where X = python](http://learnxinyminutes.com/docs/python/). Now that you're ok with python, let's talk about awesomeness. 

## django best practice

First things first, visit [django's faq](https://docs.djangoproject.com/en/dev/faq/) and make sure your [pronouncing django right](http://red-bean.com/~adrian/django_pronunciation.mp3).

### the basics

**[Read the documentation](https://docs.djangoproject.com/en/dev/)**: Probably the most important recommendation, read everything, you'll learn alot. Most of the things you want to accomplish with django are usually covered in the docs. Take the time and things will go blazingly fast.

**Reuse code**: If you encounter a problem or need a solution for x problem, someone has probably already solved it. There are tons of usefull packages. Search in the right places; [PyPI - the Python Package Index](https://pypi.python.org/pypi) for your code and libs needs, you should also really have a look to [Django Packages](https://www.djangopackages.com/). *Pro tip: [order packages by usage count](https://www.djangopackages.com/categories/apps/?sort=usage_count) to find the most popular packages. First ones are really great and will save you lots of headaches*

**Learn by example**: There's a [Projects section in Django Packages](https://www.djangopackages.com/categories/projects/?sort=usage_count), read the code, find out great ideas and see how the pros work. Download examples, run them and see what's going on.

**Follow Python's philosophy**

    $ python
    Python 2.7.8 (default, Oct 19 2014, 16:02:00)
    [GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.54)] on darwin
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import this
    The Zen of Python, by Tim Peters

    Beautiful is better than ugly.
    Explicit is better than implicit.
    Simple is better than complex.
    Complex is better than complicated.
    Flat is better than nested.
    Sparse is better than dense.
    Readability counts.
    Special cases aren't special enough to break the rules.
    Although practicality beats purity.
    Errors should never pass silently.
    Unless explicitly silenced.
    In the face of ambiguity, refuse the temptation to guess.
    There should be one-- and preferably only one --obvious way to do it.
    Although that way may not be obvious at first unless you're Dutch.
    Now is better than never.
    Although never is often better than *right* now.
    If the implementation is hard to explain, it's a bad idea.
    If the implementation is easy to explain, it may be a good idea.
    Namespaces are one honking great idea -- let's do more of those!
    >>>

Keep it simple and stupid, write clear code, write down ideas. Oh, and try importing `antigravity`, it will show you how python is cool ;)

    >>> import antigravity
