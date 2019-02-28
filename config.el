;;;  -*- lexical-binding: t; -*-

(setq
 web-mode-markup-indent-offset 2
 js-indent-level 2
 org-bullets-bullet-list '("·")
 )

(add-hook 'org-load-hook '(lambda () (setq org-modules (append '(org-protocol org-habit) org-modules))))


;; org
(setq +org-dir "~/Dropbox/org/")
(setq org-agenda-files '("~/Dropbox/org/"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

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
  (setq org-capture-templates `(
    ("t" "Todo" entry (file+headline "inbox.org" "Inbox")
     "* TODO %?\nCREATED: %u\n%i" :prepend t :kill-buffer t)
	("l" "Protocol Link" entry (file+headline "~/Dropbox/org/inbox.org" "Inbox")
        "* [[%:link][%:description]] \nCREATED: %u" :prepend t :immediate-finish t)
   ))
   )

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-lsp-cache-candidates 'auto)

;; fix company-box scollbar width
(set-popup-rule! "^\\*company-box-" :ignore t)

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
