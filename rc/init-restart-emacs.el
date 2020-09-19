(use-package restart-emacs
  :ensure t
  :bind
  ;; ([remap save-buffers-kill-terminal] . restart-emacs)
  ("C-c C-x" . restart-emacs))



(provide 'init-restart-emacs)
