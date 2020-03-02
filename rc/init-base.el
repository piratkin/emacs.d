;; (set-face-attribute 'fringe nil :background "red")
;; (add-to-list 'default-frame-alist '(left-fringe . 11))
;; (add-to-list 'default-frame-alist '(right-fringe . 0))
;; (setq-default left-fringe-width 16)
;; (setq-default right-fringe-width 16)
;; (set-face-attribute 'fringe nil :background "#3F3F3F" :foreground "#3F3F3F")
;; (set-face-attribute 'fringe nil :background "#3F3F3F" :foreground "#3F3F3F")
;; (set-face-attribute
;;  'fringe nil
;;  :foreground (face-foreground 'default)
;;  :background (face-background 'default))
;; ;; make both fringes 4 pixels wide
;; (fringe-mode 4)

;; ;; make the left fringe 4 pixels wide and the right disappear
;; (fringe-mode '(4 . 0))

;; ;; restore the default sizes
;; (fringe-mode nil)
;; (fringe-mode 10)

;; (defconst fringe-styles
;;   '(("default" . nil)
;;     ("no-fringes" . 0)
;;     ("right-only" . (0 . nil))
;;     ("left-only" . (nil . 0))
;;     ("half-width" . (4 . 4))
;;     ("minimal" . (1 . 1)))
;;   "Alist mapping fringe mode names to fringe widths.
;; Each list element has the form (NAME . WIDTH), where NAME is a
;; mnemonic fringe mode name and WIDTH is one of the following:
;; - nil, which means the default width (8 pixels).
;; - a cons cell (LEFT . RIGHT), where LEFT and RIGHT are
;;   respectively the left and right fringe widths in pixels, or
;;   nil (meaning the default width).
;; - a single integer, which specifies the pixel widths of both
;; fringes.")

;; (setq indicate-empty-lines nil)


;; (use-package backline
;;   :after outline
;;   :config
;;   (advice-add 'outline-flag-region :after 'backline-update))

;; (use-package smart-mode-line)

;; (use-package windmove
;;   :bind
;;   (("<f2> <right>" . windmove-right)
;;    ("<f2> <left>" . windmove-left)
;;    ("<f2> <up>" . windmove-up)
;;    ("<f2> <down>" . windmove-down)
;;    ))

;; (use-package peep-dired
;;   :bind (:map peep-dired-mode-map
;;          ("SPC" . nil)
;;          ("<backspace>" . nil)))



;; (use-package ace-jump-buffer
;;   :bind
;;   ("C-c b" . ace-jump-buffer))

;; (use-package prescient
;;   :config
;;   (prescient-persist-mode))




;; (global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
;; (global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;(global-set-key "\C-ws" (lambda () (interactive)(evil-window-split) (other-window 1)))
;(global-set-key "\C-wv" (lambda () (interactive)(evil-window-vsplit) (other-window 1)))

;(define-key projectile-command-map (kbd "s p") #'projectile-pt)


;; (defun locate-key-binding (key)
;;   "Determine in which keymap KEY is defined."
;;   (interactive "kPress key: ")
;;   (let ((ret
;;          (list
;;           (key-binding-at-point key)
;;           (minor-mode-key-binding key)
;;           (local-key-binding key)
;;           (global-key-binding key))))
;;     (when (called-interactively-p 'any)
;;       (message "At Point: %s\nMinor-mode: %s\nLocal: %s\nGlobal: %s"
;;                (or (nth 0 ret) "")
;;                (or (mapconcat (lambda (x) (format "%s: %s" (car x) (cdr x)))
;;                               (nth 1 ret) "\n             ")
;;                    "")
;;                (or (nth 2 ret) "")
;;                (or (nth 3 ret) "")))
;;     ret))

;; ;; after splitting a frame automatically, switch to the new window (unless we
;; ;; were in the minibuffer)
;; (setq split-window-preferred-function 'my/split-window-func)
;; (defun my/split-window-func (&optional window)
;;   (let ((new-window (split-window-sensibly window)))
;;     (if (not (active-minibuffer-window))
;;         (select-window new-window))))

;; (defun split-window--select-window (orig-func &rest args)
;;   "Switch to the other window after a `split-window'"
;;   (let ((cur-window (selected-window))
;;         (new-window (apply orig-func args)))
;;     (when (equal (window-buffer cur-window) (window-buffer new-window))
;;       (select-window new-window))
;;     new-window))
;; (advice-add 'split-window :around #'split-window--select-window)

;; move cursor into splited window
;(defadvice split-window (after move-point-to-new-window activate)
;  "Moves the point to the newly created window after splitting."
;  (other-window 1))

;; (defun my-display-buffer (buffer &optional not-this-window frame)
;;   (if (one-window-p)
;;       (let ((window (split-window-horizontally)))
;;         (set-window-buffer window buffer) window)
;;     (let (display-buffer-function)
;;       (display-buffer buffer not-this-window frame))))

;; (setq display-buffer-function 'my-display-buffer)


;; (use-package dired-subtree
;;   :config
;;   (bind-keys :map dired-mode-map
;;              ("i" . dired-subtree-insert)
;;              (";" . dired-subtree-remove)))

;(split-window-horizontally)
;(split-window-right)

;; (use-package fringe
;;   :config (fringe-mode '(20 . 8))
;;   :custom
;;   (fringe-indicator-alist
;;    (delq (assq 'continuation fringe-indicator-alist) fringe-indicator-alist)))

;; (global-adaptive-wrap-prefix-mode t)


;; (use-package adaptive-wrap
;;   :ensure t
;;   :config
;;   ;; (setq-default adaptive-wrap-extra-indent 1)
;;   (add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)
;;   ;; (add-hook 'org-mode-hook 'visual-line-mode)  ;; For org macros
;;   (global-visual-line-mode +1))

;; (use-package col-highlight
;;   :ensure t
;;   :config
;;   (col-highlight-toggle-when-idle)
;;   (col-highlight-set-interval 2))

;; (use-package hl-line+
;;   :load-path "~/.dotmacs.d/usr/hl-line-plus"
;;   :config
;;   (toggle-hl-line-when-idle t))

;; (use-package crosshairs
;;   :ensure t
;;   :config
;;   (crosshairs-mode))

;; (use-package highlight-current-line
  ;; :ensure t
  ;; :config
  ;; If you want to mark only to the end of line:
  ;; (highlight-current-line-whole-line-on nil)
  ;; switch highlighting on
  ;; (highlight-current-line-on t)
  ;; Ignore no buffer
  ;; (setq highlight-current-line-ignore-regexp nil) ; or set to ""
  ;; alternate way to ignore no buffers
  ;; (fmakunbound 'highlight-current-line-ignore-function)
  ;; Ignore more buffers
  ;; (setq highlight-current-line-ignore-regexp
        ;; (concat "Dilberts-Buffer\\|"
  ;; highlight-current-line-ignore-regexp))
  ;; )

;; (use-package highline
;;   :ensure t)

;; ;;; Line wrap fringe bitmaps
;; (define-fringe-bitmap 'right-curly-arrow
;;   [#b00000000
;;    #b00000000
;;    #b00000000
;;    #b00000000
;;    #b01110000
;;    #b00010000
;;    #b00010000
;;    #b00000000])
;; (define-fringe-bitmap 'left-curly-arrow
;;   [#b00000000
;;    #b00001000
;;    #b00001000
;;    #b00001110
;;    #b00000000
;;    #b00000000
;;    #b00000000
;;    #b00000000])


;; (define-fringe-bitmap 'right-arrow
;;   [#b00000000
;;    #b00000000
;;    #b00000000
;;    #b00000000
;;    #b01110000
;;    #b00010000
;;    #b00010000
;;    #b00000000])
;; (define-fringe-bitmap 'left-arrow
;;   [#b00000000
;;    #b00001000
;;    #b00001000
;;    #b00001110
;;    #b00000000
;;    #b00000000
;;    #b00000000
;;    #b00000000])

;; (defun bmacs*blink-cursor-maybe (orig-fn &rest args)
;;   "Blink current line if the window has moved."
;;   (let ((point (save-excursion (goto-char (window-start))
;;                                (point-marker))))
;;     (apply orig-fn args)
;;     (unless (or (derived-mode-p 'term-mode)
;;                 (equal point
;;                        (save-excursion (goto-char (window-start))
;;                                        (point-marker))))
;;       (bmacs/blink-cursor))))

;; (defun bmacs/blink-cursor (&rest _)
;;   "Blink current line using `nav-flash'."
;;   (interactive)
;;   (unless (minibufferp)
;;     (nav-flash-show)
;;     ;; only show in the current window
;;     (overlay-put compilation-highlight-overlay 'window (selected-window))))

;; (use-package nav-flash
;;   :after evil
;;   :commands nav-flash-show
;;   :init
;;   (advice-add #'windmove-do-window-select :around #'bmacs*blink-cursor-maybe)
;;   (advice-add #'recenter :around #'bmacs*blink-cursor-maybe)

;;     (advice-add #'evil--jumps-jump   :after #'bmacs/blink-cursor)
;;     (advice-add #'evil-window-top    :after #'bmacs/blink-cursor)
;;     (advice-add #'evil-window-middle :after #'bmacs/blink-cursor)
;;     (advice-add #'evil-window-bottom :after #'bmacs/blink-cursor))



;; (use-package hl-line ; built-in
;;   :demand t
;;   :init
;;   :hook (prog-mode hl-line-mode)
;;   :config
;;   ;; I don't need hl-line showing in other windows. This also offers a small
;;   ;; speed boost when buffer is displayed in multiple windows.
;;   (setq hl-line-sticky-flag nil
;;         global-hl-line-sticky-flag nil)

;;   ;; On Emacs 26+, when point is on the last line, hl-line highlights bleed into
;;   ;; the rest of the window after eob. This is the fix.
;;   (when (boundp 'display-line-numbers)
;;     (defun bmacs--line-range ()
;;       (cons (line-beginning-position)
;;             (cond ((save-excursion
;;                      (goto-char (line-end-position))
;;                      (and (eobp) (not (bolp))))
;;                    (1- (line-end-position)))
;;                   ((or (eobp) (save-excursion (forward-line) (eobp)))
;;                    (line-end-position))
;;                   (t
;;                    (line-beginning-position 2)))))
;;     (setq hl-line-range-function #'bmacs--line-range))

;;   ;; Disable `hl-line' in evil-visual mode (temporarily). `hl-line' can make
;;   ;; the selection region harder to see while in evil visual mode.
;;   (defun bmacs|disable-hl-line () (hl-line-mode -1))

;;   (add-hook 'evil-visual-state-entry-hook #'bmacs|disable-hl-line)
;;   (add-hook 'evil-visual-state-exit-hook #'hl-line-mode))


;; (use-package    feebleline
;;   :ensure       t
;;   :config       (setq feebleline-msg-functions
;;                       '((feebleline-line-number         :post "" :fmt "%5s")
;;                         (feebleline-column-number       :pre ":" :fmt "%-2s")
;;                         (feebleline-file-directory      :face feebleline-dir-face :post "")
;;                         (feebleline-file-or-buffer-name :face font-lock-keyword-face :post "")
;;                         (feebleline-file-modified-star  :face font-lock-warning-face :post "")
;;                         (feebleline-git-branch          :face feebleline-git-face :pre " : ")
;;                         (feebleline-project-name        :align right)))
;;                 (feebleline-mode 1))

;; ;;; Code:
;; (setq indicate-buffer-boundaries 'right
;;       visual-line-fringe-indicators '(left-curly-arrow nil)
;;       left-fringe-width 8)

;; ;; Left and right arrows for truncated lines
;; (define-fringe-bitmap 'right-arrow (vector 0 16 4 1 4 16 0 0) 8 8 'center)
;; (define-fringe-bitmap 'left-arrow (vector 0 8 32 128 32 8 0 0) 8 8 'center)

;; (define-fringe-bitmap 'right-arrow
;;           (vector #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00011100
;;                   #b00111110
;;                   #b00111110
;;                   #b00111110
;;                   #b00011100
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000
;;                   #b00000000))



(use-package bash-completion
  :init
  (bash-completion-setup))

;; (use-package editorconfig
;;   ;; :diminish editorconfig-mode
;;   :config
;;   (editorconfig-mode 1))


;; (use-package shackle
;;   :config
;;   (shackle-mode 1)
;;  (setq shackle-rules
;;        '(("*Apropos*" :align below :size 16 :select t)
;;          ("*Help*" :align below :size 16 :select t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CONFIGURE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Utf-8
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
;; (prefer-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
;; (set-language-environment 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq locale-coding-system 'utf-8
      default-process-coding-system '(utf-8 . utf-8)
      default-file-name-coding-system 'utf-8)

;; (setq iso-transl-char-map nil)          ; http://emacs.stackexchange.com/a/17524/2138

;; About Me
(setq user-full-name "Sergey Piratkin"
      user-mail-address "piratkin@tut.by")

;; Warn when opening files bigger than 10MB
(setq large-file-warning-threshold 10000000)


;; DOS carriage returns appear at the end of each line as ^M. (An alternative
;; would be to use cat -t on the file in a terminal to also show the carriage
;; return characters.). The DOS carriage returns are easily removed by
;; using M-x set-buffer-file-coding-system and then entering
;; unix and saving the file.
(setq inhibit-eol-conversion nil)

;; Save whatever’s in the current (system) clipboard before
;; replacing it with the Emacs’ text.
;; https://github.com/dakrone/eos/blob/master/eos.org
(setq save-interprogram-paste-before-kill t)

;; Normal mouse wheele
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

;; Indent settings
(setq c-default-style "stroustrup") ;;indent style in c/c++ code
(setq-default indent-tabs-mode nil) ;;disable the ability to indent TAB
(setq-default tab-width 4) ;;tab width - 4 whitespace
(setq-default c-basic-offset 4)
(setq-default standart-indent 4) ;;standard width of indent - 4 whitespace

; A bit more spacing between lines
;; (setq-default line-spacing 0.1)

(setq-default fill-column 80)
(auto-fill-mode t)

;; Kill current buffet with out prompt messate
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Highlight search resaults
(setq search-highlight t)
(setq query-replace-highlight t)

;; Restore last session on startup
;; (desktop-load-default)
;; (desktop-read)
;; or use
;; (desktop-save-mode t)

;; Delete selection
(delete-selection-mode t)

;; Better buffer rendering
(setq redisplay-dont-pause t)

;; Use system clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-selection-value)
;; text selected with the mouse is automatically copied to the system clipboard
(setq mouse-drag-copy-region t)

;; Set short confirm command
(fset 'yes-or-no-p 'y-or-n-p)

;; ;; Always use ibuffer
;; (defalias 'list-buffers 'ibuffer)

;; Unbind C-z
(when window-system
  (global-unset-key [(control z)]))

;;
(setq doc-view-continuous t)

;; Set build command
(setq compile-command "cd ../build && cmake -G \"Unix Makefiles\" -DCMAKE_EXPORT_COMPILE_COMMANDS=YES .. && cmake --build .")

;; Move the cursor to a new window after C-x,2
(setq split-window-keep-point t)

;;
;; (setq apropos-do-all t)

;; Automaticaly scroll *compilation* bufferl
(setq compilation-scroll-output t)

;; Show size in modeline bar
(size-indication-mode t)

;; Do not remember the password in the cache for gpg files
(setq epa-file-cache-passphrase-for-symmetric-encryption nil)

;; Truncate-lines
(defun rc:init-base-conf ()
  (interactive)
  (setq-default truncate-lines 1))
;; Set hooks
(add-hook 'prog-mode-hook 'rc:init-base-conf)

;; Delete excess backup versions silently
(setq delete-old-versions -1)
(setq version-control t)
;; Make backups file even when in version controlled dir
(setq vc-make-backup-files t)
;; Don't ask for confirmation when opening symlinked file
(setq vc-follow-symlinks t )
;; Which directory to put backups fil
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
;; Transform backups file name
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))


;; (use-package ipretty
;;   :config (ipretty-mode t))

;; ;;;; shell-switcher
;; (use-package shell-switcher
;;   :demand
;;   :config (shell-switcher-mode 1))

;; ;;;; shr
;; (use-package shr
;;   :custom
;;   ;; increase contrast between similar colors
;;   (shr-color-visible-luminance-min 60))

(use-package systemd)

;; View Large Files
(use-package vlf
  :init
  (setq vlf-application 'dont-ask)   ;just do it
  (setq vlf-batch-size 8192))        ;a bit more text per batch please

;; Case-insensitive search
(setq case-fold-search t)

(use-package git-timemachine
  :bind
  (("C-c g t" . git-timemachine)
   ("H-t" . git-timemachine)))

(use-package shackle
  :config
  (shackle-mode 1)
  (setq shackle-rules
        '(("*Apropos*" :align below :size 16 :select t)
          ("*Help*" :align below :size 16 :select t))))

(use-package editorconfig
  ;; :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))


(provide 'init-base)
