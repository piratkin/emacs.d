;; (use-package fold-dwim
;;   :ensure t
;;   :after (evil)
;;   ;; :hook
;;   ;; (prog-mode . hs-minor-mode)
;;   ;; :bind
;;   ;; ("C-c h" . fold-dwim-toggle)
;;   :config
;;   (define-key evil-normal-state-map [tab] 'fold-dwim-toggle)
;;   (define-key evil-normal-state-map [backtab] 'fold-dwim-hide-all)
;;   (define-key evil-normal-state-map [C-tab] 'fold-dwim-show-all))

(use-package hideshow
  :ensure t
  :after (evil)
  :hook
  (prog-mode . hs-minor-mode))



(provide 'init-hideshow)
