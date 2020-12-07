(use-package tsc
  :ensure t)

(use-package tree-sitter
  :ensure t
  :after (tsc)
  :hook
  (sh-mode c-mode c++-mode css-mode
   html-mode js-mode js2-mode
   json-mode haskell-mode java-mode
   typescript-mode php-mode
   python-mode)
  :config
  (progn
    (add-to-list
     'tree-sitter-major-mode-language-alist
     '((sh-mode . bash)
       (c-mode . c)
       (c++-mode . cpp)
       (css-mode . css)
       (html-mode . html)
       (js-mode . javascript)
       (js2-mode . javascript)
       (json-mode . json)
       (haskell-mode . haskell)
       (java-mode . java)
       (typescript-mode . typescript)
       (php-mode . php)
       (python-mode . python)))
    (global-tree-sitter-mode)))

(use-package tree-sitter-langs
  :after (tree-sitter)
  :hook
  (sh-mode c-mode c++-mode css-mode
   html-mode js-mode js2-mode
   json-mode haskell-mode java-mode
   typescript-mode php-mode python-mode)
  :ensure t)

(use-package tree-sitter-hl
  :hook
  (sh-mode c-mode c++-mode css-mode
   html-mode js-mode js2-mode
   json-mode haskell-mode java-mode
   typescript-mode php-mode python-mode)
  :ensure nil)



(provide 'init-tree-sitter)
