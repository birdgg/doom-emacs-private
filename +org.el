;;; ~/.doom.d/+text.el -*- lexical-binding: t; -*-

(setq org-directory "~/Dropbox/org/"
      org-roam-directory "~/Dropbox/org/")

(after! org
  ;; basic config
  (add-hook 'org-mode-hook 'mixed-pitch-mode)
  ;; (add-hook 'org-after-todo-state-change-hook '+bgg/org-todo-state-change)
  (setq
   org-confirm-babel-evaluate nil
   org-use-speed-commands t
   org-log-into-drawer t
   org-hide-emphasis-markers t
   org-ellipsis ""
   org-log-done t
   org-hide-leading-stars t
   org-clock-in-switch-to-state "START"
   org-clock-out-when-done t
   org-tag-alist '(("work" . ?w) ("home" . ?h))
   org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM"
   org-global-properties '(("Effort_ALL" . "0:25 0:50 1:15 1:40"))
   org-superstar-headline-bullets-list '(" ")
   org-superstar-prettify-item-bullets t
   org-superstar-special-todo-items t
   org-todo-keywords '((sequence
                        "TODO(t)"  ; A task that needs doing & is ready to do
                        "PROJ(p)"  ; A project, which usually contains other tasks
                        "LOOP(r)"  ; A recurring task, use for org habit
                        "START(s)"  ; A task that is in progress
                        "HOLD(h)"  ; This task is paused/on hold
                        "IDEA(i)"  ; An unconfirmed and unapproved task or notion
                        "|"
                        "DONE(d)"  ; Task successfully completed
                        "KILL(k)")) ; Task was cancelled, aborted or is no longer applicable
   org-superstar-todo-bullet-alist '(("TODO" . ?)
                                     ("DONE" . ?)
                                     ("PROJ" . ?)
                                     ("LOOP" . ?)
                                     ("START" . ?)
                                     ("HOLD" . ?)
                                     ("IDEA" . ?)
                                     ("KILL" . ?))
   org-superstar-item-bullet-alist '((?* . ?•)
                                     (?+ . ?➤)
                                     (?- . ?–))

   org-default-priority ?B
   org-fancy-priorities-list '((?A . "")
                               (?B . "")
                               (?C . ""))
   org-capture-templates
   '(("t" "Personal todo" entry
      (file+headline +org-capture-todo-file "Inbox")
      "* TODO %?\n%i\n" :prepend t)
     ("n" "Personal notes" entry
      (file+headline +org-capture-notes-file "Inbox")
      "* %u %?\n%i\n" :prepend t)
     ("j" "Journal" entry
      (file+olp+datetree +org-capture-journal-file)
      "* %U %?\n%i\n" :prepend t)
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

(defun org-agenda-show-today-super-view (&optional arg)
  (interactive "P")
  (org-agenda arg "e"))

(map! :map org-mode-map
      [M-return] #'org-insert-todo-heading)

(map!
 :leader
 :desc "Org agenda today" "z" #'org-agenda-show-today-super-view
 )

(map! :after evil-org
      :map evil-org-mode-map
      :n  "t" #'org-todo)

(use-package! org-super-agenda
  :init
  (setq org-super-agenda-header-map (make-sparse-keymap))
  :config
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-start-day nil
        )
  (setq org-agenda-custom-commands
        '(("e" "Everyday View"
           ((agenda "" ((org-agenda-span 'day)
                        (org-super-agenda-groups
                         '((:name "Today"
                            :date today
                            :time-grid t
                            )
                           (:discard (:anything t))
                           ))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:name "To be arranged"
                             :scheduled nil
                             :order 1)
                            (:name "Feature schedule"
                             :scheduled future
                             :order 2)
                            (:discard (:anything t))
                            ))))
            ))
          ))


  (org-super-agenda-mode))

(use-package! valign
  :config
  (setq valign-fancy-bar t)
  (add-hook 'org-mode-hook #'valign-mode))

(use-package! pangu-spacing
  :config
  (global-pangu-spacing-mode 1)
  ;; 在中英文符号之间, 真正地插入空格
  (setq pangu-spacing-real-insert-separtor t))
(use-package! grab-mac-link)
