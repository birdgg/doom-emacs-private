;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 :leader
 :prefix "i"
 :desc "insert gitmoji" "g" #'gitmoji-insert-ivy
 )

;; (map!
;;  :n "gb" #'evil-jump-backward)

;; (map!
;;  (:after lsp-ui
;;    :map lsp-ui-mode-map
;;    "C-j" #'lsp-ui-doc-show
;;    :nv "gd" #'lsp-ui-peek-find-definitions
;;    :nv "gD" #'lsp-ui-peek-find-references
;;    :localleader "r" #'lsp-rename)
;;  (:after org
;;    (:map org-mode-map
;;      :localleader
;;      :desc "org todo"     "t" #'org-todo
;;      :desc "org tag"      "T" #'org-set-tags-command
;;      :desc "org schedule" "s" #'org-schedule
;;      :desc "org refile"   "r" #'org-refile
;;      :desc "org add note" "n" #'org-add-note
;;      :desc "org show link" "l" #'org-toggle-link-display))
;;  )

;; ;; leader key
;; (map! :leader
;;       (:prefix ("l" . "lsp")
;;         :desc "toggle lsp ui sideline" "t" #'lsp-ui-sideline-toggle-symbols-info)
;;       (:prefix "f"
;;         :desc "find file"                   "f" #'find-file
;;         :desc "find project in worksapce"   "w" #'+my/browse-workspace
;;         :desc "browser org files"  "o" #'+default/browse-notes))
