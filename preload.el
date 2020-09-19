;; (message "script: %s" "preload.el")
(require 'package)
(setq package-check-signature nil)

;; Sources for installing packages
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; Prefer newer .el files.
(setq load-prefer-newer t)

;;
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; ;; Refresh package descriptions
;; (unless package-archive-contents
;;    (package-refresh-contents))

;; Initialize packages
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;;; Install use-package if not already done
(unless (package-installed-p 'use-package)
  (message "Install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  ;; Tell more verbosity
  (setq use-package-verbose t
        ;; Gathering packages load statistics
        ;; use-package-compute-statistics t
        ;; Catching errors during use-package expansion
        use-package-expand-minimally t
        use-package-enable-imenu-support t
        ;; (setq use-package-always-defer t)
        ;; Automatically install missing packages
        ;; use-package-always-ensure t;;
        ;; use-package-minimum-reported-time 0
        ))

;; (eval-when-compile
;;   (require 'use-package))
(require 'use-package)

;; Install quelpa
(unless (package-installed-p 'quelpa)
    (with-temp-buffer
      (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
      (eval-buffer)
      (quelpa-self-upgrade)
      ))

;; Install helper quelpa for use-package
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

;; (setq quelpa-update-melpa-p nil
;;       quelpa-self-upgrade-p nil)
;; (quelpa-use-package-activate-advice)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Quelpa, for packages from source in git
;; (use-package quelpa
;;   :ensure t
;;   :requires use-package)
;; ;; Quelpa handler for use-package
;; (use-package quelpa-use-package
;;   :ensure t
;;   ;; :requires quelpa
;;   :after (quelpa)
;;   :init
;;   (setq quelpa-update-melpa-p nil)
;;   (setq quelpa-self-upgrade-p nil)
;;   :config
;;   ;; Handle the `use-package-always-ensure' setting
;;   (quelpa-use-package-activate-advice)
;;   ;; ;; Make :ensure t use quelpa instead of package.el
;;   ;; (setq use-package-ensure-function 'quelpa)
;;   )

;; (use-package quelpa-use-package
;;   :ensure t
;;   ;; :requires quelpa
;;   ;; :after (quelpa)
;;   ;; :init
;;   ;; (setq quelpa-update-melpa-p nil)
;;   ;; (setq quelpa-self-upgrade-p nil)
;;   :config
;;   ;; Handle the `use-package-always-ensure' setting
;;   (quelpa-use-package-activate-advice)
;;   ;; ;; Make :ensure t use quelpa instead of package.el
;;   ;; (setq use-package-ensure-function 'quelpa)
;;   )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Automatically update packages
(use-package auto-package-update
 :ensure t
 :config
 (setq auto-package-update-delete-old-versions t
       auto-package-update-hide-results t
       auto-package-update-interval 7)
 (auto-package-update-maybe))

(use-package async-bytecomp
 :ensure async
 :init
 (setq async-bytecomp-allowed-packages '(all))
 :config
 (async-bytecomp-package-mode))

;; native-compile support
(when (version<= "28.0.50" emacs-version)
  (use-package comp
    :init (setq comp-deferred-compilation t)))

;; (when (version<= "24.4" emacs-version)
;;   (use-package paradox
;;     :ensure t
;;     :commands paradox-list-packages))

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

;; Set dotmacs directory's location
(setq dotmacs-root-directory "~/.dotmacs.d/")

(use-package recentf
  :ensure t
  :init
  (setq recentf-save-file (concat dotmacs-root-directory "cache/recentf")
        recentf-auto-cleanup 'never
        ;; recentf-max-menu-items 25
        recentf-max-saved-items 1000)
  :config
  (add-to-list 'recentf-exclude "\\.gz$/")
  (add-to-list 'recentf-exclude "\\.bak$/")
  (add-to-list 'recentf-exclude "\\.git/")
  (add-to-list 'recentf-exclude "\\.gitignore$")
  (add-to-list 'recentf-exclude "\\.*autoloads\\.el$")
  (add-to-list 'recentf-exclude "/cache/")
  (add-to-list 'recentf-exclude "/tmp/")
  (add-to-list 'recentf-exclude "/bin/")
  (add-to-list 'recentf-exclude "/\\.emacs\\.d/")
  (add-to-list 'recentf-exclude "/usr/include/")
  (add-to-list 'recentf-exclude "^/sudo:")
  ;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  (recentf-mode 1))

(use-package bookmark
  :config
  (setq bookmark-default-file (concat dotmacs-root-directory "cache/bookmarks"))
  ;; (setf bookmark-save-flag 1)
  (when (file-exists-p bookmark-default-file)
    (bookmark-load bookmark-default-file t)))

(use-package custom
  :config
  (setq custom-file (expand-file-name "custom.el" (concat dotmacs-root-directory "cache")))
  (when (file-exists-p custom-file)
    (load custom-file)))

(use-package savehist
  :ensure t
  :config
  (setq history-length t
        history-delete-duplicates t
        ;; savehist-save-minibuffer-history t
        ;; savehist-additional-variables
        ;; '(kill-ring
        ;;   search-ring
        ;;   regexp-search-ring)
        savehist-file (concat dotmacs-root-directory "cache/history"))
  (savehist-mode +1))

(use-package server
  :ensure t
  :config
  (unless (server-running-p)
    (server-start)))



;;; Configure
(require 'rconf)



(provide 'preload)
