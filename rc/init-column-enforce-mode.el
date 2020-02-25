(use-package column-enforce-mode
  :ensure t
  :diminish column-enforce-mode
  :init
  (setq column-enforce-column 80)
  :config
  (progn
    (add-hook 'prog-mode-hook 'column-enforce-mode)))
