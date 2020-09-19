;; (use-package golden-ratio
;;   :ensure t
;;   ;; :diminish golden-ratio-mode
;;   :init
;;   (setq golden-ratio-extra-commands
;;         '(ace-jump-move
;;           ace-window
;;           ace-swap-window
;;           ace-delete-window
;;           ace-select-window
;;           ace-maximize-window
;;           windmove-left
;;           windmove-right
;;           windmove-down
;;           windmove-up
;;           select-window
;;           ;; display-buffer-pop-up-window ;;
;;           ;; display-buffer--maybe-pop-up-frame-or-window;;
;;           ;; eval-buffer ;;
;;           ;; generate-new-buffer ;;
;;           ;; kill-buffer ;;
;;           ;; display-buffer ;;
;;           ;; window-resize ;;
;;           ;; redisplay ;;
;;           ;; split-window ;;
;;           ;; walk-windows ;;
;;           ;; balance-windows ;;
;;           ;; window-size ;;
;;           ;; evil-set-cursor ;;
;;           ;; evil--jump-hook ;;
;;           ;; command-execute ;;
;;           ;; google-translate-translate ;;
;;           quit-window
;;           google-translate-buffer
;;           google-translate-at-point
;;           google-translate-query-translate
;;           google-translate-smooth-translate
;;           google-translate-at-point-reverse
;;           google-translate-query-translate-reverse
;;           selected-window
;;           ivy-switch-buffer
;;           select-window-0
;;           select-window-1
;;           select-window-2
;;           select-window-3
;;           select-window-4
;;           select-window-5
;;           select-window-6
;;           select-window-7
;;           select-window-8
;;           select-window-9
;;           buf-move-down
;;           buf-move-up
;;           buf-move-right
;;           buf-move-left
;;           evil-window-1
;;           evil-window-2
;;           evil-window-3
;;           evil-window-4
;;           evil-window-5
;;           evil-window-move-very-bottom
;;           evil-window-move-far-right
;;           evil-window-move-far-left
;;           evil-window-move-very-top
;;           evil-window-rotate-downwards
;;           evil-window-rotate-upwards
;;           evil-window-vnew
;;           evil-window-new
;;           evil-window-prev
;;           evil-window-next
;;           evil-window-mru
;;           evil-window-top-left
;;           evil-window-bottom-right
;;           evil-window-down
;;           evil-window-up
;;           evil-window-right
;;           evil-window-left
;;           evil-window-vsplit
;;           evil-window-split
;;           evil-window-delete
;;           evil-avy-goto-line
;;           evil-avy-goto-word-or-subword-1)
;;         ;; golden-ratio-exclude-buffer-names
;;         ;; '(" *undo-tree*"
;;         ;;   " *undo-tree Diff*"
;;         ;;   " *Compile-Log*"
;;         ;;   " *Messages*"
;;         ;;   " *WoMan-Log*"
;;         ;;   " *Completions*"
;;         ;;   " *Warnings*"
;;         ;;   " *Deletions*")
;;         golden-ratio-exclude-modes
;;         '("undo-tree-mode"))
;;   :config
;;   (setq golden-ratio-recenter t
;;         golden-ratio-auto-scale nil)
;;   (golden-ratio-mode t))

;; ;; (use-package golden-ratio-scroll-screen
;; ;;   :ensure t
;; ;;   :config
;; ;;   ;; (global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
;; ;;   ;; (global-set-key [remap scroll-up-command] 'golden-ratio-scroll-screen-up))
;; ;;   (global-set-key [remap evil-scroll-down] 'golden-ratio-scroll-screen-down)
;; ;;   (global-set-key [remap evil-scroll-up] 'golden-ratio-scroll-screen-up))


(use-package zoom
  :ensure t
  :config
  ;; Resize the selected window according to the frame width, for example:
  ;; 90 columns and 75% of the frame height if the frame width is larger than 1024 pixels;
  ;; half the frame size otherwise.
  ;; (defun size-callback ()
  ;;   (cond ((> (frame-pixel-width) 1280) '(90 . 0.75))
  ;;         (t                            '(0.5 . 0.5))))
  ;; (setq zoom-size 'size-callback)
  (setq zoom-size '(0.618 . 0.618)
        zoom-minibuffer-preserve-layout nil
        temp-buffer-resize-mode nil
        zoom-ignored-major-modes
        '(which-key-mode
          ediff-mode
          undo-tree-mode-major-mode
          calc-mode
          speedbar-mode
          ediff-mode)
        zoom-ignored-buffer-names
        '("*which-key*"
          "*Messages*"
          "*Diff*")
        zoom-ignored-buffer-name-regexps
        '("^*which-key"
          "^*Messages"
          "^*magit"
          "^*magit-diff"
          "^*Ediff"
          "^*COMMIT_EDITMSG"))
  (zoom-mode +1))



(provide 'init-zoom)
