(use-package doom-themes
  :init
  (load-theme 'doom-one t)
  :custom-face
  (default ((t (:height 110))))
  (fringe ((t (:foreground "#a200ff"))))
  (window-divider ((t (:foreground "#5d4d7a"))))
  ;; (fringe-arrow ((t (:foreground "red"))))
  :custom
  ;; (doom-themes-enable-bold t)
  ;; (doom-themes-enable-italic t)
  (x-stretch-cursor t)
  ;; (visible-bell 1)
  ;; (ring-bell-function 'ignore)
  (scroll-margin 2)
  (window-divider-default-places t)
  (window-divider-default-bottom-width 0)
  (window-divider-default-right-width 1)
  :config
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Hide cursor if window not have focus
  (setq-default cursor-in-non-selected-windows nil)
  ;;use larger font
  ;; (setq-default default-frame-alist '((font . "Source Code Pro-14")))
  (window-divider-mode +1))

;; (set-face-attribute 'fringe nil (:foreground "yellow", :foreground "yellow"))



(provide 'init-doom-themes)
