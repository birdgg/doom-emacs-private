;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(disable-packages! exec-path-from-shell)
(packages! org-pomodoro
           (orca :recipe (:fetcher github :repo "birdgg/orca"))
           org-wild-notifier)
