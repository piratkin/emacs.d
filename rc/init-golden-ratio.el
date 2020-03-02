(use-package golden-ratio
  :ensure t
  ;; :diminish golden-ratio-mode
  :init
  (setq golden-ratio-auto-scale t
        golden-ratio-extra-commands
        '(ace-jump-move
          ace-window
          evil-window-next
          evil-window-prev
          evil-window-left
          evil-window-right
          evil-window-up
          evil-window-down
          evil-window-1
          evil-window-2
          evil-window-3
          evil-window-4
          evil-window-5
          evil-window-new)
        golden-ratio-exclude-buffer-names
        '(" *undo-tree*"
          " *undo-tree Diff*"
          " *Compile-Log*"
          " *Messages*"
          " *WoMan-Log*"
          " *Completions*"
          " *Warnings*"
          " *Deletions*")
        golden-ratio-exclude-modes
        '("undo-tree-mode"))
  (golden-ratio-mode t))

;; (use-package golden-ratio-scroll-screen
;;   :ensure t
;;   :config
;;   ;; (global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
;;   ;; (global-set-key [remap scroll-up-command] 'golden-ratio-scroll-screen-up))
;;   (global-set-key [remap evil-scroll-down] 'golden-ratio-scroll-screen-down)
;;   (global-set-key [remap evil-scroll-up] 'golden-ratio-scroll-screen-up))



(provide 'init-golden-ratio)
