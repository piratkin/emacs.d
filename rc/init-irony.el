(use-package irony
  :ensure t
  :hook
  (((c-mode c++-mode objc-mode) . irony-mode)
   (irony-mode . rc:irony-mode-on))
  :config
  (defun rc:irony-mode-on ()
    ;; Avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
    (when (member major-mode irony-supported-major-modes)
      (message "cmake-ide-build-dir -> %s" cmake-ide-build-dir)
      ;; Use irony's completion functions.
      (define-key irony-mode-map [remap completion-at-point]
        'irony-completion-at-point-async)
      (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async)
      ;; (company-irony-setup-begin-commands)
      ;; (irony-cdb-autosetup-compile-options)
      ))
  (message "Init irony"))

(use-package company-irony-c-headers
  :ensure t
  :after (company-irony)
  :config
  (message "Init company-irony-c-headers")
  (add-to-list 'company-backends 'company-irony-c-headers))

(use-package company-irony
  :ensure t
  :after (company)
  :config
  (add-to-list 'company-backends 'company-irony)
  (message "Init company-irony"))




(provide 'init-irony)
