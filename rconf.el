;;;
(push "~/.emacs.d/rc" load-path)

;; Enable Evil
(require 'evil)
(evil-mode t)

(require 'doom-modeline)
(doom-modeline-mode t)

(global-vi-tilde-fringe-mode t)

(setq dired-auto-revert-buffer t  ; don't prompt to revert; just do it
      dired-dwim-target t  ; suggest a target for moving/copying intelligently
      dired-hide-details-hide-symlink-targets nil
      ;; Always copy/delete recursively
      dired-recursive-copies  'always
      dired-recursive-deletes 'top)

;;; Set encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;; set theme
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)
;; Enable flashing mode-line on errors
;(doom-themes-visual-bell-config)
;; Enable custom neotree theme (all-the-icons must be installed!)
;(doom-themes-neotree-config)
;; or for treemacs users
;(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;(doom-themes-treemacs-config)
;; Corrects (and improves) org-mode's native fontification.
;(doom-themes-org-config)

;(require 'remap)

;;highlight line color
(global-hl-line-mode t)
;; set highlight background color
;set-face-background 'hl-line "#3e4446")
;;keep syntax highlighting in the current line
;(set-face-foreground 'highlight nil)

;;custom name
(setq frame-title-format "GNU Emacs: %b")

;; Display file size/time in mode-line
;;(setq display-time-24hr-format t) ;; 24-hour time format in mode-line
;;(display-time-mode t) ;; show hours in mode-line
(size-indication-mode t) ;; file size in percentages
;; cursor shape (hbar vbar)
;(set-default 'cursor-type '(vbar . 3))
;; set cursor color
(set-cursor-color "#ffff00")
;; hide cursor if window not have focus
(setq-default cursor-in-non-selected-windows nil)
;;hidi scrolbar
(menu-bar-mode -1)
;; scroll one line
(setq scroll-margin 1)
;; normal scroll
(setq scroll-conservatively 10000)
;; timeout lock font
(setq jit-lock-defer-time 0.01)
;;normal mouse wheele
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
;;hide toolbar
(tool-bar-mode -1)
;;hide scrollbar
(scroll-bar-mode -1)
;;sound bell off
(setq visible-bell 1)
;; Indent settings
(setq c-default-style "stroustrup") ;;indent style in c/c++ code
(setq-default indent-tabs-mode nil) ;;disable the ability to indent TAB
(setq-default tab-width 4) ;;tab width - 4 whitespace
(setq-default c-basic-offset 4)
(setq-default standart-indent 4) ;;standard width of indent - 4 whitespace
;; highlight search resaults
(setq search-highlight t)
(setq query-replace-highlight t)
;;hide welcome screen
(setq inhibit-startup-screen t)
;;highlight the same words on the screen
;(add-hook 'prog-mode-hook #'semantic-idle-local-symbol-highlight-mode)
;;highlight-numbers
;(add-hook 'prog-mode-hook #'highlight-numbers-mode)







;;restore last session on startup
;;(desktop-save-mode 1)
;;delete selection
(delete-selection-mode t)
;;better buffer rendering
(setq redisplay-dont-pause t)
;;use system clipboard
(setq x-select-enable-clipboard t)
;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq interprogram-paste-function 'x-selection-value)
;;set short confirm command
(fset 'yes-or-no-p 'y-or-n-p)
;;
;;(setq ac-disable-faces nil)
;;set build command
(setq compile-command "cd ../build && cmake -G \"Unix Makefiles\" -DCMAKE_EXPORT_COMPILE_COMMANDS=YES .. && cmake --build .")
;;auto complete quots ({},[],())
(electric-pair-mode 1)
;;move the cursor to a new window
(setq split-window-keep-point t)
;;automatically delete extra spaces and tabs at the end of lines
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;do not remember the password in the cache for gpg files
(setq epa-file-cache-passphrase-for-symmetric-encryption nil)



;;
;;truncate-lines
;;
(defun conf:truncate-lines ()
  (interactive)
  ;; turn off line wrapping
  (setq-default truncate-lines 1))
;;set hooks
(add-hook 'emacs-lisp-mode-hook 'conf:truncate-lines)
(add-hook 'c-mode-hook 'conf:truncate-lines)
(add-hook 'c++-mode-hook 'conf:truncate-lines)








;;
;;hide unused define
;;
(defun conf:hide-defines ()
  (interactive)
  (hide-ifdef-mode t)
  (setq hide-ifdef-shadow t)
  (hide-ifdefs))
;;set hooks
(add-hook 'emacs-lisp-mode-hook 'conf:hide-defines)
(add-hook 'c-mode-hook 'conf:hide-defines)
(add-hook 'c++-mode-hook 'conf:hide-defines)







;;
;;font-lock
;;
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)













(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)














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








(provide 'rconf)
