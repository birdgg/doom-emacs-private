;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

(setq doom-theme 'misterioso)
;; Fonts
(setq doom-font (font-spec :family "Sarasa Term SC" :size 20))
(setq doom-big-font (font-spec :family "Sarasa Term SC" :size 40))

(set-fontset-font t '(#Xe000 . #Xe90f) "Material Icons")
(set-fontset-font t '(#Xe100 . #Xe1cc) "Iosevka")

;; banner
(setq +doom-dashboard-banner-file (expand-file-name "banners/yayoi.png" doom-private-dir))
(setq +doom-dashboard-banner-padding '(1 . 1))


;; without titlebar
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(defun +my/set-faces ()
  (custom-set-faces
   '(company-tooltip
     ((t (:background "#2d3743"))))))

(add-hook! 'doom-load-theme-hook #'+my/set-faces)

(set-popup-rule! "^\\*company-box-" :ignore t)
