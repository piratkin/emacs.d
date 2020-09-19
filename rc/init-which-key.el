(use-package which-key
  :ensure t
  :config
  (which-key-setup-minibuffer)
  ;; (which-key-setup-side-window-right)
  ;; (which-key-setup-side-window-right-bottom)
  ;; (which-key-setup-side-window-bottom)
  (setq which-key-idle-delay .6
        which-key-popup-type 'minibuffer
        which-key-show-prefix 'bottom
        ;; which-key-echo-keystrokes .1
        ;; which-key-idle-secondary-delay .05
        ;; which-key-max-description-length 42
        which-key-show-early-on-C-h t
        which-key-sort-order 'which-key-prefix-then-key-order
        ;; which-key-side-window-max-width 0.3
        ;; which-key-side-window-max-height 0.5
        which-key-replacement-alist
        '((("<\\([[:alnum:]-]+\\)>") . ("\\1"))
          (("DEL") . ("⌫"))
          (("RET") . ("⏎"))
          (("SPC") . ("␣"))
          (("TAB") . ("↹"))
          (("up") . ("↑"))
          (("right") . ("→"))
          (("down") . ("↓"))
          (("left") . ("←"))))
  (which-key-mode +1))



(provide 'init-which-key)
