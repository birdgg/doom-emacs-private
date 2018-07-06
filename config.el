;;;  -*- lexical-binding: t; -*-
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(setq doom-font (font-spec :family "Iosevka" :size 15)
      doom-big-font (font-spec :family "Iosevka" :size 19))

(setq +pretty-code-iosevka-ligatures-enabled-by-default t)

(setq
 web-mode-markup-indent-offset 2
 js-indent-level 2
 org-bullets-bullet-list '("·")
 ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

;; org
(setq +org-dir "~/Dropbox/org/")

(after! org
  (set-face-attribute 'org-done nil :foreground "#98be65")
  (set-face-attribute 'org-todo nil :foreground "#c678dd")
  (set-face-attribute 'org-ellipsis nil :foreground "#c678dd")
  (set-face-attribute 'org-headline-done nil :foreground nil)
  (setq org-tags-column -100
        org-log-done 'time
        org-fontify-done-headline nil
        org-ellipsis " ↴ ")

  (setq org-capture-templates
    '(("t" "Todo" entry
     (file+headline "inbox.org" "Inbox")
     "* TODO %?\n%i" :prepend t :kill-buffer t))))
