(use-package ansi-color
  :defer t
  :preface
  (defun colourise-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-cOLOR-APPLY-on-region compilation-filter-start (point-max))))
  :hook ((compilation-filter . colourise-compilation-buffer)))

(provide 'init-ansi-color)
