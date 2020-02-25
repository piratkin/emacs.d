;; ;; highlight matching paren
;; (use-package paren
;;   :config
;;   ;;visualize ( and )
;;   (show-paren-mode t))

(use-package paren
  :custom
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t)
  :config
  (show-paren-mode))

(provide 'init-paren)
