
;(add-to-list 'load-path "~/.emacs.d")
(push "~/.emacs.d" load-path)

;;; System configuration
(require 'sysconf)

;;; Setup proxy server
;(require 'proxyconf nil 'noerror)

;;; Install packages
(require 'preload)

;;; Configure
(require 'rconf)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
