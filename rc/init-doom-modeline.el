(use-package doom-modeline
  :ensure t
  :after
  (doom-themes all-the-icons evil)
  ;; :hook (after-init . doom-modeline-mode)
  :custom
  (column-number-mode t)
  (find-file-visit-truename t)
  ;; (doom-modeline-icon t)
  (doom-modeline-unicode-fallback t)
  ;; (doom-modeline-minor-modes t)
  ;; (doom-modeline-enable-word-count t)
  ;; (doom-modeline-continuous-word-count-modes t)
  ;; (doom-modeline-indent-info t)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  :config
  (doom-modeline-set-modeline 'gs t)
  (set-face-foreground 'doom-modeline-evil-emacs-state "#b432ff") ;; magenta
  (set-face-foreground 'doom-modeline-evil-normal-state "#b432ff") ;; magenta
  (set-face-foreground 'doom-modeline-evil-insert-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-replace-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-operator-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-motion-state "red")
  (set-face-foreground 'doom-modeline-evil-visual-state "#eead0e") ;; yellow
  :init
  ;; (setq doom-modeline-height 30)
  (setq doom-modeline-modal-icon t)
  (setq doom-modeline-bar-width 3)
  (doom-modeline-mode t))

;; (use-package fancy-battery
;;   :after doom-modeline
;;   :hook (after-init . fancy-battery-mode))



(provide 'init-doom-modeline)
