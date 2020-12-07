;; (use-package ggtags
;;   :ensure t
;;   :after(evil)
;;   :commands
;;   (ggtags-get-libpath)
;;   :hook
;;   ((c-mode c++-mode) . ggtags-mode)
;;   :init
;;   (defun gtags-ext-produce-tags-if-needed (dir)
;;     (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
;;         (let ((default-directory dir))
;;           (shell-command "gtags && echo 'created tagfile'"))
;;       ;;  tagfile already exists; update it
;;       (shell-command "global -u && echo 'updated tagfile'"))
;;     )
;;   ;; @see http://emacs-fu.blogspot.com.au/2008/01/navigating-through-source-code-using.html
;;   (defun rc:tags-create-or-update ()
;;     "create or update the gnu global tag file"
;;     (interactive)
;;     (gtags-ext-produce-tags-if-needed
;;      (read-directory-name
;;       "gtags: top of source tree:" default-directory)))
;;   (defun gtags-ext-add-gtagslibpath (libdir &optional del)
;;     "add external library directory to environment variable GTAGSLIBPATH.\ngtags will can that directory if needed.\nC-u M-x add-gtagslibpath will remove the directory from GTAGSLIBPATH."
;;     (interactive "DDirectory containing GTAGS:\nP")
;;     (let (sl)
;;       (if (not (file-exists-p (concat (file-name-as-directory libdir) "GTAGS")))
;;           ;; create tags
;;           (let ((default-directory libdir))
;;             (shell-command "gtags && echo 'created tagfile'")))

;;       (setq libdir (directory-file-name libdir)) ;remove final slash
;;       (setq sl (split-string (if (getenv "GTAGSLIBPATH") (getenv "GTAGSLIBPATH") "")  ":" t))
;;       (if del (setq sl (delete libdir sl)) (add-to-list 'sl libdir t))
;;       (setenv "GTAGSLIBPATH" (mapconcat 'identity sl ":"))
;;       ))
;;   (defun gtags-ext-print-gtagslibpath ()
;;     "print the GTAGSLIBPATH (for debug purpose)"
;;     (interactive)
;;     (message "GTAGSLIBPATH=%s" (getenv "GTAGSLIBPATH")))
;;   ;; (defun rc:tags-create-or-update ()
;;   ;;   "Update tag database"
;;   ;;   (interactive)
;;   ;;   (gtags-ext-create-or-update))
;;   ;; (defun rc:evil-gtags-goto-dwim ()
;;   ;;   (interactive)
;;   ;;   (if  (derived-mode-p 'c-mode 'c++-mode)
;;   ;;       (counsel-gtags-dwim)
;;   ;;     (evil-goto-definition)))
;;   (setenv "GTAGSTHROUGH" "true")
;;   (setenv "GTAGSLABLE" "gtags")
;;   :config
;;   ;; (defun ggtags-global-build-command (cmd &rest args)
;;   ;;   ;; CMD can be definition, reference, symbol, grep, idutils
;;   ;;   (let ((xs (append (list (shell-quote-argument (ggtags-program-path "global"))
;;   ;;                           "-v -T --path-style=abslib"
;;   ;;                           (format "--result=%s" ggtags-global-output-format)
;;   ;;                           (and ggtags-global-ignore-case "--ignore-case")
;;   ;;                           (and ggtags-global-use-color
;;   ;;                                (ggtags-find-project)
;;   ;;                                (ggtags-project-has-color (ggtags-find-project))
;;   ;;                                "--color=always")
;;   ;;                           ;; (and (ggtags-find-project)
;;   ;;                           ;;      (ggtags-project-has-path-style (ggtags-find-project))
;;   ;;                           ;;      "--path-style=shorter")
;;   ;;                           (and ggtags-global-treat-text "--other")
;;   ;;                           (pcase cmd
;;   ;;                             ((pred stringp) cmd)
;;   ;;                             (`definition nil) ;-d not supported by Global 5.7.1
;;   ;;                             (`reference "--reference")
;;   ;;                             (`symbol "--symbol")
;;   ;;                             (`path "--path")
;;   ;;                             (`grep "--grep")
;;   ;;                             (`idutils "--idutils")))
;;   ;;                     args)))
;;   ;;     (mapconcat #'identity (delq nil xs) " ")))
;;   ;; (define-key evil-motion-state-map "gd" 'rc:evil-gtags-goto-dwim)
;;   (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
;;   (setq ggtags-update-on-save t
;;         ;; ggtags-global-ignore-case t
;;         ;; ggtags-use-idutils t
;;         ggtags-sort-by-nearness t
;;         ;; ggtags-completing-read-function 'nil
;;         ;; ggtags-global-search-libpath-for-reference t
;;         ggtags-find-tag-hook '(recenter reposition-window)))

;; ;;; Патчинг ggtags для того, чтобы он всегда искал в /usr/include
;; (defun -ggtags-through (original-fn cmd &rest args)
;;   (let* ((original-result (apply original-fn cmd args))
;;          (splitted-result (split-string original-result " "))
;;          (patched-result
;;           (cons (car splitted-result) (cons "--through" (cdr splitted-result)))))
;;     (mapconcat #'identity patched-result " ")))
;; (advice-add 'ggtags-global-build-command :around #'-ggtags-through)

(use-package ggtags
  :ensure t
  ;; :bind
  ;; (("<f6>" . ggtags-find-reference)
  ;;  ("<f7>" . ggtags-find-definition)
  ;;  ("<f8>" . pop-tag-mark))
  :config
  (progn
    ;; (setq ggtags-global-ignore-case t)
    ;; (setq ggtags-completing-read-function nil)
    ;; (setq ggtags-update-tags t)
    (setq ggtags-update-on-save t)
    (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
    (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
    (add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))
    (eldoc-mode t)))



(provide 'init-ggtags)
