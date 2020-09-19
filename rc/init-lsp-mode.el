;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :ensure t
  :hook
  ((prog-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands
  (lsp lsp-deferred))

(use-package company-lsp
  :ensure t
  :requires company
  :config
  (push 'company-lsp company-backends)
   ;; Disable client-side cache because the LSP server does a better job.
  ;; (setq company-transformers nil
  ;;       company-lsp-async t
  ;;       company-lsp-cache-candidates nil)
  )

;; optionally
;; (use-package lsp-ui
;;   :ensure t
;;   :commands
;;   (lsp-ui-mode))

;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)

;; if you are ivy user
(use-package lsp-ivy
  :ensure t
  :commands
  (lsp-ivy-workspace-symbol))

;; (use-package lsp-treemacs
;;   :commands
;;   (lsp-treemacs-errors-list))

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t)

;; ;; to load the dap adapter for your language
;; (use-package dap-LANGUAGE
;;   :ensure t)


(provide 'init-lsp-mode)
