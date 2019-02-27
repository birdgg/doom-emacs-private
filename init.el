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
       ;;pretty-code
       vc-gutter
       vi-tilde-fringe
       window-select

       :editor
       (format +onsave)
       multiple-cursors
       rotate-text
       fold

       :emacs
       (dired +ranger)   ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       eshell            ; a consistent, cross-platform shell (WIP)
       imenu             ; an imenu sidebar and searchable code index
       term              ; terminals in Emacs
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
       ;;assembly
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
       ;;notmuch
       ;;crm
       ;;(email +gmail)
       ;;irc
       ;;regex
       ;;(rss +org)
       ;;torrents
       ;;twitter
       ;;(write
       ;; +wordnut
       ;; +langtool)

       :config
       (default +bindings +smartparens))
