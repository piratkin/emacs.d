(use-package font-lock
  :ensure nil
  :custom
  (font-lock-support-mode 'jit-lock-mode)
  (font-lock-maximum-decoration t)
  (font-lock-maximum-size nil)
  (font-lock-verbose nil)
  (jit-lock-stealth-time 16)
  (jit-lock-defer-contextually t)
  (jit-lock-stealth-nice 0.5)
  :config
  (setq-default font-lock-multiline t)
  (global-font-lock-mode t))

(use-package font-lock+
  :requires (font-lock quelpa-use-package)
  :quelpa (font-lock+ :fetcher github :repo "emacsmirror/font-lock-plus"))

(use-package modern-cpp-font-lock
  :diminish modern-c++-font-lock-mode
  :diminish modern-c++-font-lock-global-mode
  :ensure t
  :mode ("\\.cpp\\'" . c++-mode)
  :mode ("\\.cc\\'" . c++-mode)
  :mode ("\\.hpp\\'" . c++-mode)
  :mode ("\\.hh\\'" . c++-mode)
  :hook
  (c++-mode . modern-c++-font-lock-mode))

(provide 'init-font-lock)
