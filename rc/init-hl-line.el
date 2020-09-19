(use-package hl-line
  :ensure t
  :hook
  ((prog-mode dired-mode markdown-mode) . hl-line-mode)
  :config
  ;; Highlight the line only in the active window
  (setq hl-line-sticky-flag nil)
  ;; Background style for terminal
  (when (not window-system)
    (set-face-attribute 'hl-line nil :inherit nil :background "gray6")))

;; ;; http://www.emacswiki.org/emacs/hl-line+.el
;; (use-package hl-line+
;;   :after hl-line
;;   :load-path "~/.dotmacs.d/usr/hl-line-plus"
;;   :config
;;   ;; Highlight line only when idle
;;   (toggle-hl-line-when-idle t))

(provide 'init-hl-line)
