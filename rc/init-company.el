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
  ;; :general ("C-SPC" #'company-complete)
  ;; :general ("C-SPC" #'company-complete-common)
  ;; :general ("C-SPC" #'company-complete-selection)
  ;; :hook
  ;; (after-init . global-company-mode)
  ;; :bind
  ;; (:map company-active-map
  ;;       ([return] . company-complete-selection)
  ;;       ([backtab] . company-complete-common)
  ;;       ([tab] . company-complete))
  :init
  (progn
    (setq company-backends company-backends-text)
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)
    (setq company-tooltip-align-annotations t)
    ;; (setq company-require-match 'never)
    ;; (setq company-require-match nil)
    ;; (setq company-require-match t)
    (setq company-tooltip-limit 7)
    ;; (setq completion-ignore-case t)
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
     '(company-tooltip-mouse ((t (:background "blue" :foreground "white"))))))
  :config
  (progn
    ;; todo: fix autocomplete without tooltip
    ;; (setq company-frontends
    ;;       '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
    ;;         company-preview-common-frontend))
    (setq company-frontends
          '(company-pseudo-tooltip-frontend))
    (setq company-transformers '(company-sort-by-backend-importance))
;; company-uninstall-map
;; company-install-map
;; company-search-map
    ;; (setq company-auto-commit t)
    ;; (setq company-selection-wrap-around t)
    ;(setq evil-complete-next-func 'company-complete-common-or-cycle)
    ;(setq evil-complete-previous-func 'company-complete-common-or-cycle)
    (setq company-global-modes '(not magit-mode gud-mode))
    (global-company-mode)
    ;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
    ;; (global-set-key [tab] 'tab-indent-or-complete)
    ;; company-complete-common -> Insert the common part of all candidates.
    ;; company-complete-selection -> Insert the selected candidate.
    ;; company-complete-common-or-cycle -> Insert the common part of all candidates, or select the next one
    ;; company-select-next-if-tooltip-visible-or-complete-selection
    ;; company-complete -> TAB
;; company-active-map
;;     RET
;;     SPC
;;     M-SPC
    ))

(use-package company-quickhelp
  :ensure t
  :after (company)
  :config
  (company-quickhelp-mode))

(use-package company-dabbrev
  :ensure nil
  :after (company)
  :config
  (progn
    (setq company-dabbrev-minimum-length 2)
    (setq company-dabbrev-ignore-case nil)
    (setq company-dabbrev-downcase case-replace)))

(use-package company-dabbrev-code
  :ensure nil
  :after (company)
  :config
  (progn
    (setq company-dabbrev-code-modes t)
    (setq company-dabbrev-code-ignore-case nil)
    (setq company-dabbrev-code-everywhere t)))

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

;; (use-package company-statistics
;;   :ensure t
;;   :after (company)
;;   :hook (company-mode . company-statistics-mode)
;;   :init
;;   (setq company-statistics-file
;;         (concat dotmacs-root-directory
;;                 "cache/company-statistics-cache.el"))
;;   :config
;;   (add-to-list 'company-transformers 'company-sort-by-statistics t)
;;   (message "Init company-statistics"))

;; (use-package company-flx
;;   :ensure t
;;   :after (company)
;;   :config
;;   (company-flx-mode +1))



(provide 'init-company)
