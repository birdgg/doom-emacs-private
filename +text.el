;;; ~/.doom.d/+text.el -*- lexical-binding: t; -*-

;; org
(add-hook 'org-load-hook '(lambda () (setq org-modules (append '(org-protocol org-habit) org-modules))))

(setq org-directory "~/Dropbox/org/"
      org-agenda-files (list org-directory))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(setq org-bullets-bullet-list
                        `(
                    ,(all-the-icons-material "filter_1")
                    ,(all-the-icons-material "filter_2")
                    ,(all-the-icons-material "filter_3")
                    ,(all-the-icons-material "filter_4")))
(after! org
  (set-face-attribute 'org-done nil :foreground "#98be65")
  (set-face-attribute 'org-todo nil :foreground "#c678dd")
  (set-face-attribute 'org-ellipsis nil :foreground "#c678dd")
  (set-face-attribute 'org-headline-done nil :foreground nil)
  (setq org-tags-column -100
        org-log-done 'time
        org-fontify-done-headline nil
        org-ellipsis " ↴ "
        org-hide-emphasis-markers t)
  (setq org-tag-alist '(("@office" . ?o)
                         ("@home" . ?h)
                         (:newline)
                         ("hifi" . ?c)))
  (setq org-todo-keywords
        '((sequence "[ ](t)" "[-](p)" "[?](m)" "|" "[X](d)")
          (sequence "TODO(T)" "|" "DONE(D)")
          (sequence "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "LATER(l)" "|" "CANCELLED(c)")))

  (setq org-capture-templates
          `(("t" "TODO" entry (file+headline, (concat org-directory "inbox.org") "Inbox")
          "* TODO %?\nAdded: %T\n" :prepend t :kill-buffer t)
          )))
