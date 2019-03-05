;;;  -*- lexical-binding: t; -*-

(setq
 web-mode-markup-indent-offset 2
 js-indent-level 2
 )

(add-hook 'org-load-hook '(lambda () (setq org-modules (append '(org-protocol org-habit) org-modules))))

;; org
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
        org-ellipsis " ↴ ")
  (setq org-tag-alist '(("@office" . ?o)
                         ("@home" . ?h)
                         (:newline)
                         ("hifi" . ?c)))
  (setq org-todo-keywords
        '((sequence "[ ](t)" "[-](p)" "[?](m)" "|" "[X](d)")
          (sequence "TODO(T)" "|" "DONE(D)")
          (sequence "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "LATER(l)" "|" "CANCELLED(c)")))
  ;; (setq org-capture-templates `(
  ;;   ("t" "Todo" entry (file+headline "inbox.org" "Inbox")
  ;;    "* TODO %?\nCREATED: %u\n%i" :prepend t :kill-buffer t)

    ;; ("p" "Protocol" entry (file+headline ,(concat org-directory "inbox.org") "Inbox")
    ;;     "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n%?")
	;; ("L" "Protocol Link" entry (file+headline ,(concat org-directory "inbox.org") "Inbox")
    ;;     "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")

   ;; ))
   )

(def-package! org-wild-notifier
  :defer t
  :init
  (add-hook 'doom-post-init-hook #'org-wild-notifier-mode t)
  :config
  (setq org-wild-notifier-alert-time 15
        alert-default-style (if IS-MAC 'osx-notifier 'libnotify)))

(def-package! orca
  :init
  (setq orca-handler-list
      '((orca-handler-match-url
         "https://www.reddit.com/emacs/"
         "~/Dropbox/org/emacs.org"
         "Reddit")
        (orca-handler-match-url
         "https://emacs.stackexchange.com/"
         "~/Dropbox/org/emacs.org"
         "\\* Questions")
        (orca-handler-current-buffer
         "\\* Tasks")
        (orca-handler-file
         "~/Dropbox/org/ent.org"
         "\\* Articles"))))

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-lsp-cache-candidates 'auto)


(defun my-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (if (and (car candidates)
                (get-text-property 0 'lsp-completion-prefix (car candidates)))
        (all-completions (company-grab-symbol) candidates)
    candidates
    )
  )
)

(defun my-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'my-company-transformer company-transformers))

(add-hook 'js2-mode-hook 'my-js-hook)

(load! "+ui")
(load! "+bindings")
