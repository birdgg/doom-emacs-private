;;;  -*- lexical-binding: t; -*-
(setq user-full-name "xiejunjie"
      user-mail-address "birdeggegg@gmail.com")
(setq confirm-kill-emacs nil)

(after! consult
  (setq consult-grep-args (concat "g" consult-grep-args)))

(load! "+ui")
(load! "+org")
