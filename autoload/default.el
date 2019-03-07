;;; ~/.doom.d/autoload/misc.el -*- lexical-binding: t; -*-

(defvar my-workspace-dir (concat (getenv "HOME") "/work"))

;;;###autoload
(defun +my/browse-workspace ()
  (interactive) (doom-project-browse my-workspace-dir))
