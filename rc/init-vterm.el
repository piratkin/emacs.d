;; (setq terminal-emulator
;;       (find-if #'executable-find
;;                (list "uxterm"
;;                      "xterm"
;;                      "termite"
;;                      "gnome-terminal"
;;                      "xfce4-terminal")))

;; (use-package terminal-here
;;   :ensure t
;;   ;; :defer t
;;   :bind
;;   (:prefix "C-x t"
;;    :prefix-map terminal-here-map
;;    :prefix-docstring "Terminal here map."
;;    ("t" . terminal-here-launch)
;;    ("p" . terminal-here-project-launch))
;;   :config
;;   (setq terminal-here-terminal-command
;;         (list terminal-emulator)))


;; (use-package ansi-term
;;   :ensure t
;;   :hook
;;   ((prog-mode text-mode) . whitespace-mode)
;; (add-hook 'term-mode-hook 'compilation-shell-minor-mode)
;;   :config


;; (use-package vterm
;;   :ensure t
;; ;;  :hook
;; ;;  (vterm-mode . (lambda () (setq evil-default-state' emacs)))
;;   ;; :init
;;   ;; (setq vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=no")
;;   :config
;;   ;; (define-key vterm-mode-map [return] #'vterm-send-return)
;;   ;; (evil-define-key 'insert vterm-mode-map (kbd "t")  #'vterm--self-insert)
;;   (evil-define-key 'normal vterm-mode-map (kbd ",c") #'multi-vterm)
;;   (evil-define-key 'normal vterm-mode-map (kbd ",n") #'multi-vterm-next)
;;   (evil-define-key 'normal vterm-mode-map (kbd ",p") #'multi-vterm-prev)
;;   (setq vterm-max-scrollback 100000
;;         ;; vterm-buffer-name-string "TERM - %s"
;;         ;; vterm-term-environment-variable "eterm-color"
;;         ;; vterm-disable-underline t
;;         ;; vterm-keymap-exceptions nil
;;         vterm-clear-scrollback-when-clearing t))

;; (use-package multi-vterm
;;   :ensure t
;;   :after (vterm)
;;   :config
;;   (setq multi-vterm-buffer-name "vterm"))

(use-package multi-vterm
  :ensure t
  :after (evil vterm)
  :config
  (evil-define-key 'normal vterm-mode-map (kbd ",c") #'multi-vterm)
  (evil-define-key 'normal vterm-mode-map (kbd ",n") #'multi-vterm-next)
  (evil-define-key 'normal vterm-mode-map (kbd ",p") #'multi-vterm-prev)
  (setq multi-vterm-dedicated-window t))

(use-package vterm
  :ensure t
  :config
  (setq vterm-use-vterm-prompt-detection-method t
        vterm-shell (if (file-readable-p "/usr/bin/zsh") "/usr/bin/zsh" "/bin/bash")
        vterm-max-scrollback 100000))



(provide 'init-vterm)
