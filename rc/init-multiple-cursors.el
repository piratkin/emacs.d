(use-package multiple-cursors
  :ensure t
  ;; :bind
  ;; (("M-." . mc/mark-next-like-this)
  ;;  ("M-," . mc/unmark-next-like-this)
   ;; ("C-S-<mouse-1>" . mc/add-cursor-on-click))
  :config
  (multiple-cursors-mode t))

(provide 'init-multiple-cursors)
