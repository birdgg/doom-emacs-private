;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(doom! :feature
       eval
       (evil +everywhere)
       (lookup +devdocs)
       snippets
       file-templates
       spellcheck
       (syntax-checker +childframe)
       workspaces

       :completion
       (company +auto)
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
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text

       :emacs
       (dired +ranger)   ; making dired pretty [functional]
       ediff             ; comparing files in Emacs
       electric          ; smarter, keyword-based electric-indent
       eshell            ; a consistent, cross-platform shell (WIP)
       hideshow          ; basic code-folding support
       imenu             ; an imenu sidebar and searchable code index
       term              ; terminals in Emacs
       vc

       :tools
       editorconfig      ; let someone else argue about tabs vs spaces
       ;;gist              ; interacting with github gists
       ;;macos             ; MacOS-specific commands
       magit             ;
       ;;make              ; run make tasks from Emacs
       password-store    ; password manager for nerds
       pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;rgb               ; creating color strings
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       ;;wakatime

       :lang
       ;;assembly
       data
       ;;elm
       emacs-lisp
       (haskell +intero)
       javascript
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
