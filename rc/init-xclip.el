
(defvar is-linux-p
  (string= system-type "gnu/linux")
  "detect if linux is running")
  
(when is-linux-p
  (use-package xclip
    :ensure t
    :config
    (xclip-mode 1)))

(provide 'init-xclip)
