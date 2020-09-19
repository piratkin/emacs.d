(use-package paren-face
  :ensure t
  :hook (prog-mode . paren-face-mode)
  :config
  ;; All "[({" will be silenced.
  (setq paren-face-regexp "[][(){}]"))


(provide 'init-paren-face)
