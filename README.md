# Clojure Emacs Setup

It's basic ~100 lines user friendly setup for Emacs beginners which provides comfortable Clojure development environment.

![look](https://dl.dropboxusercontent.com/u/2428018/Screenshots/1b.png)

## Plugins

* Clojure mode
* Paredit
* Parentheses Highlighting
* NREPL
* Auto Completion
* Lisp Indentation
* Textmate mode
* [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme)

### Off by deafult

* Line numbers
* Relative line numbers
* Vim-mode
* Whitespaces cleaning

## Installation

1. Download Emacs
  1. [Emacs for MacOS](http://emacsformacosx.com/)
  2. Linux
  3. Windows
2. `git clone git@github.com:edtsech/clojure-emacs-setup.git ~/.emacs.d`

## Usage

### Emacs basics

* `C-x C-f` - "find" file i.e. open/create a file in buffer
* `C-x b`   - create/switch buffers
* `C-x C-b` - show buffer list
* `C-x k`   - kill buffer
* `C-x 2`   - split window horizontally
* `C-x 3`   - split window vertically
* `C-x 0`   - close current window(split)

[Full Emacs Command List](http://cse.unl.edu/~choueiry/S08-476-876/Documents/emacs_ref.html)

### Plugins

#### Paredit

1. `C-<right>` (def) a -> (def a)
2. `C-<left>`  (def a) -> (def) a

[Paredit Cheetsheet](http://www.emacswiki.org/emacs/PareditCheatsheet)

#### Auto completion

Just use `tab` key.

#### NREPL

`M` - is meta key, can be redefined, but usually its Alt key 

1. `C-c M-j` or `M-x nrepl-jack-in` - connect to nREPL
2. `C-M-x` - evaluate the top level form
3. `M-.` - jump to the definition of a symbol
4. `M-,` - return to your pre-jump location

[NREPL Keyboard shortcuts](https://github.com/kingtim/nrepl.el#keyboard-shortcuts)

#### Textmate mode

1. `⌘t` - go to file
2. `⌘l` - go to line
3. `⌘/` - comment line

[Textmate mode README](https://github.com/defunkt/textmate.el/blob/master/README.markdown)

### Customize

#### Indentation

``` clj
;; Set Compojure indentation
;; (put <macro|function> 'clojure-backtracking-indent '(<indent-first-arg> <indent-second-arg> ...)
(put 'GET 'clojure-backtracking-indent '(2 2 2))
(put 'POST 'clojure-backtracking-indent '(2 2 2))
(put 'PUT 'clojure-backtracking-indent '(2 2 2))
(put 'DELETE 'clojure-backtracking-indent '(2 2 2))
(put 'PATCH 'clojure-backtracking-indent '(2 2 2))
```

## Improvements

If you have some ideas how to improve the setup, I'm happy to participate.
And if you need some help or you have a problem ping me on twitter([@edtsech](https://twitter.com/edtsech)) 
or send me an email.

## Setups for other editors

* [SublimeText](http://www.youtube.com/watch?v=wBl0rYXQdGg)
* Vim ???
