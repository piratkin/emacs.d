;; (use-package sudo-edit                  ; Edit files as root, through Tramp
;;   :ensure t
;;   ;; :defer t
;;   ;; :bind
;;   ;; (("C-c f s" . sudo-edit)
;;   ;;  ("C-c f S" . sudo-edit-current-file))
;;   )

(use-package auto-sudoedit
  :ensure t
  :config
  (setq auto-sudoedit-exclude-path
        '("^/usr/include"
         "^/wrk/"))
  (defun rc:string-matches (search strings)
    "Finding an occurrence of the string 'search' in the 'list' of strings"
    (while (and strings (not (string-match (car strings) search)))
      (setq strings (cdr strings)))
    strings)
  (defun auto-sudoedit-should-activate (curr-path)
    "Return non-nil if auto-sudoedit should activate for CURR-PATH."
    ;; (message "current-path: %s" curr-path)
    (not
     (or
      ;; Don't activate for system include path
      (rc:string-matches curr-path auto-sudoedit-exclude-path)
      ;; Don't activate for tramp files
      (tramp-tramp-file-p curr-path)
      ;; Don't activate on sudo do not exist
      (not (executable-find "sudo")))))
  (auto-sudoedit-mode 1))

;; (use-package smart-jump
;;   :ensure t
;;   :config
;;   (smart-jump-setup-default-registers))



(provide 'init-auto-sudoedit)
