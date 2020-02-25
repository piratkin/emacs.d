(setq terminal-emulator
      (find-if #'executable-find
               (list "uxterm"
                     "xterm"
                     "termite"
                     "gnome-terminal"
                     "xfce4-terminal")))

(use-package terminal-here
  :ensure t
  ;; :defer t
  :bind
  (:prefix "C-x t"
   :prefix-map terminal-here-map
   :prefix-docstring "Terminal here map."
   ("t" . terminal-here-launch)
   ("p" . terminal-here-project-launch))
  :config
  (setq terminal-here-terminal-command
        (list terminal-emulator)))
