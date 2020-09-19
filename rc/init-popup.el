(use-package popup
  :ensure t
  :config
  (custom-set-faces
   '(popup-menu-mouse-face ((t (:background "blue" :foreground "white"))))
   '(popup-menu-selection-face ((t (:inherit default :background "orange1" :foreground "black" :weight bold))))
   '(popup-face ((t (:inherit default :background "yellow" :foreground "black"))))
   '(popup-summary-face ((t (:inherit popup-face :foreground "dimgray"))))
   '(popup-scroll-bar-foreground-face ((t (:background "red"))))
   '(popup-scroll-bar-background-face ((t (:background "gold"))))))

;; (defface popup-isearch-match '((t (:inherit default :background "sky blue")))
;;   "Popup isearch match face.")
;; (defface popup-tip-face '((t (:background "khaki1" :foreground "black")))
;;   "Face for popup tip.")



(provide 'init-popup)
