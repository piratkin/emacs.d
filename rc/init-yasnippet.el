(use-package yasnippet
  :ensure t
  :init
  (setq yas-wrap-around-region t)
  ;; (eval-when-compile
  ;;   ;; Silence missing function warnings
  ;;   (declare-function yas-global-mode "yasnippet.el"))
  :config
  (push (concat dotmacs-root-directory "usr/snippets") yas-snippet-dirs)
  (yas-global-mode t)
  (yas-reload-all)
  (message "Init yasnippet"))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet)
  :config
  (yas-reload-all)
  (message "Init yasnippet-snippets"))



(provide 'init-yasnippet)
