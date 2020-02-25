;;; Terminal emulation and shells
(use-package shell                      ; Dump shell in Emacs
  :defer t
  :bind ("C-c a t" . shell))

(use-package term                       ; Terminal emulator in Emacs
  :defer t
  :bind ("C-c a T" . ansi-term))



(provide 'init-shell)
