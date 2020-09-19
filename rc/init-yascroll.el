
(when (display-graphic-p)
  (use-package yascroll
    :quelpa t
    :config
    ;; (setq gcs-yascroll-color "#598559")
    ;; (set-face-background 'yascroll:thumb-fringe gcs-yascroll-color)
    ;; (set-face-foreground 'yascroll:thumb-fringe gcs-yascroll-color)
    ;; (set-face-background 'yascroll:thumb-text-area gcs-yascroll-color)
    (setq yascroll:delay-to-hide nil)
    ;; Don't hide scrollbar when editing
    (defadvice yascroll:before-change (around always-show-bar activate) ())
    (global-yascroll-bar-mode 1)))



(provide 'init-yascroll)
