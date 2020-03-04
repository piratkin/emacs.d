(use-package css-mode
  :ensure t
  ;; :hook
  ;; (css-mode . company-mode)
  ;; :bind
  ;; (:map css-mode-map
  ;;       ("M-<tab>" . company-complete))
  )

(use-package scss-mode
  :ensure t
  ;; :commands scss-mode
  :config
  (setq scss-compile-at-save nil))
