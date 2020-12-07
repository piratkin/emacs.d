(use-package which-key
  :ensure t
  :init
  (progn
    (setq which-key-idle-delay 1))
  :config
  (progn
    (which-key-setup-minibuffer)
    (setq which-key-max-description-length 30)
    (setq which-key-show-prefix 'bottom)
    (setq which-key-idle-secondary-delay 0.05)
    (setq which-key-show-early-on-C-h t)
    (setq which-key-sort-order 'which-key-prefix-then-key-order)
    (setq which-key-replacement-alist
          '((("<\\([[:alnum:]-]+\\)>") . ("\\1"))
            (("DEL") . ("⌫"))
            (("RET") . ("⏎"))
            (("SPC") . ("␣"))
            (("TAB") . ("↹"))
            (("up") . ("↑"))
            (("right") . ("→"))
            (("down") . ("↓"))
            (("left") . ("←"))))
    (which-key-mode)))



(provide 'init-which-key)
