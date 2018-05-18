;;; init.el -*- lexical-binding: t; -*-

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(setq doom-font (font-spec :family "Iosevka" :size 15)
      doom-variable-pitch-font (font-spec :family "Iosevka")
      doom-unicode-font (font-spec :family "Iosevka" :size 12)
      doom-big-font (font-spec :family "Iosevka" :size 19))

(doom! :feature
       eval
       (evil +everywhere)
       file-templates
       (lookup
        +devdocs
        +docsets)
       snippets
       syntax-checker
       version-control
       workspaces

       :completion
       (company
        +auto
        +childframe)
       (ivy
        +childframe)

       :ui
       (popup +all +defaults)
       doom
       doom-dashboard
       doom-modeline
       hl-todo
       vi-tilde-fringe
       window-select

       :tools
       dired
       editorconfig
       electric-indent
       imenu
       magit
       pdf
       term

       :lang
       data
       emacs-lisp
       (haskell +intero)
       javascript
       markdown
       (org
        +attach
        +babel
        +capture
        +export
        +present
        +publish)
       purescript
       web

       :private
       (default +bindings +snippets +evil-commands)
)
