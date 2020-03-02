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
  (setq
   use-package-verbose t
   ;; Gathering packages load statistics
   use-package-compute-statistics t
   ;; Catching errors during use-package expansion
   use-package-expand-minimally t
   ;;
   use-package-enable-imenu-support t
   ;;
   ;; (setq use-package-always-defer t)
   ;; Automatically install missing packages
   use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))

;; Quelpa, for packages from source in git
(use-package quelpa
  :requires use-package)

;; Quelpa handler for use-package
(use-package quelpa-use-package
  :ensure t
  :requires quelpa
  :init
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-self-upgrade-p nil)
  :config
  ;; Handle the `use-package-always-ensure' setting
  (quelpa-use-package-activate-advice)
  ;; ;; Make :ensure t use quelpa instead of package.el
  ;; (setq use-package-ensure-function 'quelpa)
  )

;; Automatically update packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package auto-compile
  :ensure t
  :config
  (progn (auto-compile-on-load-mode)
         (auto-compile-on-save-mode)))

;;; Configure
(require 'rconf)



(provide 'preload)
