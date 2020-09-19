(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; (use-package flycheck-clang-analyzer
;;   :ensure t
;;   :hook (irony-mode . flycheck-clang-analyzer-setup))

(use-package flycheck-irony
  :ensure t
  :after (flycheck)
  :hook
  (flycheck-mode . flycheck-irony-setup)
  :config
  (add-to-list 'flycheck-checkers 'irony))



(provide 'init-flycheck)
