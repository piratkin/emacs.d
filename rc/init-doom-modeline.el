(use-package doom-modeline
  :ensure t
  ;; :after dashboard
  ;; :after (doom-themes all-the-icons evil dashboard)
  ;; :init
  ;; (setq doom-modeline-height 30)
  :hook
  ((after-init . doom-modeline-init)
   (after-init . (lambda () (message "Init doom-modeline"))))
  ;; (modeline-mode . (lambda () (setq mode-line-format nil)))
  ;; :custom
  ;; (doom-modeline-minor-modes t)
  ;; (doom-modeline-enable-word-count t)
  ;; (doom-modeline-continuous-word-count-modes t)
  ;; (doom-modeline-indent-info t)
  :init
  (doom-modeline-mode 1)
  (message "Config doom-modeline")
  :config
  (setq column-number-mode t)
  (setq find-file-visit-truename t)
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-set-modeline 'gs t)
  (set-face-foreground 'doom-modeline-evil-emacs-state "#b432ff") ;; magenta
  (set-face-foreground 'doom-modeline-evil-normal-state "#b432ff") ;; magenta
  (set-face-foreground 'doom-modeline-evil-insert-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-replace-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-operator-state "#28def0") ;; green
  (set-face-foreground 'doom-modeline-evil-motion-state "red")
  (set-face-foreground 'doom-modeline-evil-visual-state "#eead0e") ;; yellow
  (setq doom-modeline-buffer-modification-icon t
        ;; doom-modeline-icon t
        ;; doom-modeline-modal-icon t
        doom-modeline-height 34
        doom-modeline-unicode-fallback t
        doom-modeline-bar-width 3))

;; (add-hook 'modeline-mode-hook #'doom-modeline-mode)
;; (add-hook 'modeline-mode-hook #'(lambda () (setq mode-line-format nil)))

;; (use-package fancy-battery
;;   :after doom-modeline
;;   :hook (after-init . fancy-battery-mode))



(provide 'init-doom-modeline)
