(use-package zoom-window
  :ensure t
  :bind
  (:prefix "C-c w"
   :prefix-map window-map
   :prefix-docstring "Window map."
   ("z" . zoom-window-zoom)))



(provide 'init-zoom-window)
