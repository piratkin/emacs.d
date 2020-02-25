(use-package undo-tree
  ;; :diminish undo-tree-mode
  :config
    (setq undo-tree-visualizer-relative-timestamps t
          undo-tree-visualizer-timestamps t
          undo-tree-visualizer-diff t
          undo-tree-auto-save-history t
          undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))
          undo-tree-enable-undo-in-region nil)

    ;; (add-to-list
    ;;  'display-buffer-alist
    ;;  '(,(rx bos " *undo-tree*" eos)
    ;;    (display-buffer-in-side-window)
    ;;    (side . bottom)
    ;;    (window-height . 0.4)))
    (global-undo-tree-mode))



(provide 'init-undo-tree)
