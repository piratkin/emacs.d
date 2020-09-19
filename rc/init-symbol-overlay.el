(use-package symbol-overlay
  :ensure t
  :custom-face
  (symbol-overlay-default-face ((t (:inherit bold))))
  :hook
  ((prog-mode . symbol-overlay-mode)
   (w--theme-changed-hook . w--symbol-overlay-tweak-faces))
  :config
  (define-key symbol-overlay-map (kbd "H") 'symbol-overlay-map-help)
  (define-key symbol-overlay-map (kbd "h") nil)
  (setq symbol-overlay-idle-time 0.1))



(provide 'init-symbol-overlay)
