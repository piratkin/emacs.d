;; (use-package window-number
;;   :init
;;   (progn

;;     (autoload 'window-number-mode "window-number"
;;       "A global minor mode that enables selection of windows according to
;;  numbers with the C-x C-j prefix.  Another mode,
;;  `window-number-meta-mode' enables the use of the M- prefix."
;;       t)

;;     (autoload 'window-number-meta-mode "window-number"
;;       "A global minor mode that enables use of the M- prefix to select
;;  windows, use `window-number-mode' to display the window numbers in
;;  the mode-line."
;;       t)

;;     (window-number-mode 1)
;;     (window-number-meta-mode 1)))

;; (use-package window-numbering
;;   :ensure t
;;   :init
;;   (progn
;;     (window-numbering-mode t)))


(use-package winum
  :ensure t
  :init
  (winum-mode t))




(provide 'init-window-number)