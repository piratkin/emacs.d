;;; Programming utilities
(use-package prog-mode
  :ensure nil
  :hook
  (prog-mode . display-line-numbers-mode)
  :bind
  (("C-c t p" . prettify-symbols-mode)))



(provide 'init-prog-mode)
