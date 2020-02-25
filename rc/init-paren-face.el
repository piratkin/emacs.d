(use-package paren-face
  :hook (prog-mode . paren-face-mode)
  :init
  ;; All "[({" will be silenced.
  (setq paren-face-regexp "[][(){}]"))


(provide 'init-paren-face)
