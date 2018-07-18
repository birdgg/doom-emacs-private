;;; init.el -*- lexical-binding: t; -*-
(doom! :feature
       eval
       (evil +everywhere)
       file-templates
       (lookup
        +devdocs)
       snippets
       syntax-checker
       workspaces

       :completion
       (company
        +auto)
       (ivy
        +childframe)
       ;;(lsp
       ;; +javascript
       ;; )

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
