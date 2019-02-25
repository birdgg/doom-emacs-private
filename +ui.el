;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

(setq doom-theme 'misterioso)
;; Fonts
(setq doom-font (font-spec :family "Iosevka" :size 20))
(setq doom-big-font (font-spec :family "Iosevka" :size 40))

;; without titlebar
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
