;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; (map!
;;   (:after evil
;;     :n "s-/" #'evil-commentary-line
;;     :n "s-p" #'org-pomodoro)
;;  )

(when IS-MAC
  (map! "s-/" #'evil-commentary
        "s-p" #'org-pomodoro)
  )
