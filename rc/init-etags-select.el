(use-package etags-select
  :ensure t
  ;; :quelpa (etags-select :fetcher github :repo "diasjorge/etags-select")
  :commands
  (etags-select-find-tag
   etags-select-find-tag-at-point)
  ;; :config
  ;; (global-set-key "\M-?" 'etags-select-find-tag-at-point)
  ;; (global-set-key "\M-." 'etags-select-find-tag)
  ;; (defun sswanv/init-etags-select ()
  ;;   (use-package etags-select
  ;;     :init
  ;;     (progn
  ;;       (define-key evil-normal-state-map (kbd "gf")
  ;;         (lambda () (interactive) (find-tag (find-tag-default-as-regexp))))

  ;;       (define-key evil-normal-state-map (kbd "gb") 'pop-tag-mark)

  ;;       (define-key evil-normal-state-map (kbd "gn")
  ;;         (lambda () (interactive) (find-tag last-tag t)))

  ;;       (evilified-state-evilify etags-select-mode etags-select-mode-map)
  ;;       (spacemacs/set-leader-keys-for-major-mode 'js2-mode
  ;;                                                 "gd" 'etags-select-find-tag-at-point))))
  )


(provide 'init-etags-select)
