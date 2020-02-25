(use-package awesome-tab
  :quelpa
  (awesome-tab :fetcher github :repo "manateelazycat/awesome-tab")
  :custom
  (awesome-tab-display-icon t)
  (awesome-tab-style 'bar)
  (awesome-tab-display-sticky-function-name t)
  :config
  (awesome-tab-mode t)
  (when (not (display-graphic-p))
    (setq frame-background-mode 'dark)))



(provide 'init-awesome-tab)
