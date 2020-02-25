(use-package whitespace
  :ensure t
  :hook
  ((prog-mode text-mode) . whitespace-mode)
  ;; Automatically delete extra spaces and tabs at the end of lines
  (before-save . delete-trailing-whitespace)
  :custom-face
  ;; (whitespace-line ((t (:bold nil :background nil))))
  (whitespace-trailing ((t (:background "#815da4"))))
  (whitespace-space-before-tab ((t (:background "#6f4697"))))
  (whitespace-space-after-tab ((t (:background "#5d2f8a"))))
  (whitespace-tab ((t (:background "#4c187e"))))
  :custom
  ;; (whitespace-line-column 80)
  (whitespace-style
   '(face
     tabs
     empty
     ;; lines-tail
     ;; lines
     spaces
     newline
     ;; indentation::tab
     ;; indentation::space
     ;; indentation
     ;; space-after-tab::tab
     space-after-tab::space
     ;; space-after-tab
     ;; space-before-tab::tab
     space-before-tab::space
     ;; space-before-tab
     ;; space-mark
     ;; tab-mark
     ;; newline-mark
     trailing))
  ;; :config
  ;; (global-whitespace-mode)
  ;; (whitespace-mode +1)
  ;; (whitespace-newline-mode +1)
  )



(provide 'init-whitespace)
