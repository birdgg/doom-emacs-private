;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(doom! :feature
       eval
       (evil +everywhere)
       (lookup +devdocs)
       snippets
       file-templates
       workspaces

       :completion
       (company +auto +childframe)
       (ivy +fuzzy)

       :ui
       doom
       doom-dashboard
       evil-goggles
       hl-todo
       modeline
       nav-flash
       treemacs
       (popup +all +defaults)
       (pretty-code +iosevka)
       vc-gutter
       vi-tilde-fringe
       window-select

       :editor
       (format +onsave)
       multiple-cursors
       rotate-text
       fold

       :emacs
       (dired +ranger)
       electric
       eshell
       imenu
       term
       vc

       :tools
       lsp
       flyspell
       flycheck
       editorconfig      ; let someone else argue about tabs vs spaces
       magit             ;
       password-store    ; password manager for nerds
       pdf               ; pdf enhancements
       ;;wakatime

       :lang
       data
       ;;elm
       emacs-lisp
       (haskell +lsp)
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
