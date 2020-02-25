(use-package simple
  :ensure nil
  :delight
  (auto-fill-function)
  :bind
  ("C-x p" . pop-to-mark-command)
  :hook
  ((prog-mode . turn-on-auto-fill)
   (text-mode . turn-on-auto-fill))
  :custom
  (set-mark-command-repeat-pop t))



(provide 'init-simple)
