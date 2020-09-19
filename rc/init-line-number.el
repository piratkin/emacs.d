(use-package nlinum
  :ensure t
  :config
  (if (version<= "26.0.50" emacs-version)
      (defalias 'rc:line-number-mode 'display-line-numbers-mode)
    (defalias 'rc:line-number-mode 'nlinum-mode))
  :hook
  (prog-mode . rc:line-number-mode))

(provide 'init-line-number)
