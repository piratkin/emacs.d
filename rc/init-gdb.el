(use-package gdb-mi
  :ensure t
  ;; :bind
  ;; (("C-c g a" . gdb-display-disassembly-buffer)
  ;;  ("C-c g m" . gdb-display-memory-buffer)
  ;;  ("C-c g r" . gdb-restore-windows))
  :config
  (progn
    ;; (defun gdb-frame ()
    ;;   (interactive)
    ;;   (select-frame (make-frame '((name . "GDB"))))
    ;;   (toggle-frame-maximized)
    ;;   (call-interactively 'gdb))
    (setq gdb-many-windows t)               ; Multiple window layout
    (setq gdb-show-main t)                ; Display both gud and the main source (if no many-windows)
    (setq gdb-thread-buffer-verbose-names t); Show long thread names like ‘Thread 0x4e2ab70 (LWP 1983)’
    (setq gdb-thread-buffer-arguments t)    ; Show function arguments in threads buffer
    (setq gdb-thread-buffer-locations t)    ; Show file information or library names in threads buffer
    (setq gdb-thread-buffer-addresses t)    ; Show addresses for thread frames in threads buffer
    (setq gdb-non-stop-setting t)           ; Try to use non-stop mode
    (setq gdb-switch-when-another-stopped t); Switch to a thread that stopped even if we're already stopped in a thread
    (setq gdb-show-changed-values t)        ; Highlight changed/out of scope variables
    (setq gdb-delete-out-of-scope nil)      ; Keep out of scope variables
    (setq gdb-use-colon-colon-notation t)   ; Use function::variable format
    (setq gdb-stack-buffer-locations t)     ; Show file information or library names in stack buffers
    (setq gdb-stack-buffer-addresses t)))   ; Show frame addresses in stack buffers

;; (use-package gdb-mi
;;   :quelpa
;;   (gdb-mi
;;    :fetcher git
;;    :url "https://github.com/weirdNox/emacs-gdb.git"
;;    :files ("*.el" "*.c" "*.h" "Makefile"))
;;   :init
;;   (progn
;;     (setq gdb-window-setup-function #'rc:gdb-setup-windows-minimal)
;;     (setq gdb-ignore-gdbinit nil)
;;     (setq gdb-executable-name "gdb")
;;     (fmakunbound 'gdb)
;;     (fmakunbound 'gdb-enable-debug)))

;; +---------------+--------------------+
;; |               | variables-buffer   |
;; |               +--------------------+
;; |               | watchers-buffer    |
;; | source-buffer +--------------------+
;; |               | breakpoints-buffer |
;; |               +--------------------+
;; |               | frames-buffer      |
;; +---------------+--------------------+
;; | comint-buffer | threads-buffer     |
;; +---------------+--------------------+

;; (defun rc:gdb-setup-windows-full (session)
;;   (with-selected-frame (gdb--session-frame session)
;;     (delete-other-windows)
;;     (let* ((source-buffer (selected-window))
;;            (comint-buffer (split-window source-buffer))
;;            (threads-buffer (split-window comint-buffer nil t))
;;            (variables-buffer (split-window source-buffer nil t))
;;            (watchers-buffer (split-window variables-buffer))
;;            (breakpoints-buffer (split-window variables-buffer))
;;            (frames-buffer (split-window variables-buffer)))
;;       (balance-windows)
;;       (gdb--set-window-buffer threads-buffer (gdb--threads-get-buffer session))
;;       (gdb--set-window-buffer frames-buffer (gdb--frames-get-buffer session))
;;       (gdb--set-window-buffer breakpoints-buffer (gdb--breakpoints-get-buffer session))
;;       (gdb--set-window-buffer variables-buffer (gdb--variables-get-buffer session))
;;       (gdb--set-window-buffer comint-buffer (gdb--comint-get-buffer session))
;;       (gdb--set-window-buffer watchers-buffer (gdb--watchers-get-buffer session))
;;       (gdb--display-source-buffer source-buffer))))

;; (defun rc:gdb-setup-windows-minimal (session)
;;   (with-selected-frame (gdb--session-frame session)
;;     (delete-other-windows)
;;     (let* ((source-buffer (selected-window))
;;            (variables-buffer (split-window source-buffer nil t))
;;            (watchers-buffer (split-window variables-buffer))
;;            (breakpoints-buffer (split-window variables-buffer))
;;            (frames-buffer (split-window variables-buffer)))
;;       (balance-windows)
;;       (gdb--set-window-buffer frames-buffer (gdb--frames-get-buffer session))
;;       (gdb--set-window-buffer breakpoints-buffer (gdb--breakpoints-get-buffer session))
;;       (gdb--set-window-buffer variables-buffer (gdb--variables-get-buffer session))
;;       (gdb--set-window-buffer watchers-buffer (gdb--watchers-get-buffer session))
;;       (gdb--display-source-buffer source-buffer))))

(provide 'init-gdb)
