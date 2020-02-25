(use-package symbol-overlay
  :diminish
;  :bind
;  (("C-x C-n" . symbol-overlay-switch-forward)
;   ("C-x C-p" . symbol-overlay-switch-backward)
;   ("C-x c" . symbol-overlay-remove-all)
;   ("M-i" . symbol-overlay-put)
;   ("M-n" . symbol-overlay-jump-next)
;   ("M-p" . symbol-overlay-jump-prev))
  :custom-face
  (symbol-overlay-default-face
   ;todo: underlint ounly for tags
   ;((t (:inherit bold :underline t)))
   ((t (:inherit bold))))
  :hook
  ((prog-mode . symbol-overlay-mode)
   (w--theme-changed-hook . w--symbol-overlay-tweak-faces))
  :custom
  (symbol-overlay-idle-time 0.1))

(provide 'init-symbol-overlay)
