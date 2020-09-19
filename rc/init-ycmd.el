(use-package ycmd
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-ycmd-mode)
  :config
  (set-variable 'ycmd-server-command `("python" "-u" ,(file-truename "~/ycmd/ycmd/")))
  (set-variable 'ycmd-global-config "~/ycmd/.ycm_extra_conf.py")
  (setq ycmd-request-message-level -1)
  ;; (setq ycmd-force-semantic-completion t)
  ;; (setq ycmd-tag-files 'auto)
  ;; (set-variable 'ycmd-startup-timeout 5)
  ;; (set-variable 'ycmd-server-command `("python3",  (file-truename  "/home/skhadka/tools/ycmd/ycmd")))
  ;; (set-variable 'ycmd-global-config "~/.config/nvim/.ycm_extra_conf.py")
  ;; (set-variable 'ycmd-extra-conf-handler 'load)
  ;; (eval-after-load 'cc-mode '(define-key c-mode-base-map (kbd "M-.") (function ycmd-goto)))
  ;; (global-ycmd-mode)
  (ycmd-setup)
  (message "Init ycmd"))

(use-package company-ycmd
  :ensure t
  :after (company)
  :config
  (company-ycmd-setup)
  (message "Init company-ycmd"))

(provide 'init-ycmd)
