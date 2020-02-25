(use-package auto-complete
  :ensure t
  :diminish auto-complete-mode
  :init
  (progn
    (setq ac-ignore-case nil)
    (ac-config-default)))



(provide 'init-auto-complete)
