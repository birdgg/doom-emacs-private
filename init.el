;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-
(doom!
       :completion
       (company +childframe)
       (vertico +icons)

       :ui
       doom
       doom-dashboard
       hl-todo
       hydra
       modeline
       (treemacs +lsp)
       (popup +all +defaults)
       vi-tilde-fringe
       workspaces
       window-select
       (ligatures +extra +iosevka)
       (emoji +ascii +github +unicode)

       :editor
       (evil +everywhere)
       (format +onsave)
       multiple-cursors
       fold
       snippets

       :emacs
       (dired +ranger +icons)
       electric
       vc

       :term
       eshell

       :checkers
       (syntax +childframe)

       :tools
       (lsp +peek)
       editorconfig
       magit
       eval

       :lang
       emacs-lisp
       (javascript +lsp)
       markdown
       (org +present +dragndrop +journal +roam2 +brain +gnuplot +hugo +noter +pomodoro +pretty)

       :app

       :config
       (default +bindings +smartparens))
