;;; init.el -*- lexical-binding: t; -*-

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(setq doom-font (font-spec :family "Iosevka" :size 15)
      doom-unicode-font (font-spec :family "Iosevka" :size 12)
      doom-big-font (font-spec :family "Iosevka" :size 19))
(doom! :feature
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
      ;debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       (lookup           ; helps you navigate your code and documentation
        +devdocs         ; ...on devdocs.io online
        +docsets)        ; ...or in Dash docsets locally
       snippets          ; my elves. They type so I don't have to
       syntax-checker    ; tasing you for every semicolon you forget
       version-control   ; remember, remember that commit in November
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       (company          ; the ultimate code completion backend
        +auto            ; as-you-type code completion
        +childframe)     ; a nicer company UI (Emacs 26+ only)
      ;helm              ; the *other* search engine for love and life
      ;ido               ; the other *other* search engine...
       (ivy              ; a search engine for love and life
        +childframe)     ; uses childframes for popups (Emacs 26+ only)

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-modeline     ; a snazzy Atom-inspired mode-line
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       evil-goggles      ; display visual hints when editing in evil
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       nav-flash         ; blink the current line after jumping
      ;unicode           ; extended unicode support for various languages
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows

       :tools
       dired             ; making dired pretty [functional]
       editorconfig      ; let someone else argue about tabs vs spaces
       electric-indent   ; smarter, keyword-based electric-indent
       eshell            ; a consistent, cross-platform shell (WIP)
       ;gist              ; interacting with github gists
       imenu             ; an imenu sidebar and searchable code index
       ;impatient-mode    ; show off code over HTTP
      ;macos             ; MacOS-specific commands
       ;make              ; run make tasks from Emacs
       magit             ;
       neotree           ; a project drawer, like NERDTree for vim
       ;password-store    ; password manager for nerds
       pdf               ; pdf enhancements
      ;rgb               ; creating color strings
       rotate-text       ; cycle region at point between text candidates
       term              ; terminals in Emacs
       ;tmux              ; an API for interacting with tmux
       ;upload            ; map local to remote projects via ssh/ftp

       :lang
       ;assembly          ; assembly for fun or debugging
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       (haskell +intero) ; a language that's lazier than I am
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       markdown          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present         ; Emacs for presentations
        +publish)        ; Emacs+Org as a static site generator
       (org-private
        +todo
        +babel
        +capture
        +latex
        +export +style)
       ;plantuml          ; diagrams for confusing people more
       purescript        ; javascript, but functional
       ;rest              ; Emacs as a REST client
       ;typescript        ; javascript, but better
       web               ; the tubes

       :app
      ;(email +gmail)    ; emacs as an email client
      ;irc               ; how neckbeards socialize
      ;(rss +org)        ; emacs as an RSS reader
      ;twitter           ; twitter client https://twitter.com/vnought
      ;(write            ; emacs as a word processor (latex + org + markdown)
      ; +wordnut         ; wordnet (wn) search
      ; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :config
       (default +bindings +snippets +evil-commands))

