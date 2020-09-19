
(defun rc:init-markdown-conf ()
  (interactive)
  (setq-default
   truncate-lines nil))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :hook
  (markdown-mode . rc:init-markdown-conf)
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "markdown"))

;; Additional functions for Emacs [markdown-mode].
;; https://github.com/milkypostman/markdown-mode-plus
(use-package markdown-mode+
  :after markdown-mode
  :ensure t
  :defer t)

(provide 'init-markdown)
