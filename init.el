;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-
(doom!
       :completion
       (company +childframe)
       (vertico +icons)
       ;; (helm +fuzzy +icons)
       ;; (ivy +fuzzy +prescient +icons)

       :ui
       doom
       doom-dashboard
       hl-todo
       indent-guides
       modeline
       (treemacs +lsp)
       nav-flash
       ophints
       (popup +all +defaults)
       vc-gutter
       vi-tilde-fringe
       workspaces
       ;; window-select
       ligatures
       ;; (emoji +ascii +github +unicode)
       zen

       :editor
       (evil +everywhere)
       (format +onsave)
       multiple-cursors
       fold
       snippets
       file-templates

       :emacs
       (dired +ranger +icons)
       electric
       (ibuffer +icons)
       undo
       ;; vc

       :term
       vterm

       :checkers
       (syntax +childframe)

       :tools
       (lsp +peek)
       (lookup +dictionary +docsets +offline)
       editorconfig
       magit
       (eval +overlay)
       pdf
       rgb
       tree-sitter

       :lang
       emacs-lisp
       (javascript +lsp)
       web
       (markdown +grip)
       yaml
       (org
        +present
        +dragndrop
        +journal
        +roam2
        +gnuplot
        +hugo
        +noter
        +pomodoro
        +pretty)

       :os
       macos

       :app
       ;; calendar

       :config
       (default +bindings +smartparens))
