;;;  -*- lexical-binding: t; -*-

(setq
 web-mode-markup-indent-offset 2
 js-indent-level 2
 )


(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-lsp-cache-candidates 'auto)


(defun my-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (if (and (car candidates)
                (get-text-property 0 'lsp-completion-prefix (car candidates)))
        (all-completions (company-grab-symbol) candidates)
    candidates
    )
  )
)

(defun my-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'my-company-transformer company-transformers))

(add-hook 'js2-mode-hook 'my-js-hook)

(load! "+ui")
(load! "+bindings")
(load! "+text")
