;; (message "script: %s" "init-base.el")

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
  :ensure t
  :config
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

;; ;; (setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
;; ;; (setq mouse-wheel-scroll-amount '(5 ((shift) . 1) ((control) . nil)))
;; ;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control))))
;; (setq mouse-wheel-progressive-speed nil)
;; (setq mouse-wheel-progressive-speed t)
;; (setq mouse-wheel-follow-mouse t)
;; (setq auto-window-vscroll nil)
;; ;; Mouse wheel scroll support
;; ;; (mouse-wheel-mode t)
;; ;; При прокрутке применять font-lock не сразу, а после небольшой задежки.
;; ;; (setq jit-lock-defer-time .01)
;; ;; Опционально: никогда не прокручивать более, чем на 1 строку при перемещении курсора за
;; ;; нижнюю или верхнюю границу экрана.
;; ;; (setq scroll-conservatively 10000)
;; ;; (setq mouse-wheel-scroll-amount '(1))
;; ;; (setq mouse-wheel-progressive-speed nil)
;; ;; (setq scroll-margin 1
;; ;;       scroll-conservatively 0
;; ;;       scroll-up-aggressively 0.01
;; ;;       scroll-down-aggressively 0.01)
;; (setq-default scroll-up-aggressively 0.01
;;       scroll-down-aggressively 0.01)
;; ;; (setq scroll-conservatively 10000)
;; (use-package pixel-scroll
;;   :ensure nil
;;   :config
;;   ;; (setq pixel-dead-time 0
;;   ;;       pixel-resolution-fine-flag nil)
;;   (pixel-scroll-mode))

;; ;; Normal mouse wheele
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; ;; Automatically scroll *compilation* buffer
(setq compilation-scroll-output t)
(setq scroll-step 1)

(setq-default fill-column 80)
(auto-fill-mode t)

;; ;; Kill current buffet with out prompt messate
;; (global-set-key (kbd "C-x k") 'kill-this-buffer)

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
(custom-set-variables
 '(interprogram-paste-function (quote x-cut-buffer-or-selection-value) t)
 '(x-select-enable-clipboard t))
;; (setq interprogram-paste-function 'x-selection-value)
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

;; (defun ar/compile-autoclose (buffer string)
;;   "Hide successful builds window with BUFFER and STRING."
;;   (cond ((string-match "finished" string)
;;          (message "Build finished")
;;          (run-with-timer 2 nil
;;                          #'delete-window
;;                          (get-buffer-window buffer t)))
;;         (t
;;          (next-error)
;;          (when (equal major-mode 'objc-mode)
;;            (next-error))
;;          (message "Compilation exited abnormally: %s" string))))
;; (use-package compile
;;   :config
;;   ;; TODO: Shouldn't this
;;   ;; Automatically hide successful builds window.
;;   (setq compilation-finish-functions #'ar/compile-autoclose))

;; Move the cursor to a new window after C-x,2
(setq split-window-keep-point t)

;;
;; (setq apropos-do-all t)


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
(add-hook 'term-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

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

;; (setq default-input-method "russian-computer")

(use-package systemd
  :ensure t)

;; View Large Files
(use-package vlf
  :ensure t
  :init
  (setq vlf-application 'dont-ask)   ;just do it
  (setq vlf-batch-size 8192))        ;a bit more text per batch please

;; Case-insensitive search
(setq case-fold-search t)



(use-package shackle
  :ensure t
  :config
  (shackle-mode 1)
  (setq shackle-rules
        '(("*Apropos*" :align below :size 16 :select t)
          ("*Help*" :align below :size 16 :select t))))

;; Weather forecast (no login/account needed).
(use-package wttrin
  :ensure t
  :commands wttrin
  :config
  (setq wttrin-default-accept-language '("Accept-Language" . "ru-RU")
        wttrin-default-cities (list "Grodno" "Minsk")))

;; (use-package deft
;;   :after org
;;   ;; :bind
;;   ;; ("C-c n d" . deft)
;;   :custom
;;   (deft-recursive t)
;;   (deft-use-filter-string-for-filename t)
;;   (deft-default-extension "org")
;;   (deft-directory "~/Documents/Roam"))

(use-package xterm-color
  :ensure t)

;; (use-package ansi-color
;;   :config
;;   (progn
;;     (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;     (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)))

;; (use-package buffer-move
;;   :ensure t
;;   :bind
;;   ("C-s-<up>" . buf-move-up)
;;   ("C-s-<down>" . buf-move-down)
;;   ("C-s-<left>" . buf-move-left)
;;   ("C-s-<right>" . buf-move-right))
;; (use-package windmove
;;   :ensure t
;;   :init (windmove-default-keybindings)
;;   :config
;;   :bind (:map leader-key
;;               ("w f" . #'windmove-right)
;;               ("w b" . #'windmove-left)
;;               ("w p" . #'windmove-up)
;;               ("w n" . #'windmove-down)))

;; (use-package perspeen
;;   :ensure t
;;   :init
;;   (setq perspeen-use-tab t)
;;   :config
;;   (perspeen-mode))

;; (use-package benchmark-init
;;   :ensure t
;;   :defer 5
;;   :config
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; (use-package esup
;;   :ensure nil
;;   ;; To use MELPA Stable use ":pin mepla-stable",
;;   ;; :pin melpa
;;   :load-path  "~/.dotmacs.d/usr/esup"
;;   :commands (esup))

;; Format table M-x pakege-list-packages
(add-hook 'package-menu-mode-hook
          (lambda()
            (setq tabulated-list-format
                  [("Package"     40 package-menu--name-predicate)
                   ("Version"     13 package-menu--version-predicate)
                   ("Status"       9 package-menu--status-predicate)
                   ("Archive"     12 package-menu--archive-predicate)
                   ("Description" 64 package-menu--description-predicate)])
            (tabulated-list-init-header)))

;; Returns the root directory .dir_locals.el
(defun rc:dir-locals-dir ()
  "Return the directory local variables directory.
Code taken from `hack-dir-local-variables'."
  (let ((variables-file (dir-locals-find-file (or (buffer-file-name) default-directory)))
        (dir-name nil))
    (cond
     ((stringp variables-file)
      (setq dir-name (file-name-directory variables-file)))
     ((consp variables-file)
      (setq dir-name (nth 0 variables-file))))
    dir-name))

;; (use-package insert-translated-name
;;   :ensure nil
;;   ;; :init
;;   ;; (evil-leader/set-key
;;   ;;   "tr" 'insert-translated-name-replace
;;   ;;   "ti" 'insert-translated-name-insert)
;;   ;; :commands (insert-translated-name-insert
;;   ;;            insert-translated-name-replace)
;;   :config
;;   (setq insert-translated-name-default-style "origin")
;;   (setq insert-translated-name-line-style-mode-list '())
;;   (setq insert-translated-name-camel-style-mode-list '())
;;   (setq insert-translated-name-underline-style-mode-list '()))


;; (use-package so-long
;;   :quelpa (so-long :url "https://raw.githubusercontent.com/emacs-mirror/emacs/master/lisp/so-long.el" :fetcher url)
;;   :config (global-so-long-mode))

;; (use-package rotate
;;   :ensure t
;;   :bind
;;   ;; ("C-c C-r w" . rotate-window)
;;   ;; ("C-c C-r l" . rotate-layout)
;;   )

;; Rename current buffer and file
(defun rc:rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

;; (defun toggle-fold ()
;;   "Toggle fold all lines larger than indentation on current line"
;;   (interactive)
;;   (let ((col 1))
;;     (save-excursion
;;       (back-to-indentation)
;;       (setq col (+ 1 (current-column)))
;;       (set-selective-display
;;        (if selective-display nil (or col 1))))))


;; (use-package shackle
;;   :ensure t
;;   :hook (emacs-startup . shackle-mode)
;;   :config
;;   (setq shackle-default-alignment 'below
;;         shackle-default-size 8
;;         helm-display-function 'pop-to-buffer
;;         shackle-rules
;;         '(("^\\*eww" :regexp t :size 0.5 :select t :autokill t :noesc t)
;;         ;; ("^\\*ftp " :noselect t :autokill t :noesc t)
;;         ;; ("^\\*pdf" :noselect t :align right)
;;         ;;(pdf-view-mode :noselect t :align right)
;;         ;; ("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.3)
;;         ;; built-in (emacs)
;;         ("*compilation*" :size 0.25 :noselect t :autokill t :autoclose t)
;;         ("*ert*" :same t :modeline t)
;;         ("*info*" :size 0.5 :select t :autokill t)
;;         ("*undo-tree*" :size 0.25 :align right)
;;         ("*Backtrace*" :size 20 :noselect t)
;;         ("*Warnings*"  :size 12 :noselect t :autofit t)
;;         ("*Messages*"  :size 12 :noselect t)
;;         ("*Help*" :size 0.3 :autokill t)
;;         ("^\\*.*Shell Command.*\\*$" :regexp t :size 20 :noselect t :autokill t)
;;         ;; (apropos-mode :size 0.3 :autokill t :autoclose t)
;;         ;; (Buffer-menu-mode :size 20 :autokill t)
;;         ;; (comint-mode :noesc t)
;;         ;; (grep-mode :size 25 :noselect t :autokill t)
;;         ;; (profiler-report-mode :size 0.3 :regexp t :autokill t :modeline minimal)
;;         ;; (tabulated-list-mode :noesc t)
;;         ("^ ?\\*" :regexp t :size 15 :noselect t :autokill t :autoclose t))))

;; (use-package hideshowvis
;;   :ensure t
;;   :config
;;   (progn
;;     (hideshowvis-enable)
;;     (hideshowvis-symbols)))



(message "Init Base script done!")
(provide 'init-base)
