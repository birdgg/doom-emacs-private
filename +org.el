;;; ~/.doom.d/+text.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/org/"
      org-roam-directory "~/Dropbox/org/"
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
   org-confirm-babel-evaluate nil
   org-use-speed-commands t
   org-hide-emphasis-markers t)

  (setq org-ellipsis ""
        org-hide-leading-stars t)
  (after! org-superstar
    (setq
     org-superstar-headline-bullets-list '(" ")
     org-superstar-prettify-item-bullets t
     org-superstar-special-todo-items t
     org-superstar-todo-bullet-alist '(("TODO" . ?)
                                       ("DONE" . ?))
     )
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
