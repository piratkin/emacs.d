(use-package popup
  :ensure t
  ;; :defer t
  :custom-face
  (popup-face ((t (:inherit default :background "#5e3c58" :foreground "yellow"))))
  (popup-summary-face ((t (:inherit popup-face :foreground "dimgray"))))
  (popup-menu-selection-face ((t (:inherit default :background "#120c11" :foreground "#ff4c4c")))))



(provide 'init-popup)
