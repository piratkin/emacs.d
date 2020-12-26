(use-package helm
  :ensure t
  :init
  (progn
    (setq helm-recentf-fuzzy-match t)
    (setq helm-semantic-fuzzy-match t)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-apropos-fuzzy-match t)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-mode-fuzzy-match t)
    (setq helm-completion-in-region-fuzzy-match t))
  :config
  (progn
    (setq helm-echo-input-in-header-line t)
    ;; (setq helm-move-to-line-cycle-in-source t)
    (setq helm-full-frame t)
    (setq helm-input-idle-delay 0.05))
  (helm-mode 1))

;----------------------------------------------------

;; (use-package helm-unicode
;;   :ensure nil)

(use-package helm-command
  :ensure nil)

(use-package helm-elisp
  :ensure nil)

(use-package helm-locate
  :ensure nil
  :config
  (progn
    (setq helm-locate-fuzzy-match t)))

(use-package helm-files
  :ensure nil
  :config
  (progn
    ;; (setq helm-ff-file-name-history-use-recentf t)
    (setq helm-ff-search-library-in-sexp t)))

(use-package helm-semantic
  :ensure nil
  ;; :after (semantic)
  )

(use-package helm-buffers
  :ensure nil
  :config
  (progn
    (setq helm-buffers-fuzzy-matching t)))

(use-package helm-imenu
  :ensure nil
  :config
  (progn
    (setq helm-imenu-fuzzy-match t)))

(use-package helm-gtags
  :ensure t
  :after (ggtags)
  :init
  (progn
    (setq helm-gtags-fuzzy-match t))
  :config
  (progn
    ;; (setq helm-gtags-ignore-case t)
    ;; (setq helm-delete-minibuffer-contents-from-point t)
    ;; (setq helm-gtags-pulse-at-cursor t)
    ;; (setq helm-gtags-auto-update t)
    (setq helm-gtags-use-input-at-cursor t)
    (add-hook 'c-mode-common-hook
              (lambda ()
                (when (derived-mode-p 'c-mode 'c++-mode)
                  (helm-gtags-mode 1))))))

;----------------------------------------------------

(defun rc:create-or-update-tags ()
  (interactive)
  (let ((label "ctags")
        (root-dir (locate-dominating-file default-directory "GTAGS")))
    (if root-dir
        (helm-gtags-create-tags root-dir label)
      (helm-gtags-create-tags (read-directory-name "Root Directory: ") label))))

(defun rc:find-tag-reference ()
  (interactive
   (helm-gtags-find-rtag (thing-at-point 'symbol))))

(defun rc:goto-definiton-dwim ()
  (interactive)
  (if (derived-mode-p 'c-mode 'c++-mode)
      (helm-gtags-dwim)
    (evil-goto-definition)))

;----------------------------------------------------



(provide 'init-helm)
