(use-package autorevert                 ; Auto-revert buffers of changed files
  :ensure t
  :diminish (auto-revert-mode . " Ⓐ")
  :init
  (when (eq system-type 'darwin)
    ;; File notifications aren't supported on OS X
    auto-revert-use-notify nil)
  (setq auto-revert-verbose nil
        global-auto-revert-non-file-buffers t)
  :config
  (global-auto-revert-mode))




(provide 'init-autorevert)
