;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(doom! 
       :completion
       (company +auto)
       (ivy +icons +prescient)

       :ui
       doom
       doom-dashboard
       hl-todo
       modeline
       nav-flash
       treemacs
       (popup +all +defaults)
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces
       ophints

       :editor
       (evil +everywhere)
       file-templates
       format
       multiple-cursors
       rotate-text
       fold
       snippets

       :emacs
       (dired +ranger +icons)
       electric
       imenu
       vc

       :term
       vterm
       eshell

       :tools
       lsp
       flycheck
       editorconfig
       magit
       pdf
       eval
      (lookup +devdocs)
      macos
       ;;wakatime

       :lang
       data
       ;;elm
       emacs-lisp
       haskell
       (javascript +lsp)
       latex
       markdown
       (org +attach +babel +capture +export +present)
       ;;purescript
       rest
       sh
       ;;swift
       web

       :app

       :config
       (default +bindings +smartparens))
