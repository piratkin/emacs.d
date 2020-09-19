;; requires run once: rtgas-install
(use-package rtags
  :ensure t
  :hook
  ((c-mode c++-mode objc-mode) . rtags-start-process-unless-running)
  :config
  (setq rtags-symbolnames-case-insensitive t
        rtags-find-file-case-insensitive t
        rtags-autostart-diagnostics t
        rtags-completions-enabled t)
  ;; (unless (or (rtags-executable-find "rc")
  ;;             (rtags-executable-find "rdm"))
  ;;   (call-interactively #'rtags-install))
  (message "Init rtags"))

(use-package company-rtags
  :ensure t
  :after (company)
  :config
  (add-to-list 'company-backends 'company-rtags)
  (message "Init company-rtags"))

(use-package ac-rtags
  :ensure t
  :requires (auto-complete)
  :config
  ;; (setq-default ac-sources (append '(ac-source-rtags) ac-sources))
  (add-hook 'c-mode-common-hook
            (lambda() (setq ac-sources (append '(ac-source-rtags) ac-sources))))
  (message "Init ac-rtags"))

(use-package ivy-rtags
  :ensure t
  :after (ivy)
  :config
  (setq rtags-display-result-backend 'ivy))


(provide 'init-rtags)
