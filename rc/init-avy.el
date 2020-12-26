(use-package avy
  :ensure t
  :config
  (progn
    (setq avy-all-windows nil)
    (setq avy-highlight-first t)
    (setq avy-style 'de-bruijn)
    (setq avy-background t)))

;; (set-face-attribute 'avy-lead-face-0 nil :foreground "white" :background "#e52b50")
;; (set-face-attribute 'avy-lead-face-1 nil :foreground "white" :background "#f86bf3")
;; (set-face-attribute 'avy-lead-face-2 nil :foreground "white" :background "#4f57f9")
;; (set-face-attribute 'avy-lead-face nil :foreground "white" :background "#e52b50")
;; ;; Цвет неактивного текста, затенение лишних символов
;; (set-face-attribute 'avy-background-face nil :foreground "ivory4")



(provide 'init-avy)
