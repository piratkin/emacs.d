;; (use-package reverse-im
;;   :ensure t
;;   :custom
;;   (reverse-im-modifiers '(control meta super))
;;   (reverse-im-input-methods '("russian-unipunct"))
;;   :config
;;   (reverse-im-mode t))

(use-package reverse-im
  :ensure t
  :config
  (reverse-im-activate "russian-computer"))


(provide 'init-reverse-im)
