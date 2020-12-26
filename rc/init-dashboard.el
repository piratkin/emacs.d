(use-package dashboard
  :ensure t
  ;; :after doom-modeline
  ;; :diminish dashboard-mode
  ;; :hook (after-init . (lambda () (setq mode-line-format nil))) ; Hide modeline
  :init
  ;; (set-face-attribute
  ;;  'dashboard-no-items
  ;;  nil
  ;;  :foreground "red"
  ;;  :weight 'bold
  ;;  :slant 'italic)
  ;; (setq mode-line-format nil) ; Hide modeline
  (setq dashboard-banner-logo-title nil
        ;; dashboard-image-banner-max-height 50
        dashboard-set-heading-icons nil
        dashboard-enable-page-break-lines t
        dashboard-set-file-icons t
        dashboard-set-init-info t
        ;; dashboard-init-info "Do or do not. There is no try."
        dashboard-set-footer t
        dashboard-footer-icon (all-the-icons-octicon
                               "mail"
                               :height 1.1
                               :v-adjust -0.05
                               :face 'font-lock-keyword-face)
        dashboard-items '((recents  . 15)
                          ;; (projects . 5)
                          ;; (registers . 5)
                          (agenda . 5)
                          (bookmarks . 5))
        dashboard-footer-messages '("piratkin@tut.by"))
  (if (< (length command-line-args) 2)
      (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))))
  :config
  (setq dashboard-startup-banner 11
        dashboard-banners-directory "~/.dotmacs.d/usr/banners/")
  (dashboard-setup-startup-hook))



(provide 'init-dashboard)
