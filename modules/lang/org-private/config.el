;;; lang/org-private/config.el -*- lexical-binding: t; -*-

(setq +org-dir (expand-file-name "~/Dropbox/org/"))
;; (setq org-blank-before-new-entry nil
;;       org-modules (quote (org-bibtex org-habit org-info org-protocol org-mac-link org-notmuch))
;;       org-imenu-depth 8)


;; Sub-modules
(if (featurep! +todo)    (load! +todo))
(if (featurep! +attach)  (load! +attach))
(if (featurep! +babel)   (load! +babel))
(if (featurep! +latex)   (load! +latex))
(if (featurep! +capture) (load! +capture))
(if (featurep! +export)  (load! +export))
(if (featurep! +present) (load! +present))
;; TODO (if (featurep! +publish) (load! +publish))


;;
;; Plugins
;;

(def-package! org-brain
  :after org
  :init
  (setq org-brain-path "~/Dropbox/org")
  (push 'org-brain-visualize-mode evil-snipe-disabled-modes)
  ;; (add-hook 'org-agenda-mode-hook #'(lambda () (evil-vimish-fold-mode -1)))
  (set! :evil-state 'org-brain-visualize-mode 'normal)
  :config
  (set! :popup "^\\*org-brain\\*$" '((vslot . -1) (size . 0.3) (side . left)) '((select . t) (quit) (transient)))
  (defun org-brain-set-tags (entry)
    "Use `org-set-tags' on headline ENTRY.
If run interactively, get ENTRY from context."
    (interactive (list (org-brain-entry-at-pt)))
    (when (org-brain-filep entry)
      (error "Can only set tags on headline entries"))
    (org-with-point-at (org-brain-entry-marker entry)
      (counsel-org-tag)
      (save-buffer))
    (org-brain--revert-if-visualizing))
  (setq org-brain-visualize-default-choices 'all
        org-brain-title-max-length 30)
  (map!
   (:map org-brain-visualize-mode-map
     :n "a" #'org-brain-visualize-attach
     :n "b" #'org-brain-visualize-back
     :n "c" #'org-brain-add-child
     :n "C" #'org-brain-remove-child
     :n "p" #'org-brain-add-parent
     :n "P" #'org-brain-remove-parent
     :n "f" #'org-brain-add-friendship
     :n "F" #'org-brain-remove-friendship
     :n "d" #'org-brain-delete-entry
     :n "g" #'revert-buffer
     :n "_" #'org-brain-new-child
     :n ";" #'org-brain-set-tags
     :n "j" #'forward-button
     :n "k" #'backward-button
     :n "l" #'org-brain-add-resource
     :n "L" #'org-brain-visualize-paste-resource
     :n "t" #'org-brain-set-title
     :n "$" #'org-brain-pin
     :n "o" #'ace-link-woman
     :n "q" #'org-brain-visualize-quit
     :n "r" #'org-brain-visualize-random
     :n "R" #'org-brain-visualize-wander
     :n "s" #'org-brain-visualize
     :n "S" #'org-brain-goto
     :n [tab] #'org-brain-goto-current
     :n "m" #'org-brain-visualize-mind-map
     :n "[" #'org-brain-visualize-add-grandchild
     :n "]" #'org-brain-visualize-remove-grandchild
     :n "{" #'org-brain-visualize-add-grandparent
     :n "}" #'org-brain-visualize-remove-grandparent
     )))

(def-package! org-web-tools
  :after org)

(def-package! org-mru-clock
  :commands (org-mru-clock-in
             org-mru-clock-select-recent-task)
  :init
  (setq org-mru-clock-how-many 100
        org-mru-clock-completing-read #'ivy-completing-read))


;;
;; Bootstrap
;;

(add-hook 'org-load-hook #'+org-private|setup-ui t)
(add-hook 'org-load-hook #'+org-private|setup-agenda t)
(add-hook 'org-load-hook #'+org-private|setup-keybinds t)
(add-hook 'org-load-hook #'+org-private|setup-overrides t)

(remove-hook! 'org-mode-hook #'(visual-line-mode))

;;
;; `org-load' hooks
;;

(defun +org-private|setup-agenda ()
  (setq org-agenda-block-separator ""
        org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 3 :fileskip0 t :stepskip0 t :tags "-COMMENT"))
        org-agenda-compact-blocks t
        org-agenda-dim-blocked-tasks nil
        org-agenda-files (append
                          (list "/Users/birdgg/Dropbox/org/cal.org")
                          (ignore-errors (directory-files +org-dir t "\\.org$" t)))
        org-agenda-follow-indirect t
        org-agenda-ignore-properties '(effort appt category)
        org-agenda-inhibit-startup t
        org-agenda-inhibit-startup t
        org-agenda-log-mode-items '(closed clock)
        org-agenda-overriding-header ""
        org-agenda-restore-windows-after-quit t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-deadline-prewarning-if-scheduled t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-unavailable-files t
        org-agenda-sorting-strategy '((agenda time-up priority-down category-keep)
                                      (todo   priority-down category-keep)
                                      (tags   priority-down category-keep)
                                      (search category-keep))
        org-agenda-span 'day
        org-agenda-start-with-log-mode t
        org-agenda-sticky nil
        org-agenda-tags-column 'auto
        org-agenda-use-tag-inheritance nil
        org-habit-following-days 0
        org-habit-graph-column 1
        org-habit-preceding-days 8
        org-habit-show-habits t
        ))

(defun +org-private|setup-ui ()
  "Configures the UI for `org-mode'."
  (defface org-todo-keyword-todo '((t ())) "org-todo" :group 'org)
  (defface org-todo-keyword-kill '((t ())) "org-kill" :group 'org)
  (defface org-todo-keyword-outd '((t ())) "org-outd" :group 'org)
  (defface org-todo-keyword-wait '((t ())) "org-wait" :group 'org)
  (defface org-todo-keyword-done '((t ())) "org-done" :group 'org)
  (defface org-todo-keyword-habt '((t ())) "org-habt" :group 'org)

  (set! :popup "^\\*Org Src" '((size . 0.4) (side . right)) '((quit) (select . t) (modeline)))
  (set! :popup "^CAPTURE.*\\.org$" '((side . bottom) (size . 0.4)) '((quit) (select . t)))

  (setq org-adapt-indentation nil
        org-export-babel-evaluate nil
        org-blank-before-new-entry nil
        org-clock-clocktable-default-properties (quote (:maxlevel 3 :scope agenda :tags "-COMMENT"))
        org-clock-persist t
        org-clock-persist-file (expand-file-name ".org-clock-persist-data.el" +org-dir)
        org-clocktable-defaults (quote (:maxlevel 3 :lang "en" :scope file :block nil :wstart 1 :mstart 1 :tstart nil :tend nil :step nil :stepskip0 t :fileskip0 t :tags "-COMMENT" :emphasize nil :link nil :narrow 40! :indent t :formula nil :timestamp nil :level nil :tcolumns nil :formatter nil))
        org-columns-default-format "%50ITEM(Task) %8CLOCKSUM %16TIMESTAMP_IA"
        org-complete-tags-always-offer-all-agenda-tags t
        org-cycle-include-plain-lists t
        org-cycle-separator-lines 1
        org-enforce-todo-dependencies t
        org-entities-user
        '(("flat"  "\\flat" nil "" "" "266D" "♭")
          ("sharp" "\\sharp" nil "" "" "266F" "♯"))
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-footnote-auto-label 'plain
        org-global-properties (quote (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00")))
        org-hidden-keywords nil
        org-hide-block-startup t
        org-hide-emphasis-markers nil
        org-hide-leading-stars nil
        org-hide-leading-stars-before-indent-mode nil
        org-highest-priority ?A
        org-id-link-to-org-use-id t
        org-id-locations-file (concat +org-dir ".org-id-locations")
        org-id-track-globally t
        org-image-actual-width nil
        org-imenu-depth 8
        org-indent-indentation-per-level 2
        org-indent-mode-turns-on-hiding-stars t
        org-list-description-max-indent 4
        org-log-done 'time
        org-log-into-drawer t
        org-log-note-clock-out t

        org-log-redeadline 'time
        org-log-reschedule 'time
        org-log-state-notes-into-drawer t
        org-lowest-priority ?F
        org-modules (quote (org-bibtex org-habit org-info org-protocol org-mac-link org-notmuch))
        org-outline-path-complete-in-steps nil
        org-pretty-entities nil

        org-pretty-entities-include-sub-superscripts t
        org-priority-faces
        `((?a . ,(face-foreground 'error))
          (?b . ,(face-foreground 'warning))
          (?c . ,(face-foreground 'success)))
        org-publish-timestamp-directory (concat +org-dir ".org-timestamps/")
        org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9))
        org-refile-use-outline-path 'file
        org-startup-folded t
        org-startup-indented t
        org-startup-with-inline-images nil
        org-tags-column 0
        org-todo-keyword-faces
        '(("TODO" . org-todo-keyword-todo)
          ("HABT" . org-todo-keyword-habt)
          ("DONE" . org-todo-keyword-done)
          ("WAIT" . org-todo-keyword-wait)
          ("KILL" . org-todo-keyword-kill)
          ("OUTD" . org-todo-keyword-outd))
        org-todo-keywords
        '((sequence "[ ](s)" "[-](p)" "[?](m)" "|" "[X](x)")
          (sequence "TODO(t!)"  "|" "DONE(d!/@)")
          (sequence "WAIT(w@/@)" "|" "OUTD(o@/@)" "KILL(k@/@)")
          (sequence "HABT(h!)" "|" "DONE(d!/@)" "KILL(k@/@)"))
        org-treat-insert-todo-heading-as-state-change t
        org-use-fast-tag-selection nil
        org-use-fast-todo-selection t
        org-use-sub-superscripts '{}
        outline-blank-line t)

  ;; Update UI when theme is changed
  (add-hook 'doom-init-theme-hook #'+org-private|setup-ui))

(defun +org-private|setup-keybinds ()
  (map! :map org-mode-map
        :i [S-tab] #'+org/dedent
        ;; navigate table cells (from insert-mode)
        :i  "C-l"   #'+org/table-next-field
        :i  "C-h"   #'+org/table-previous-field
        :i  "C-k"   #'+org/table-previous-row
        :i  "C-j"   #'+org/table-next-row
        ;; expand tables (or shiftmeta move)
        :ni "C-S-l" #'+org/table-append-field-or-shift-right
        :ni "C-S-h" #'+org/table-prepend-field-or-shift-left
        :ni "C-S-k" #'org-metaup
        :ni "C-S-j" #'org-metadown
        ;; toggle local fold, instead of all children
        :n  [tab]   #'+org/toggle-fold
        ;; more intuitive RET keybinds
        :i  "RET"   #'org-return-indent
        :n  "RET"   #'+org/dwim-at-point
        :ni [M-return]   (λ! (+org/insert-item 'below))
        :ni [S-M-return] (λ! (+org/insert-item 'above))
        ;; more org-ish vim motion keys
        :m  "]]"  (λ! (org-forward-heading-same-level nil) (org-beginning-of-line))
        :m  "[["  (λ! (org-backward-heading-same-level nil) (org-beginning-of-line))
        :m  "]h"  #'org-next-visible-heading
        :m  "[h"  #'org-previous-visible-heading
        :m  "]l"  #'org-next-link
        :m  "[l"  #'org-previous-link
        :m  "]s"  #'org-babel-next-src-block
        :m  "[s"  #'org-babel-previous-src-block
        :n  "gQ"  #'org-fill-paragraph
        ;; sensible code-folding vim keybinds
        :n  "za"  #'+org/toggle-fold
        :n  "zA"  #'org-shifttab
        :n  "zc"  #'outline-hide-subtree
        :n  "zC"  (λ! (outline-hide-sublevels 1))
        :n  "zd"  (lambda (&optional arg) (interactive "p") (outline-hide-sublevels (or arg 3)))
        :n  "zm"  (λ! (outline-hide-sublevels 1))
        :n  "zo"  #'outline-show-subtree
        :n  "zO"  #'outline-show-all
        :n  "zr"  #'outline-show-all)
  (map! :map org-mode-map
        "M-o" #'org-open-at-point
        "M-i" #'org-insert-last-stored-link
        "M-I" #'org-insert-link
        "s-p" #'org-ref-ivy-insert-cite-link
        :n  "RET" #'+org/dwim-at-point
        ;; :n  [tab]     #'org-cycle
        :n  "t"       #'org-todo
        :n  "T"       #'org-insert-todo-heading-respect-content

        (:localleader
          :desc "Schedule"          :n "s"                  #'org-schedule
          :desc "Math"              :n "m"                  #'+org-toggle-math
          :desc "Remove link"       :n "L"                  #'+org/remove-link
          :desc "Deadline"          :n "d"                  #'org-deadline
          :desc "C-c C-c"           :n doom-localleader-key #'org-ctrl-c-ctrl-c
          :desc "Edit Special"      :n "'"                  #'org-edit-special
          :desc "Effort"            :n "e"                  #'org-set-effort
          :desc "TODO"              :n "t"                  #'org-todo
          :desc "Export"            :n [tab]                #'org-export-dispatch
          :desc "Clocking Effort"   :n "E"                  #'org-clock-modify-effort-estimate
          :desc "Property"          :n "p"                  #'org-set-property
          :desc "Clock-in"          :n "i"                  #'org-clock-in
          :desc "Clock-out"         :n "o"                  #'org-clock-out
          :desc "Narrow to Subtree" :n "n"                  #'org-narrow-to-subtree
          :desc "Narrow to Element" :n "N"                  #'org-narrow-to-element
          :desc "Widen"             :n "w"                  #'widen
          :desc "Toggle heading"    :n "h"                  #'org-toggle-heading
          :desc "Archive Subtree"   :n "A"                  #'org-archive-subtree
          :desc "Toggle Archive"    :n "a"                  #'org-toggle-archive-tag
          )
        (:after org-agenda
          (:map org-agenda-mode-map
            :nm "C-k"      #'evil-window-up
            :nm "C-j"      #'evil-window-down
            :nm "C-h"      #'evil-window-left
            :nm "C-l"      #'evil-window-right
            :nm "<escape>" #'org-agenda-Quit
            :nm "q"        #'org-agenda-Quit
            :nm "<C-up>"   #'org-clock-convenience-timestamp-up
            :nm "<C-down>" #'org-clock-convenience-timestamp-down
            :nm "s-o"      #'org-clock-convenience-fill-gap
            :nm "s-e"      #'org-clock-convenience-fill-gap-both
            :nm "\\"       #'ace-window
            :nm "t"        #'org-agenda-todo
            :nm "p"        #'org-set-property
            :nm "r"        #'org-agenda-redo
            :nm "e"        #'org-agenda-set-effort
            :nm "h"        #'org-habit-toggle-habits
            :nm "l"        #'org-agenda-log-mode
            :nm "D"        #'org-agenda-toggle-diary
            :nm "G"        #'org-agenda-toggle-time-grid
            :nm ";"        #'counsel-org-tag-agenda
            :nm "s-j"      #'counsel-org-goto-all
            :nm "i"        #'org-agenda-clock-in
            :nm "o"        #'org-agenda-clock-out
            :nm "<tab>"    #'org-agenda-goto
            :nm "J"        #'org-agenda-later
            :nm "K"        #'org-agenda-earlier
            :nm "C"        #'org-agenda-capture
            :nm "m"        #'org-agenda-bulk-mark
            :nm "u"        #'org-agenda-bulk-unmark
            :nm "U"        #'org-agenda-bulk-unmark-all
            :nm "f"        #'+org@org-agenda-filter/body
            :nm "-"        #'org-agenda-manipulate-query-subtract
            :nm "="        #'org-agenda-manipulate-query-add
            :nm "_"        #'org-agenda-manipulate-query-subtract-re
            :nm "$"        #'org-agenda-manipulate-query-add-re
            :nm "d"        #'org-agenda-deadline
            :nm "s"        #'org-agenda-schedule
            :nm "z"        #'org-agenda-view-mode-dispatch
            :nm "S"        #'org-save-all-org-buffers))))

(defun +org-private|setup-overrides ()
  (defun org-refile-get-targets (&optional default-buffer)
    "Produce a table with refile targets."
    (let ((case-fold-search nil)
          ;; otherwise org confuses "TODO" as a kw and "Todo" as a word
          (entries (or org-refile-targets '((nil . (:level . 1)))))
          targets tgs files desc descre)
      (message "Getting targets...")
      (with-current-buffer (or default-buffer (current-buffer))
        (dolist (entry entries)
          (setq files (car entry) desc (cdr entry))
          (cond
           ((null files) (setq files (list (current-buffer))))
           ((eq files 'org-agenda-files)
            (setq files (org-agenda-files 'unrestricted)))
           ((and (symbolp files) (fboundp files))
            (setq files (funcall files)))
           ((and (symbolp files) (boundp files))
            (setq files (symbol-value files))))
          (when (stringp files) (setq files (list files)))
          (cond
           ((eq (car desc) :tag)
            (setq descre (concat "^\\*+[ \t]+.*?:" (regexp-quote (cdr desc)) ":")))
           ((eq (car desc) :todo)
            (setq descre (concat "^\\*+[ \t]+" (regexp-quote (cdr desc)) "[ \t]")))
           ((eq (car desc) :regexp)
            (setq descre (cdr desc)))
           ((eq (car desc) :level)
            (setq descre (concat "^\\*\\{" (number-to-string
                                            (if org-odd-levels-only
                                                (1- (* 2 (cdr desc)))
                                              (cdr desc)))
                                 "\\}[ \t]")))
           ((eq (car desc) :maxlevel)
            (setq descre (concat "^\\*\\{1," (number-to-string
                                              (if org-odd-levels-only
                                                  (1- (* 2 (cdr desc)))
                                                (cdr desc)))
                                 "\\}[ \t]")))
           (t (error "Bad refiling target description %s" desc)))
          (dolist (f files)
            (with-current-buffer (if (bufferp f) f (org-get-agenda-file-buffer f))
              (or
               (setq tgs (org-refile-cache-get (buffer-file-name) descre))
               (progn
                 (when (bufferp f)
                   (setq f (buffer-file-name (buffer-base-buffer f))))
                 (setq f (and f (expand-file-name f)))
                 (when (eq org-refile-use-outline-path 'file)
                   (push (list (file-name-nondirectory f) f nil nil) tgs))
                 (org-with-wide-buffer
                  (goto-char (point-min))
                  (setq org-outline-path-cache nil)
                  (while (re-search-forward descre nil t)
                    (beginning-of-line)
                    (let ((case-fold-search nil))
                      (looking-at org-complex-heading-regexp))
                    (let ((begin (point))
                          (heading (match-string-no-properties 4)))
                      (unless (or (and
                                   org-refile-target-verify-function
                                   (not
                                    (funcall org-refile-target-verify-function)))
                                  (not heading))
                        (let ((re (format org-complex-heading-regexp-format
                                          (regexp-quote heading)))
                              (target
                               (if (not org-refile-use-outline-path) heading
                                 (concat
                                  (file-name-nondirectory (buffer-file-name (buffer-base-buffer)))
                                  " ✦ "
                                  (org-format-outline-path (org-get-outline-path t t) 1000 nil " ➜ ")
                                  ))))

                          (push (list target f re (org-refile-marker (point)))
                                tgs)))
                      (when (= (point) begin)
                        ;; Verification function has not moved point.
                        (end-of-line)))))))
              (when org-refile-use-cache
                (org-refile-cache-put tgs (buffer-file-name) descre))
              (setq targets (append tgs targets))))))
      (message "Getting targets...done")
      (delete-dups (nreverse targets))))

  (defun +org-private/*org-ctrl-c-ctrl-c-counsel-org-tag ()
    "Hook for `org-ctrl-c-ctrl-c-hook' to use `counsel-org-tag'."
    (if (save-excursion (beginning-of-line) (looking-at "[ \t]*$"))
        (or (run-hook-with-args-until-success 'org-ctrl-c-ctrl-c-final-hook)
            (user-error "C-c C-c can do nothing useful at this location"))
      (let* ((context (org-element-context))
             (type (org-element-type context)))
        (case type
          ;; When at a link, act according to the parent instead.
          (link (setq context (org-element-property :parent context))
                (setq type (org-element-type context)))
          ;; Unsupported object types: refer to the first supported
          ;; element or object containing it.
          ((bold code entity export-snippet inline-babel-call inline-src-block
                 italic latex-fragment line-break macro strike-through subscript
                 superscript underline verbatim)
           (setq context
                 (org-element-lineage
                  context '(radio-target paragraph verse-block table-cell)))))
        ;; For convenience: at the first line of a paragraph on the
        ;; same line as an item, apply function on that item instead.
        (when (eq type 'paragraph)
          (let ((parent (org-element-property :parent context)))
            (when (and (eq (org-element-type parent) 'item)
                       (= (line-beginning-position)
                          (org-element-property :begin parent)))
              (setq context parent type 'item))))
        (case type
          ((headline inlinetask)
           (save-excursion (goto-char (org-element-property :begin context))
                           (call-interactively 'counsel-org-tag)) t)))))
  (add-hook 'org-ctrl-c-ctrl-c-hook '+org-private/*org-ctrl-c-ctrl-c-counsel-org-tag)
  )
