(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
        ivy-display-style 'fancy
        ;; ivy-virtual-abbreviate 'fullpath
        ;; ivy-magic-tilde nil
        ;; ivy-dynamic-exhibit-delay-ms 150
        ;; ivy-use-selectable-prompt t
        ivy-count-format "%d/%d ")
  :config
  (ivy-mode +1))

;; (use-package fuz
;;   :ensure t
;;   :config
;;   (unless (require 'fuz-core nil t)
;;     (fuz-build-and-load-dymod)))
;; (use-package ivy-fuz
;;   :ensure t
;;   :after ivy
;;   :custom
;;   (ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
;;   (ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))
;;   :config
;;   (add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn)))

(use-package ivy-prescient
  :ensure t
  :after (ivy prescient)
  :preface
  (eval-when-compile
    (declare-function ivy-prescient-mode nil))
  :config
  (ivy-prescient-mode t))

(use-package ivy-rich
  :ensure t
  :after (ivy counsel)
  :preface
  (eval-when-compile
    (defvar ivy-rich-path-style)
    (declare-function ivy-rich-mode nil))
  :init
  (setq ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode t))

(use-package ivy-xref
  :ensure t
  :config
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))

(use-package counsel
  :ensure t
  :after (ivy)
  ;; :demand t
  ;; :init
  ;; (add-to-list 'ivy-ignore-buffers "^#")
  ;; (add-to-list 'ivy-ignore-buffers "^\\*irc\\-")
  ;; (with-eval-after-load 'evil-leader
  ;;   (evil-leader/set-key
  ;;     "bb" 'ivy-switch-buffer
  ;;     "br" 'counsel-recentf
  ;;     "dv" 'counsel-describe-variable
  ;;     "df" 'counsel-describe-function
  ;;     "/"  'counsel-rg))
  )

(use-package counsel-gtags
  :ensure t
  :after (evil)
  :hook
  ((c-mode c++-mode) . counsel-gtags-mode)
  ;; :init
  :config
;;   (defcustom counsel-gtags-path-style 'abslib
;;     "Path style of candidates.
;; The following values are supported:
;; - `root'     Show path from root of current project.
;; - `abslib'   Absolute from the GTAGSLIBPATH.
;; - `relative' Show path from current directory.
;; - `absolute' Show absolute path."
;;     :type '(choice (const :tag "Root of the current project" root)
;;                    (const :tag "Absolute from the GTAGSLIBPATH" abslib)
;;                    (const :tag "Relative from the current directory" relative)
;;                    (const :tag "Absolute path" absolute)))
  ;; (defun counsel-gtags--file-path-style ()
  ;;   (format "--path-style=%s"
  ;;           (pcase counsel-gtags-path-style
  ;;             ((or 'relative 'absolute 'abslib)
  ;;              (symbol-name counsel-gtags-path-style))
  ;;             ('root "through")
  ;;             (_
  ;;              (error "Unexpected counsel-gtags-path-style: %s"
  ;;                     (symbol-name counsel-gtags-path-style))))))
  (setq counsel-gtags-auto-update t
        counsel-gtags-path-style 'absolute)
  (message "Init counsel-gtags"))

(use-package swiper
  :ensure t
  :after ivy
  :bind
  (("\C-s" . swiper)))

(use-package prescient
  :ensure t
  :preface
  (eval-when-compile
    (declare-function prescient-persist-mode nil))
  :config
  (prescient-persist-mode t))



(provide 'init-ivy)
