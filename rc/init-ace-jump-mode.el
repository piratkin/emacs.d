
(use-package ace-jump-mode
  :ensure t
  :bind
  (("C-c w" . #'ace-jump-word-mode))
  (("C-c c" . #'ace-jump-char-mode))
  (("C-c l" . #'ace-jump-line-mode)))

(provide 'init-ace-jump-mode)
