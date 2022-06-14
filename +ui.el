;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-
;; Theme
;; (setq doom-theme 'misterioso)
(setq doom-theme 'doom-moonlight)

(when (display-graphic-p)
  ;; title bar
  (setq frame-resize-pixelwise t)
  (add-to-list 'default-frame-alist '(undecorated . t))
  ;; font
  (setq resolution-factor (eval (/ (x-display-pixel-height) 1080.0)))
  (setq doom-font (font-spec :family "Iosevka SS09" :size (eval (round (* 22 resolution-factor))))
        doom-big-font (font-spec :family "Iosevka SS09" :size (eval (round (* 28 resolution-factor))))
        ;; doom-variable-pitch-font (font-spec :family user-font :size (eval (round (* 13 resolution-factor))))
        doom-modeline-height (eval (round (* 14 resolution-factor))))
  (setq doom-font-increment 1)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  (add-hook! 'doom-first-buffer-hook
    (defun +my/change-cjk-font ()
      "change the cjk font and its size to align the org/markdown tables when have
cjk characters. Font should be twice the width of asci chars so that org tables align.
This will break if run in terminal mode, so use conditional to only run for GUI."
      (when (display-graphic-p)
        (setq user-cjk-font
              (cond
               ((find-font (font-spec :name "Sarasa Mono SC")) "Sarasa Mono SC")
               ))
        (dolist (charset '(kana han cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset (font-spec :family user-cjk-font
                                               :size (eval (round (* 22 resolution-factor)))))))))
  (after! doom-modeline
    (setq doom-modeline-major-mode-icon t))
  ;; dashboard
  (setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 5))
  (setq +doom-dashboard-functions (cl-subseq +doom-dashboard-functions 0 3))
  (let ((splash (expand-file-name "banners/ll.png" doom-private-dir)))
    (setq fancy-splash-image splash))
  )

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
