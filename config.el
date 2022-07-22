;;;  -*- lexical-binding: t; -*-
(setq user-full-name "xiejunjie"
      user-mail-address "birdeggegg@gmail.com")
(setq confirm-kill-emacs nil)

(after! consult
  (setq consult-grep-args (concat "g" consult-grep-args)))

(after! web-mode
    (add-to-list 'web-mode-engines-alist '("hugo" . ".*hugo.*\\(html\\|xml\\)\\'")))

(use-package! gitmoji
  :config
  (setq gitmoji--insert-utf8-emoji nil
        gitmoji--display-utf8-emoji nil))



(load! "+ui")
(load! "+bindings")
(load! "+org")
