(use-package google-translate-default-ui
  :ensure google-translate
  :config
  ;; (setq google-translate-default-target-language "ru"
  ;;       google-translate-default-source-language "auto")
  (message "Init google-translate-default-ui"))

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
  (setq google-translate-show-phonetic t ;; if not output-destination equal echo-area or pop-up
        google-translate-output-destination nil
        google-translate-pop-up-buffer-set-focus t ;; if output-destination equal nil
        google-translate-enable-ido-completion t
        google-translate-translation-directions-alist ;; C-n / C-p to switch direction
        '(("en" . "ru")
          ("ru" . "en")
          ("ru" . "pl"))
        google-translate-default-target-language "ru"
        google-translate-default-source-language "auto")
  (custom-set-faces
   '(google-translate-text-face ((t (:foreground "#ff7373"))))
   '(google-translate-translation-face ((t (:weight normal :foreground "#74d636")))))
  :config
  ;; (setq google-translate-show-phonetic t ;; if not output-destination equal echo-area or pop-up
  ;;       google-translate-output-destination nil
  ;;       google-translate-pop-up-buffer-set-focus t ;; if output-destination equal nil
  ;;       google-translate-enable-ido-completion t)
  ;; (custom-set-faces
  ;;  '(google-translate-text-face ((t (:foreground "#ff7373"))))
  ;;  '(google-translate-translation-face ((t (:weight normal :foreground "#74d636")))))
  (message "Init google-translate"))


(provide 'init-google-translate)
