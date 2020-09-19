(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-one t)
  :config
  (setq x-stretch-cursor t
        scroll-margin 2
        window-divider-default-places t
        window-divider-default-bottom-width 0
        window-divider-default-right-width 1)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Hide cursor if window not have focus
  (setq-default cursor-in-non-selected-windows nil)
  ;;use larger font
  ;; (setq-default default-frame-alist '((font . "Source Code Pro-14")))
  (window-divider-mode +1))

;; (set-face-attribute 'fringe nil (:foreground "yellow", :foreground "yellow"))



(provide 'init-doom-themes)
