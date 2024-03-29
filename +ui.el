;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-
;; Theme
;; (setq doom-theme 'misterioso)
;; (setq doom-theme 'doom-moonlight)
(setq doom-theme 'doom-tokyo-night)

;; title bar
(setq frame-resize-pixelwise t)
;; font
(setq doom-font (font-spec :family "JetBrains Mono" :size 20 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "LXGW WenKai" :size 24)
      doom-unicode-font (font-spec :family "Iosevka SS09" :size 20)
      doom-big-font (font-spec :family "Iosevka" :size 28)
      fancy-splash-image (expand-file-name "banners/ll.png" doom-private-dir)
      doom-font-increment 1
      )
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; set window transparent
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))
;; instead of this func, use mix-pitch-mode and valign works great
;; (add-hook! 'doom-first-buffer-hook
;;   (defun +my/change-cjk-font ()
;;     "change the cjk font and its size to align the org/markdown tables when have
;; cjk characters. Font should be twice the width of asci chars so that org tables align.
;; This will break if run in terminal mode, so use conditional to only run for GUI."
;;     (when (display-graphic-p)
;;       (dolist (charset '(kana han cjk-misc bopomofo))
;;         (set-fontset-font (frame-parameter nil 'font)
;;                           charset (font-spec :family "PingFang SC"
;;                                              :size 23))))))
(after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  )


(plist-put! +ligatures-extra-symbols
  ;; org
  :name          "»"
  :src_block     "»"
  :src_block_end "«"
  :quote         "“"
  :quote_end     "”")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
