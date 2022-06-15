;;; ~/.doom.d/+text.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/org/"
      org-journal-dir "~/Dropbox/org/journal/"
      org-roam-directory "~/Dropbox/org/"
      org-agenda-files (list org-directory)
      )

(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message))

(after! org
  (setq
   org-log-done t
   org-use-property-inheritance t
   org-confirm-babel-evaluate nil
   org-list-allow-alphabetical t
   org-export-with-sub-superscripts nil
   org-export-headline-levels 5
   org-export-use-babel t
   org-use-speed-commands t
   org-return-follows-link t
   org-hide-emphasis-markers t
   org-special-ctrl-a/e t
   org-special-ctrl-k t
   org-src-preserve-indentation nil
   org-src-tab-acts-natively t
   org-edit-src-content-indentation 0
   org-export-in-background nil
   org-fontify-quote-and-verse-blocks t
   org-fontify-whole-heading-line t
   org-fontify-done-headline t
   org-catch-invisible-edits 'smart)

  (setq
   org-superstar-headline-bullets-list `(
                                         ,(all-the-icons-material "filter_1")
                                         ,(all-the-icons-material "filter_2")
                                         ,(all-the-icons-material "filter_3")
                                         ,(all-the-icons-material "filter_4")
                                         )
   org-superstar-special-todo-items t
   org-superstar-todo-bullet-alist '(("TODO" . ?)
                                     ("DONE" . ?))
   )
  (setq org-ellipsis ""
        org-hide-leading-stars t
        )

  )

(use-package! pangu-spacing
  :config
  (global-pangu-spacing-mode 1)
  (setq pangu-spacing-real-insert-separtor t))

(use-package! valign
  :config
  (setq valign-fancy-bar t)
  (add-hook 'org-mode-hook #'valign-mode))
