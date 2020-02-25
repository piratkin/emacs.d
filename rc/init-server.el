;; Emacs server
(use-package server                     ; The server of `emacsclient'
  :ensure t
  ;; :diminish (server-buffer-clients . " ⓒ")
  :config
  (unless (server-running-p)
    (server-mode)))



(provide 'init-server)
