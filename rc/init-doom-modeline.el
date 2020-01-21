(use-package all-the-icons)

(use-package doom-modeline
      :defer t
      :config
      (setq column-number-mode t)
      (setq doom-modeline-major-mode-icon t)
      (setq doom-modeline-icon t)
      (setq doom-modeline-lsp t)
      (setq find-file-visit-truename t)
      (setq doom-modeline-mu4e t)
      (setq doom-modeline-version t)
      (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
      :hook (after-init . doom-modeline-mode))