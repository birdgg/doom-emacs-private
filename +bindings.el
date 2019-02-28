;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; (map!
;;   (:after evil
;;     :n "s-/" #'evil-commentary-line
;;     :n "s-p" #'org-pomodoro)
;;  )

(when IS-MAC
  (setq mac-command-modifier 'meta
        mac-option-modifier  'alt))

(map!
 (:map override
   "M-s" #'evil-write-all
   "M-p" #'counsel-git
   "M-a" #'mark-whole-buffer
   "M-c" #'evil-yank
   "M-v" #'yank
   "M-f" #'swiper
   "M-/" #'evil-commentary))

(map!
 (:after lsp-ui
   :map lsp-ui-mode-map
   "C-j" #'lsp-ui-doc-show
   :nv "gd" #'lsp-ui-peek-find-definitions
   :nv "gD" #'lsp-ui-peek-find-references
   :localleader "r" #'lsp-rename)
 )

;; leader key
(map! :leader
      (:prefix ("l" . "lsp")
        :desc "toggle lsp ui sideline" "t" #'lsp-ui-sideline-toggle-symbols-info)
      (:prefix "f"
        :desc "browser org files"  "o" #'+default/browse-notes)
      (:prefix "w"
        :desc "maximize window" "m" #'maximize-window
        :desc "minimize window" "n" #'minimize-window))
