(use-package frame                      ; Frames
  :ensure nil
  ;; :bind
  ;; (:prefix "C-c w"
  ;;  :prefix-map window-map
  ;;  :prefix-docstring "Window map."
  ;;  ("F" . toggle-frame-fullscreen))
  :init
  ;; Kill `suspend-frame'
  (global-set-key (kbd "C-z") nil)
  (global-set-key (kbd "C-x C-z") nil))



(provide 'init-frame)
