(use-package ibuffer
  :bind
  ([remap list-buffers] . ibuffer)
  :config
  (setq ibuffer-expert t
        ;; ibuffer-default-shrink-to-minimum-size nil
        ibuffer-display-summary nil
        ;; ibuffer-use-other-winsow nil
        ;; ibuffer-show-empty-filter-groups nil
        ;; ibuffer-movement-cycle nil
        ibuffer-default-sorting-mode 'filename/process
        ibuffer-title-face 'font-lock-doc-face
        ibuffer-use-header-line nil))



(provide 'init-ibuffer)
