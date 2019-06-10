;;;  -*- lexical-binding: t; -*-

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
