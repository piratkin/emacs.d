(use-package google-translate-default-ui
  :ensure google-translate
  :config
  (progn
    ;; (setq google-translate-default-target-language "ru"
    ;;       google-translate-default-source-language "auto")
    (message "Init google-translate-default-ui")))

(use-package google-translate-smooth-ui
  :ensure google-translate
  :config

  ;; (setq google-translate-translation-directions-alist ;; C-n / C-p to switch direction
  ;;       '(("en" . "ru")
  ;;         ("ru" . "en")
  ;;         ("ru" . "pl")))
  (message "Init google-translate-smooth-ui"))

(use-package google-translate
  :ensure t
  :init
  (progn
    ;; if not output-destination equal echo-area or pop-up
    (setq google-translate-show-phonetic t)
    (setq google-translate-output-destination nil)
    ;; if output-destination equal nil
    (setq google-translate-pop-up-buffer-set-focus t)
    (setq google-translate-enable-ido-completion t)
    ;; C-n / C-p to switch direction
    (setq google-translate-default-target-language "ru")
    (setq google-translate-default-source-language "auto"))
  :config
  (progn
    (setq google-translate-translation-directions-alist
          '(("en" . "ru") ("ru" . "en") ("ru" . "pl")))
    (custom-set-faces
     '(google-translate-text-face ((t (:foreground "#ff7373"))))
     '(google-translate-translation-face ((t (:weight normal :foreground "#74d636")))))
    ;; Failed to search TKK
    (defun google-translate--search-tkk ()
      "Search TKK." (list 430675 2721866130))
    ;; Debug Google translate
    ;; (setq google-translate-backend-method 'curl)
    ;; (setq google-translate-backend-method 'wget)
    ;; (setq google-translate-backend-user-agent "Emacs")
    ;; (setq google-translate-backend-debug t)
    (message "Init google-translate")))


(provide 'init-google-translate)
