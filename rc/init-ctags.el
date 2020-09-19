(use-package ctags-update
  :ensure t
  ;; :if (executable-find "ctags")
  :commands (ctags-update)
  ;; :hook
  ;; (c++-mode . turn-on-ctags-auto-update-mode)
  ;; (c-mode . turn-on-ctags-auto-update-mode)
  ;; (objc-mode . turn-on-ctags-auto-update-mode)
  ;; (python-mode . turn-on-ctags-auto-update-mode)
  ;; (php-mode . turn-on-ctags-auto-update-mode)
  ;; (java-mode . turn-on-ctags-auto-update-mode)
  ;; (emacs-lisp-mode . turn-on-ctags-auto-update-mode)
  :init
  (defun rc:tags-create-or-update ()
    "Update tag database"
    (interactive)
    (ctags-update))
  (setq ctags-update-prompt-create-tags nil)
  :config
  (ctags-global-auto-update-mode)
  (message "Init ctags-update"))

(use-package company-ctags
  :ensure t
  :after (company)
  :init
  (setq company-ctags-everywhere t
        company-ctags-fuzzy-match-p t)
  :config
  (company-ctags-auto-setup)
  (message "Init company-ctags"))



(provide 'init-ctags)
