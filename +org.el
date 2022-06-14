;;; ~/.doom.d/+text.el -*- lexical-binding: t; -*-

;; org
(add-hook 'org-load-hook '(lambda () (setq org-modules (append '(org-protocol org-habit) org-modules))))

(setq org-directory "~/Dropbox/org/"
      org-journal-dir "~/Dropbox/org/journal/"
      org-roam-directory "~/Dropbox/org/"
      org-agenda-files (list org-directory))

(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message))

;; org-pomodoro mode hooks
(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (notify-osx "Pomodoro completed!" "Time for a break.")))

(add-hook 'org-pomodoro-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))

(add-hook 'org-pomodoro-long-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))

(add-hook 'org-pomodoro-killed-hook
          (lambda ()
            (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

(after! org
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
  ;; ui
  ;; (setq org-bullets-bullet-list
  ;;       `(
  ;;         ,(all-the-icons-material "filter_1")
  ;;         ,(all-the-icons-material "filter_2")
  ;;         ,(all-the-icons-material "filter_3")
  ;;         ,(all-the-icons-material "filter_4")))
  (set-face-attribute 'org-done nil :foreground "#98be65")
  (set-face-attribute 'org-todo nil :foreground "#c678dd")
  (set-face-attribute 'org-ellipsis nil :foreground "#c678dd")
  (set-face-attribute 'org-headline-done nil :foreground nil)

  (setq org-tags-column -100
        org-log-done 'time
        org-fontify-done-headline nil
        org-ellipsis " ↴ "
        org-hide-emphasis-markers t)
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("STYLE_ALL" . "habit"))))
  (setq org-tag-alist (quote (
                              ("@office" . ?o)
                              ("@home" . ?h)
                              (:newline)
                              ("WAITING" . ?w)
                              ("HOLD" . ?H)
                              ("CANCELLED" . ?c))))
  (setq org-clock-in-switch-to-state "NEXT")

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
  (setq org-todo-keyword-faces
        '(("TODO" :foreground "red" :weight bold)
          ("NEXT" :foreground "blue" :weight bold)
          ("DONE" :foreground "forest green" :weight bold)
          ("WAITING" :foreground "orange" :weight bold)
          ("HOLD" :foreground "magenta" :weight bold)
          ("CANCELLED" :foreground "forest green" :weight bold)))

  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  (setq org-capture-templates
        `(
          ("t" "TODO" entry (file+headline, (concat org-directory "inbox.org") "Inbox")
           "* TODO %?\n" :prepend t :kill-buffer t)
          ("l" "Learn" entry (file+headline, (concat org-directory "inbox.org") "Learn")
           "* %? \n")
          ("p" "Protocol" entry (file+headline, (concat org-directory "inbox.org") "Inbox")
           "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
          ("L" "Protocol Link" entry (file+headline ,(concat org-directory "inbox.org") "Inbox")
           "* %? [[%:link][%:description]] \n")
          ))

  (setq org-agenda-custom-commands
        '(
          (" " "Custom Agenda" (
                                (agenda "STYLE=\"habit\""
                                        ((org-agenda-overriding-header "Habits")
                                         (org-agenda-sorting-strategy
                                          '(todo-state-down effort-up category-keep))))

                                (agenda "" ((org-agenda-overriding-header "Today's Schedule:")
                                            (org-agenda-span 'day)
                                            (org-agenda-ndays 1)
                                            (org-agenda-start-on-weekday nil)
                                            (org-agenda-start-day "+0d")
                                            (org-agenda-todo-ignore-deadlines nil)))

                                (tags-todo "-HOLD-CANCELLED-ARCHIVE/!NEXT"
                                           ((org-agenda-overriding-header "Next Tasks:")
                                            ))

                                (alltodo ""
                                         ((org-agenda-overriding-header "Tasks to Refile:")
                                          (org-agenda-files (list (concat org-directory "inbox.org")))
                                          (org-tags-match-list-sublevels nil)))

                                (todo ""
                                      ((org-agenda-overriding-header "Projects:")
                                       (org-agenda-files (list (concat org-directory "projects.org")))))

                                (agenda "" ((org-agenda-overriding-header "Week At A Glance:")
                                            (org-agenda-ndays 5)
                                            (org-agenda-start-day"+1d")
                                            (org-agenda-prefix-format '((agenda . "  %-12:c%?-12t %s [%b] ")))))
                                (tags "ENDOFAGENDA"
                                      ((org-agenda-overriding-header "End of Agenda")
                                       (org-tags-match-list-sublevels nil))))
           ((org-agenda-start-with-log-mode t)
            (org-agenda-log-mode-items '(clock))
            (org-agenda-todo-ignore-deadlines 'near)
            (org-agenda-todo-ignore-scheduled t)))
          ))
  )
