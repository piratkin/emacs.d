(use-package doom-themes
  :init
  (load-theme 'doom-one t)
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
        
(use-package multiple-cursors)

(use-package vi-tilde-fringe
   :config
   (global-vi-tilde-fringe-mode))
   
(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package all-the-icons
  :config
  (setq inhibit-compacting-font-caches t))

;(use-package font-lock+
;  :ensure t
;  :quelpa
;  (font-lock+ :repo "emacsmirror/font-lock-plus" :fetcher github))

;(use-package font-lock
;  :config
;  (setq font-lock-maximum-decoration t)
;  (global-font-lock-mode))

(use-package whitespace
  :ensure t
  ;:hook 
  ;((prog-mode text-mode) . whitespace-mode)
  :custom-face 
  (whitespace-line ((t (:background "gray90"))))
  :custom 
  (whitespace-line-column 80)
  (whitespace-style '(face tabs empty trailing lines-tail))
  :config
  (global-whitespace-mode))
          

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CONFIGURE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hide welcome screen & startup message
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  
;;; utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Custom name
(setq frame-title-format "DOTEMACS: %b")

;; Highlight line color
(global-hl-line-mode)

;; Display file size in percentages into mode-line
(size-indication-mode t)

;; Set cursor color
(set-cursor-color "#ffff00")

;; Hide cursor if window not have focus
(setq-default cursor-in-non-selected-windows nil)

;; scroll one line
;(setq scroll-margin 1)

;; timeout lock font
(setq jit-lock-defer-time 0.01)

;;normal mouse wheele
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

;; sound bell off visible on
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; Indent settings
(setq c-default-style "stroustrup") ;;indent style in c/c++ code
(setq-default indent-tabs-mode nil) ;;disable the ability to indent TAB
(setq-default tab-width 4) ;;tab width - 4 whitespace
(setq-default c-basic-offset 4)
(setq-default standart-indent 4) ;;standard width of indent - 4 whitespace

;; highlight search resaults
(setq search-highlight t)
(setq query-replace-highlight t)

;;restore last session on startup
;(desktop-save-mode 1)

;; Delete selection
(delete-selection-mode t)

;; Better buffer rendering
(setq redisplay-dont-pause t)

;; Use system clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-selection-value)

;; Set short confirm command
(fset 'yes-or-no-p 'y-or-n-p)

;; Set build command
(setq compile-command "cd ../build && cmake -G \"Unix Makefiles\" -DCMAKE_EXPORT_COMPILE_COMMANDS=YES .. && cmake --build .")

;; Auto complete quots ({},[],())
(electric-pair-mode 1)

;; Move the cursor to a new window after C-x,2
(setq split-window-keep-point t)

;; Automatically delete extra spaces and tabs at the end of lines
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Do not remember the password in the cache for gpg files
(setq epa-file-cache-passphrase-for-symmetric-encryption nil)

;; Truncate-lines
(defun conf:truncate-lines ()
  (interactive)
  ;; turn off line wrapping
  (setq-default truncate-lines 1))
;;set hooks
(add-hook 'emacs-lisp-mode-hook 'conf:truncate-lines)
(add-hook 'c-mode-hook 'conf:truncate-lines)
(add-hook 'c++-mode-hook 'conf:truncate-lines)

;; Font-lock
(require 'font-lock)
(global-font-lock-mode)
(setq font-lock-maximum-decoration t)

;;
;; load project file
;;
(defun conf:project-load ()
  (let ((current-path (buffer-file-name))
        (project-file-name '".project")
         temp-path
         test-path)
      (while current-path
        (setq current-path (file-name-directory (directory-file-name current-path)))
        (if (equal current-path temp-path)
            (progn
              (setq current-path nil)
              (message (concat project-file-name ".el not found!")))
          (progn
            (setq test-path (concat current-path project-file-name))
            (if (file-exists-p (concat test-path ".el"))
                (progn
                  (makunbound 'proj:project-name)
                  (load test-path)
                  (message (concat "load file: " test-path ".el")
                  (setq current-path nil)))
              (message (concat "try: " test-path ".el")))))
        (setq temp-path current-path)))
      (if (boundp 'proj:project-name)
        (message (concat "Project: [" proj:project-name "] complete!"))))
(add-hook 'emacs-lisp-mode-hook 'conf:project-load)
(add-hook 'c-mode-hook 'conf:project-load)
(add-hook 'c++-mode-hook 'conf:project-load)
  
