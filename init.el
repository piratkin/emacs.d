;; Init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

;;; Set path
(push "~/.dotmacs.d" load-path)

;;; System configuration
(require 'sysconf)

;;; Install packages
(require 'preload)

;;; Configure
(require 'rconf)

(provide 'init)
