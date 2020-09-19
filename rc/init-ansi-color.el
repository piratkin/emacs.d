(use-package ansi-color
  :ensure t
  :defer t
  :preface
  (defun colourise-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  :hook
  (compilation-filter . colourise-compilation-buffer)
  :config
  (defun ansi-colorize-current-buffer ()
    "Colorize ansi escape sequences in the current buffer."
    (interactive)
    (ansi-color-apply-on-region (point-min) (point-max))))

;; (ignore-errors
;;   (require 'ansi-color)
;;   (defun colorize-compilation-buffer ()
;;     (when (eq major-mode 'compilation-mode)
;;       (let ((inhibit-read-only t))
;;         (if (boundp 'compilation-filter-start)
;;             (ansi-color-apply-on-region compilation-filter-start (point))))))
;;   (add-hook 'compilation-filter-hook 'colorize-compilation-buffer))




(provide 'init-ansi-color)
