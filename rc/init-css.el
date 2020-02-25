(use-package css-mode
  :hook
  (css-mode . company-mode)
  ;; :bind
  ;; (:map css-mode-map
  ;;       ("M-<tab>" . company-complete))
  )

(use-package scss-mode
  ;; :commands scss-mode
  :config
  (setq scss-compile-at-save nil))
