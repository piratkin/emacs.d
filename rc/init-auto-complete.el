(use-package auto-complete
  :ensure t
  :config
  (custom-set-faces
   '(ac-completion-face ((t (:foreground "DimGray" :background "#282c34"))))
   '(ac-candidate-face ((t (:background "yellow" :foreground "black"))))
   '(ac-candidate-mouse-face ((t (:background "coral2" :foreground "black"))))
   '(ac-selection-face ((t (:background "orange1" :foreground "red")))))
  (message "Init auto-complete"))

(use-package auto-complete-config
  :ensure auto-complete
  :config
  (ac-config-default)
  (setq ac-menu-height 8
        ac-auto-start 2
        ac-ignore-case 'smart
        ac-fuzzy-enable t)
  (message "Init auto-complete-config"))


;; (use-package auto-complete-c-headers
;;   :ensure t
;;   :after (auto-complete)
;;   :config
;;   (push 'ac-sources-c-headers ac-sources))

;; (use-package ac-c-headers
;;   :ensure t
;;   :after (auto-complete)
;;   :config
;;   (push 'ac-sources-c-headers ac-sources)
;;   (push 'ac-sources-c-header-symbols ac-sources))

;; (use-package ac-clang
;;   :ensure t
;;   :after (auto-complete)
;;   :config
;;   (ac-clang-initialize)
;;   (ac-clang-activate)
;;   (push 'ac-sources-clang ac-sources))

;; (use-package auto-complete-clang-async
;;   :ensure t
;;   :after (auto-complete)
;;   :config
;;   (push 'ac-sources-clang-async ac-sources))

;; (use-package auto-complete-exuberant-ctags
;;   :ensure t
;;   :after (auto-complete)
;;   :config
;;   (ac-exuberant-ctags-setup))

;; (use-package ac-irony
;;   ;; :after (auto-complete)
;;   :load-path  "~/.dotmacs.d/usr/ac-irony"
;;   ;; :quelpa (ac-irony :fetcher github :repo "Sarcasm/ac-irony")
;;   :config
;;   (add-to-list 'ac-sources 'ac-source-irony)
;;   (message "Init ac-irony"))


;; (use-package ac-irony
;;   :quelpa (ac-irony :fetcher github :repo "Sarcasm/ac-irony")
;;   :config
;;   (add-to-list 'ac-sources 'ac-source-irony)
;;   (message "Init ac-irony"))


  ;; (add-to-list 'load-path "~/.dotmacs.d/usr/ac-irony")
  ;; (require 'ac-irony)

  ;; (defun my-ac-irony-setup ()
  ;;   (add-to-list 'ac-sources 'ac-source-irony)
  ;;   (auto-complete-mode 1)
  ;;   ;; (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async)
  ;;   )

  ;; (add-hook 'irony-mode-hook 'my-ac-irony-setup)


(provide 'init-auto-complete)
