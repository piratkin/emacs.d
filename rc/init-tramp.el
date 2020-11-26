(use-package tramp
  :ensure t
  :config
  (setq tramp-use-ssh-controlmaster-options nil
        tramp-chunksize 500))

(provide 'init-tramp)
