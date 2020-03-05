(use-package auto-complete-c-headers
  :ensure t
  :hook ((c-mode c++-mode) . (lambda ()
                               (add-to-list 'ac-sources 'ac-source-c-headers))))



(provide 'auto-complete-c-headers)
