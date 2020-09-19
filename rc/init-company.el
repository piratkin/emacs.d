;; elisp
(setq company-backends-elisp
      '((company-elisp
         :width company-yasnippet
         :width company-capf
         :width company-dabbrev-code
         :width company-keywords
         :width company-files)))

;; c/c++ (ctags)
(setq company-backends-ctags
      '((company-etags
         :width company-yasnippet
         :width company-c-headers
         :width company-capf
         :width company-dabbrev-code
         :width company-keywords
         :width company-files)))

;; c/c++ (ggtags)
(setq company-backends-ggtags
      '((company-capf
         :width company-yasnippet
         :width company-c-headers
         :width company-dabbrev-code
         :width company-keywords
         :width company-files)))

;; cmake
(setq company-backends-cmake
      '((company-cmake
         :width company-yasnippet
         :width company-capf
         :width company-dabbrev-code
         :width company-keywords
         :width company-files)))

;; nginx
(setq company-backends-nginx
      '((company-nginx
         :width company-yasnippet
         :width company-capf
         :width company-dabbrev-code
         :width company-keywords
         :width company-files)))

;; ansible
(setq company-backends-ansible
      '((company-ansible
         :width company-yasnippet
         :width company-capf
         :width company-dabbrev-code
         :width company-keywords
         :width company-files)))

;; text
(setq company-backends-text
      '((company-capf
         :width company-yasnippet
         :width company-dabbrev
         :width company-keywords
         ;; :width company-dict
         :width company-files)))

(add-hook 'cmake-mode-hook (lambda () (setq company-backends company-backends-cmake)))
(add-hook 'ansible-mode-hook (lambda () (setq company-backends company-backends-ansible)))
(add-hook 'nginx-mode-hook (lambda () (setq company-backends company-backends-nginx)))
(add-hook 'text-mode-hook (lambda () (setq company-backends company-backends-text)))
(add-hook 'elisp-mode-hook (lambda () (setq company-backends company-backends-elisp)))
;; ctags
;; (add-hook 'c-mode-hook (lambda () (setq company-backends company-backends-ctags)))
;; (add-hook 'c++-mode-hook (lambda () (setq company-backends company-backends-ctags)))
;; ggtags
(add-hook 'c-mode-hook (lambda () (setq company-backends company-backends-ggtags)))
(add-hook 'c++-mode-hook (lambda () (setq company-backends company-backends-ggtags)))
(add-hook 'php-mode-hook (lambda () (setq company-backends company-backends-ctags)))
(add-hook 'python-mode-hook (lambda () (setq company-backends company-backends-ctags)))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :init
  (message "Init company")
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-selection-wrap-around nil
        company-tooltip-align-annotations t
        ;; company-require-match 'never
        ;; company-require-match nil
        ;; company-require-match t
        company-tooltip-limit 8
        completion-ignore-case t
        company-backends company-backends-text)
  (custom-set-faces
   '(company-preview ((t (:background "#282c34" :foreground "DimGray"))))
   '(company-preview-common ((t (:inherit company-preview :foreground "red"))))
   '(company-scrollbar-bg ((t (:background "gold"))))
   ;; '(company-scrollbar-fg ((t (:background "slateblue"))))
   '(company-scrollbar-fg ((t (:background "red"))))
   '(company-template-field ((t (:background "yellow" :foreground "black"))))
   '(company-tooltip ((t (:background "yellow" :foreground "black"))))
   '(company-tooltip-annotation ((t (:foreground "red4"))))
   '(company-tooltip-common ((t (:foreground "red"))))
   '(company-tooltip-selection ((t (:background "orange1"))))
   '(company-tooltip-mouse ((t (:background "blue" :foreground "white")))))
  :bind
  (:map company-active-map
        ([return] . company-complete-selection)
        ([backtab] . company-complete-common)
        ([tab] . company-complete))
  :config
  (setq company-transformers '(company-sort-by-backend-importance)
        company-frontends '(;company-pseudo-tooltip-frontend
                            company-pseudo-tooltip-unless-just-one-frontend-with-delay
                            company-echo-metadata-frontend
                            company-preview-frontend)))

(use-package company-dabbrev
  :ensure nil
  :after (company)
  :init
  (setq company-dabbrev-other-buffers 'all
        company-dabbrev-minimum-length 2
        ;; company-dabbrev-ignore-buffers "nil"
        ;; company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)
  :config
  (message "Init company-dabbrev"))

(use-package company-dabbrev-code
  :ensure nil
  :after (company)
  :init
  (setq company-dabbrev-code-modes t
        company-dabbrev-code-ignore-case nil
        company-dabbrev-code-everywhere t)
  :config
  (message "Init company-dabbrev-code"))

(use-package company-dict
  :ensure t
  :after (company)
  :config
  ;; (push 'company-dict company-backends)
  (message "Init company-dict"))

(use-package company-ansible
  :ensure t
  :after (company)
  :config
  ;; (push 'company-ansible company-backends)
  (message "Init company-ansible"))

(use-package company-nginx
  :ensure t
  :after (company nginx-mode)
  :hook (nginx-mode . company-nginx-keywords)
  :config
  ;; (push 'company-nginx company-backends)
  (message "Init company-nginx"))

(use-package company-c-headers
  :ensure t
  :after (company)
  :config
  ;; (push 'company-c-headers company-backends)
  (message "Init company-c-headers"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; Run M-x company-tabnine-install-binary to install
;; ;; ;; the TabNine binary for your system.
;; (use-package company-tabnine
;;   :ensure t
;;   :after (company)
;;   :init
;;   (setq company-tabnine-binaries-folder "~/.dotmacs.d/bin/tabnine")
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine))

;; (use-package company-lsp
;;   :ensure t
;;   :after company
;;   :config
;;   (push 'company-lsp company-backends))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package company-clang
;;   :ensure nil
;;   :after (company)
;;   :init
;;   (message "Init company-clang"))

(use-package company-etags
  :ensure nil
  :after (company)
  :config
  (message "Init company-etags")
  (setq company-etags-everywhere t))

;; (use-package company-gtags
;;   :ensure nil
;;   :after (company)
;;   :config
;;   (message "Init company-gtags"))

;; (use-package company-yasnippet
;;   :ensure nil
;;   ;; :bind ("C-M-y" . company-yasnippet)
;;   :after (company)
;;   :config
;;   ;; (push 'company-yasnippet company-backends)
;;   ;; (push '(company-ctags :with company-yasnippet) company-backends)
;;   (message "Init company-yasnippet"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package company-fuzzy
;;   :ensure t
;;   :config
;;   (global-company-fuzzy-mode t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Better sorting and filtering
;; (use-package company-prescient
;;   :ensure t
;;   :hook (company-mode . company-prescient-mode))

(use-package company-statistics
  :ensure t
  :after (company)
  :hook (company-mode . company-statistics-mode)
  :init
  (setq company-statistics-file
        (concat dotmacs-root-directory
                "cache/company-statistics-cache.el"))
  :config
  (add-to-list 'company-transformers 'company-sort-by-statistics t)
  (message "Init company-statistics"))

;; (use-package company-flx
;;   :ensure t
;;   :after (company)
;;   :config
;;   (company-flx-mode +1))




(provide 'init-company)
