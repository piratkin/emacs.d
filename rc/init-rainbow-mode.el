(use-package rainbow-mode
  :ensure t
  :commands
  (rainbow-turn-on
   rainbow-turn-off)
  :hook
  ((html-mode css-mode php-mode nxml-mode xml-mode) . rainbow-turn-on))



(provide 'init-rainbow-mode)
