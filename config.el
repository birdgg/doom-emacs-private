;;;  -*- lexical-binding: t; -*-

(setq
 web-mode-markup-indent-offset 2
 js-indent-level 2
 org-ellipsis " ▾ "
 org-bullets-bullet-list '("·")
 ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

(map! :ne "M-/" #'comment-or-uncomment-region)

(after! org
  (set-face-attribute 'org-link nil
                      :weight 'normal
                      :background nil)
  (set-face-attribute 'org-code nil
                      :foreground "#a9a1e1"
                      :background nil)
  (set-face-attribute 'org-date nil
                      :foreground "#5B6268"
                      :background nil)
  (set-face-attribute 'org-level-1 nil
                      :foreground "slategray1"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-2 nil
                      :foreground "grey"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-3 nil
                      :foreground "grey"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-document-title nil
                      :foreground "SlateGray1"
                      :background nil
                      :height 2.0
                      :weight 'normal))
