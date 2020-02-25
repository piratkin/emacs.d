(use-package vimish-fold
  :ensure t
  :bind
  (:prefix "C-c v"
   :prefix-map vimish-fold-map
   :prefix-docstring "Map for vimish-fold operations."
   ("f" . vimish-fold)
   ("t" . vimish-fold-toggle)
   ("T" . vimish-fold-toggle-all)
   ("u" . vimish-fold-unfold)
   ("U" . vimish-fold-unfold-all)
   ("r" . vimish-fold-refold)
   ("R" . vimish-fold-refold-all)
   ("d" . vimish-fold-delete)
   ("D" . vimish-fold-delete-all)
   ("n" . vimish-fold-next-fold)
   ("p" . vimish-fold-previous-fold)))



(provide 'init-vimish-fold)
