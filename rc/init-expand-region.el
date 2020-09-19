(use-package expand-region
  :ensure t
  :after (evil)
  :config
  (define-key evil-motion-state-map "t" 'er/expand-region)
  (define-key evil-motion-state-map "T" 'er/contract-region)
  (define-key evil-inner-text-objects-map "i" 'er/mark-inside-pairs)
  (define-key evil-outer-text-objects-map "a" 'er/mark-outside-pairs)
  (define-key evil-inner-text-objects-map "I" 'er/mark-inside-quotes)
  (define-key evil-outer-text-objects-map "A" 'er/mark-outside-quotes)
  (define-key evil-inner-text-objects-map "E" 'er/mark-symbol-with-prefix)
  (define-key evil-inner-text-objects-map "e" 'er/mark-symbol)
  (define-key evil-inner-text-objects-map "u" 'er/mark-url)
  (define-key evil-inner-text-objects-map "U" 'er/mark-email))



(provide 'init-expand-region)
