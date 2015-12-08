kiss-latex-mindset
==================

I looked around for some LaTeX framework but definitely that's not what I'd like: I prefer to keep it simple, stupid so I tried to mingle some bare commands to make an easy-to-understand framework.

This is actually too simple to be called a framework, let's call it a mindset. It's rooted deep in the LaTeX philosophy: get content and formatting well separated; however, as this idea is applyed no on the text but on LaTeX files themselves, one could say it's __meta mindset__ :-)

## Should be implemented

 * Conf file precedence;
 * Add rake support just like [this repo](https://github.com/threedaymonk/latex-framework);
 * Any simple idea to automate LaTeX document compositiong.
 * Make sure `clean.sh` eventually preserves the tree structure and support out-commented lines.

## How to use it

This repository is almost empty so you can clone it and start working with it without any pull conflicts. I've considered all your data will be in a side repository called `data` so I've used symbolic links to separate what is private from what anybody can use and keep data and mindset well separated. Basically, all your data will go in the directory `../data/chapters`.

The script contained in `clean.sh` relies on two files: `.gitignore` and `.preserved`. Don't forget to run it before you commit something! It will help you to keep your work folder tidy.

 * It first copy any file whose refered within `.preserved` to `../data` (the side, private directory I talked about) and try to keep the same tree structure.
 * Then it remove anything that won't be commited.

This small project is meant to be used on a GNU operating system, with these softwares available on your system:

 * TeXstudio (an LaTeX IDE), not necessary though
 * pygmentize (for code sample highlighting)
 * xelatex (for font and compilation)

The following fonts are necessary to get this document to be compile, should you change it according your own gut: 教育部標準楷書, AR PL UKai TW MBE, AR PL UMing TW MBE, HanaMinA, HanaMinB, Unifont.

Compilation is done with a command like: `xelatex -8bit -shell-escape thesis.tex`.

Raw paths are passed in every input command so it allows LaTeX IDE like TeXstudio
to resolve it automatically and load the corresponding file on click.
Each file is not necessary tied to a single package but much more about a "domain".
Every package wich can not be meaningfully loaded within a general \usepackage{} command should be
wrapped in a configuration file.


## Licence

This is a free piece of code, you can fork it as you wish. Feel free to issue pull requests :-)

## Contributors or Examples

 * [threedaymonk](https://github.com/threedaymonk) just gave me the idea.
