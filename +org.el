;;; ~/.doom.d/+text.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/org/"
      org-roam-directory "~/Dropbox/org/")

(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message))

(after! org
  ;; basic config
  (add-hook 'org-mode-hook 'mixed-pitch-mode)
  (setq
   org-confirm-babel-evaluate nil
   org-use-speed-commands t
   org-log-into-drawer t
   org-hide-emphasis-markers t
   org-ellipsis ""
   org-log-done t
   org-hide-leading-stars t
   org-tag-alist '(("work" . ?w) ("home" . ?h))
   )
  ;; style config
  (setq
   org-superstar-headline-bullets-list '(" ")
   org-superstar-prettify-item-bullets t
   org-superstar-special-todo-items t
   org-todo-keywords '((sequence
                        "TODO(t)"  ; A task that needs doing & is ready to do
                        "PROJ(p)"  ; A project, which usually contains other tasks
                        "LOOP(r)"  ; A recurring task, use for org habit
                        "STRT(s)"  ; A task that is in progress
                        "HOLD(h)"  ; This task is paused/on hold
                        "IDEA(i)"  ; An unconfirmed and unapproved task or notion
                        "|"
                        "DONE(d)"  ; Task successfully completed
                        "KILL(k)")) ; Task was cancelled, aborted or is no longer applicable
   org-superstar-todo-bullet-alist '(("TODO" . ?)
                                     ("DONE" . ?)
                                     ("PROJ" . ?)
                                     ("LOOP" . ?)
                                     ("STRT" . ?)
                                     ("HOLD" . ?)
                                     ("IDEA" . ?)
                                     ("KILL" . ?))
   org-superstar-item-bullet-alist '((?* . ?•)
                                     (?+ . ?➤)
                                     (?- . ?–))
   )
  (setq  org-capture-templates
         '(("t" "Personal todo" entry
            (file+headline +org-capture-todo-file "Inbox")
            "* TODO %?\n%i\n%a" :prepend t)
           ("n" "Personal notes" entry
            (file+headline +org-capture-notes-file "Inbox")
            "* %u %?\n%i\n%a" :prepend t)
           ("j" "Journal" entry
            (file+olp+datetree +org-capture-journal-file)
            "* %U %?\n%i\n%a" :prepend t)
           ;; Will use {project-root}/{todo,notes,changelog}.org, unless a
           ;; {todo,notes,changelog}.org file is found in a parent directory.
           ;; Uses the basename from `+org-capture-todo-file',
           ;; `+org-capture-changelog-file' and `+org-capture-notes-file'.
           ("p" "Templates for projects")
           ("pt" "Project-local todo" entry  ; {project-root}/todo.org
            (file+headline +org-capture-project-todo-file "Inbox")
            "* TODO %?\n%i\n%a" :prepend t)
           ("pn" "Project-local notes" entry  ; {project-root}/notes.org
            (file+headline +org-capture-project-notes-file "Inbox")
            "* %U %?\n%i\n%a" :prepend t)
           ("pc" "Project-local changelog" entry  ; {project-root}/changelog.org
            (file+headline +org-capture-project-changelog-file "Unreleased")
            "* %U %?\n%i\n%a" :prepend t)

           ;; Will use {org-directory}/{+org-capture-projects-file} and store
           ;; these under {ProjectName}/{Tasks,Notes,Changelog} headings. They
           ;; support `:parents' to specify what headings to put them under, e.g.
           ;; :parents ("Projects")
           ("o" "Centralized templates for projects")
           ("ot" "Project todo" entry
            (function +org-capture-central-project-todo-file)
            "* TODO %?\n %i\n %a"
            :heading "Tasks"
            :prepend nil)
           ("on" "Project notes" entry
            (function +org-capture-central-project-notes-file)
            "* %U %?\n %i\n %a"
            :heading "Notes"
            :prepend t)
           ("oc" "Project changelog" entry
            (function +org-capture-central-project-changelog-file)
            "* %U %?\n %i\n %a"
            :heading "Changelog"
            :prepend t)))
  )

(map! :map org-mode-map
      [M-return] #'org-insert-todo-heading)

(use-package! org-super-agenda
  :init
  :config
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        )
  (setq org-agenda-custom-commands
        '(("e" "Everyday View"
           ((agenda "" ((org-agenda-span 'day)
                        (org-agenda-start-day nil)
                        (org-super-agenda-groups
                         '((:name "Today"
                            :date today
                            :time-grid t
                            :scheduled t
                            )
                           (:discard (:anything t))
                           ))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:name "To be arranged"
                             :scheduled nil
                             :order 1)
                            (:discard (:anything t))
                            ))))
            ))
          ))


  (org-super-agenda-mode))

(use-package! grab-mac-link)
