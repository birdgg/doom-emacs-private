;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-
(if (featurep 'cocoa)
    (progn
      (setq ns-use-native-fullscreen nil)
      (setq ns-use-fullscreen-animation nil)

      (add-to-list 'default-frame-alist '(fullscreen . maximized))
      ;; 默认先最大化。
      ;; (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
      )

  ;; 非Mac平台直接全屏
  (require 'fullscreen)
  (fullscreen))

;; (setq doom-theme 'misterioso)
(setq doom-theme 'doom-one)
;; Fonts
(setq doom-font (font-spec :family "Iosevka" :size 20)
      doom-big-font (font-spec :family "Iosevka" :size 40))

;; (set-fontset-font t '(#Xe000 . #Xe90f) "Material Icons")
;; (set-fontset-font t '(#Xe100 . #Xe1cc) "Iosevka")

;; banner
(setq +doom-dashboard-banner-file (expand-file-name "banners/yayoi.png" doom-private-dir))
(setq +doom-dashboard-banner-padding '(1 . 1))

;; modeline
(setq doom-modeline-height 30)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-lsp t)



(tool-bar-mode -1)                      
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-ignore-duplicate t)


;; without titlebar
;; (add-to-list 'default-frame-alist
;;              '(ns-transparent-titlebar . t))

;; (add-to-list 'default-frame-alist
;;              '(ns-appearance . dark))

;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; (defun +my/set-faces ()
;;   (custom-set-faces
;;    '(company-tooltip
;;      ((t (:background "#2d3743"))))))

;; (add-hook! 'doom-load-theme-hook #'+my/set-faces)

;; (set-popup-rule! "^\\*company-box-" :ignore t)
