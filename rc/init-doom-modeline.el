(use-package doom-modeline
  :ensure t
  :after (doom-themes all-the-icons evil)
  ;; :hook (after-init . doom-modeline-mode)
  :custom
  (column-number-mode t)
  (find-file-visit-truename t)
  (doom-modeline-icon t)
  (doom-modeline-unicode-fallback t)
  ;; (doom-modeline-minor-modes t)
  ;; (doom-modeline-enable-word-count t)
  ;; (doom-modeline-continuous-word-count-modes t)
  ;; (doom-modeline-indent-info t)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  :config
  ;; (doom-modeline-def-modeline
  ;;   'gs
  ;;   ;; Left mode line segments
  ;;   '(bar
  ;;     ;; workspace-number
  ;;     window-number
  ;;     "  "
  ;;     matches
  ;;     buffer-info
  ;;     buffer-position
  ;;     selection-info)
  ;;   ;; Right mode line segments
  ;;   '(major-mode
  ;;     vcs
  ;;     ;; flycheck
  ;;     ))
  (doom-modeline-set-modeline 'gs t)
  ;; (setq doom-modeline-enable-word-count t)
  (set-face-foreground 'doom-modeline-evil-emacs-state "#b432ff") ;; magenta
  (set-face-foreground 'doom-modeline-evil-normal-state "#b432ff") ;; magenta
  (set-face-foreground 'doom-modeline-evil-insert-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-replace-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-operator-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-motion-state "red")
  (set-face-foreground 'doom-modeline-evil-visual-state "#eead0e") ;; yellow
  (setq inhibit-compacting-font-caches t)
  :init
  ;; (setq doom-modeline-height 30)
  (setq doom-modeline-bar-width 3)
  (doom-modeline-mode t))

;; (use-package fancy-battery
;;   :after doom-modeline
;;   :hook (after-init . fancy-battery-mode))



(provide 'init-doom-modeline)
