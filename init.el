;;; init.el -*- lexical-binding: t; -*-

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(setq doom-font (font-spec :family "Iosevka" :size 15)
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
       vc-gutter
       fci
       pretty-code

       :tools
       editorconfig
       magit
       pdf

       :emacs
       dired
       vc
       electric
       imenu
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

       :config
       (default +bindings +snippets +evil-commands)
)
