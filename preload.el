(require 'package)

;;; Sources for installing packages
(setq package-archives
	  '(("gnu" . "http://elpa.gnu.org/packages/")
	    ("melpa" . "http://melpa.org/packages/")
	    ("melpa-stable" . "http://stable.melpa.org/packages/")
	    ("org" . "http://orgmode.org/elpa/")
	    ("marmalade" . "http://marmalade-repo.org/packages/")))

;;; Disable automatic loading of packages after the init file
(setq package-enable-at-startup nil)

;;; Prefer newer .el files.
(setq load-prefer-newer t)

;;; Instead load them explicitly
(package-initialize)

;;; Refresh package descriptions
(unless package-archive-contents
   (package-refresh-contents))

;;; Install use-package if not already done
(unless (package-installed-p 'use-package)
  (message "Install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))

;;; Use-package for all others
(require 'use-package)

;;; Automatically install missing packages
(setq use-package-always-ensure t)

(provide 'preload)
