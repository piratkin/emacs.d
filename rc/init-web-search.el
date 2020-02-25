;;;; web-search
(use-package web-search
  :config
  (push '("Qwant" "https://www.qwant.com/?q=%s" "Search") web-search-providers)
  (setq web-search-default-provider "Qwant"))



(provide 'init-web-search)
