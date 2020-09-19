(use-package dumb-jump
  :ensure t
  ;; :bind
  ;; (("C-c j" . dumb-jump-go))
  :custom
  (dumb-jump-selector 'ivy)
  ;; (dumb-jump-prefer-searcher 'ag)
  :config
  (dumb-jump-mode))

;; (use-package smart-jump
;;   :ensure t
;;   :config
;;   (smart-jump-setup-default-registers))

(use-package ag
  :ensure t
  ;; :ensure-system-package
  ;; (ag . silversearcher-ag)
  :init
  (setq ag-highlight-search t
        ag-reuse-buffers t
        ag-reuse-window t)
  :config
  (add-to-list 'ag-arguments "--word-regexp"))



(provide 'init-dumb-jump)
