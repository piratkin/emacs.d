;; (use-package fill-column-indicator
;;   :ensure t
;;   :hook
;;   (prog-mode . fci-mode)
;;   ;; (fci-mode . (lambda ()
;;   ;;               (set-fringe-mode '(1 . 0))
;;   ;;               (fringe-mode nil)))
;;   :config
;;   (when (not window-system)
;;     (setq-default fci-always-use-textual-rule t))
;;   (setq-default
;;    fill-column 80
;;    fci-rule-use-dashes t
;;    fci-dash-pattern .3))

;; (setq truncate-lines t)
;; (setq truncate-partial-width-windows nil)
;; (setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))

;; ;; Maintain at least 80 columns, even when the window is resized

;; (setq maximum-font-height 180)
;; (setq minimum-font-height 60)
;; (setq previous-frame-width 0)

;; (setq window-size-change-functions
;;       '((lambda (frame)
;;           (if (/= previous-frame-width (frame-width frame))
;;               (let ((trial-size maximum-font-height))
;;                 (set-face-attribute 'default frame :height trial-size)
;;                 (while (and (> trial-size minimum-font-height)
;;                             (< (frame-width frame) 80))
;;                   (setq trial-size (- trial-size 10))
;;                   (set-face-attribute 'default frame :height trial-size))
;;                 (setq previous-frame-width (frame-width frame))
;;                 )))))


;; (defvar i42/fci-mode-suppressed nil)
;; (make-variable-buffer-local 'i42/fci-mode-suppressed)

;; (defun fci-width-workaround (frame)
;;   (let ((fci-enabled (symbol-value 'fci-mode))
;;         (fci-column (if fci-rule-column fci-rule-column fill-column))
;;         (current-window-list (window-list frame 'no-minibuf)))
;;     (dolist (window current-window-list)
;;       (with-selected-window window
;;         (if i42/fci-mode-suppressed
;;             (when (and (eq fci-enabled nil)
;;                        (< fci-column
;;                           (+ (window-width) (window-hscroll))))
;;               (setq i42/fci-mode-suppressed nil)
;;               (turn-on-fci-mode))
;;           ;; i42/fci-mode-suppressed == nil
;;           (when (and fci-enabled fci-column
;;                      (>= fci-column
;;                          (+ (window-width) (window-hscroll))))
;;             (setq i42/fci-mode-suppressed t)
;;             (turn-off-fci-mode)))))))
;; (add-hook 'window-size-change-functions 'fci-width-workaround)

(use-package fill-column-indicator
  :ensure t
  :hook
  (prog-mode . fci-mode)
  ;; :commands (fci-mode)
  :init
  (setq fci-rule-width 1
        fci-rule-column 80))



(provide 'init-fill-column-indicator)
