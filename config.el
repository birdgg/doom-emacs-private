;;;  -*- lexical-binding: t; -*-

(use-package! company-tabnine
  :after company
  :config
  (cl-pushnew 'company-tabnine (default-value 'company-backends)))

(setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))
(setq company-show-numbers t)

(setq
 web-mode-markup-indent-offset 2
 js-indent-level 2
 )


(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-lsp-cache-candidates nil)

(add-hook 'js2-mode-hook #'+format|enable-on-save)

(load! "+ui")
(load! "+bindings")
(load! "+text")
