(use-package selected
  :ensure t
  :init
  (selected-minor-mode)
  :bind
  (:map selected-keymap
   ("w" . er/expand-region)
   ("q" . selected-off)
   ("u" . upcase-region)
   ("d" . downcase-region)
   ("g" . google-this)
   ("m" . apply-macro-to-region-lines)))
