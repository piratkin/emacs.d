(use-package ace-window
  :ensure t
  :init
  (custom-set-faces
   '(aw-leading-char-face ((t (:foreground "red" :height 2.0)))))
  :config
  (setq aw-ignore-current t))



(provide 'init-ace-window)
