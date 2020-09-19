;; (use-package reverse-im
;;   :ensure t
;;   :custom
;;   (reverse-im-input-methods '("russian-computer"))
;;   :config
;;   (reverse-im-mode t))

;; (use-package reverse-im
;;   :ensure t
;;   :custom
;;   (reverse-im-modifiers '(control meta super))
;;   (reverse-im-input-methods '("russian-unipunct"))
;;   :config
;;   (reverse-im-mode t))

;; (use-package reverse-im
;;   :ensure t
;;   :config
;;   (reverse-im-activate "russian-computer"))


;; (use-package unipunct
;;   :quelpa
;;   (unipunct :url "https://raw.githubusercontent.com/a13/xkb-custom/master/contrib/unipunct.el" :fetcher url))

(use-package reverse-im
  :ensure t
  ;; :after unipunct
  :custom
  (reverse-im-modifiers '(super))
  (reverse-im-input-methods
   (if (require 'unipunct nil t)
       "russian-unipunct"
     "russian-computer"))
  :config
  (reverse-im-mode t))




(provide 'init-reverse-im)
