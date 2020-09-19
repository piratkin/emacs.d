(use-package ispell
  :ensure t
  :config
  (setq ispell-program-name "aspell")
  (add-to-list 'ispell-extra-args "--sug-mode=ultra")
  ;; (add-to-list 'ispell-extra-args "--run-together")
  (add-to-list 'ispell-extra-args "--lang=en_US"))

;; (use-package flyspell-lazy
;;   :ensure t
;;   :config
;;   (flyspell-lazy-mode 1))

(use-package flyspell
  :ensure t
  ;; :after flyspell-lazy
  :hook
  (text-mode . flyspell-mode)
  :config
  (setq flyspell-issue-message-flag nil
        flyspell-issue-welcome-flag nil))

(use-package flyspell-prog-mode
  :ensure nil
  ;; :after flyspell-lazy
  :hook
  (prog-mode . flyspell-prog-mode))

(use-package flyspell-correct-ivy
  :ensure t
  :config
  (setq flyspell-correct-interface #'rc:flyspell-correct))

(defun rc:flyspell-correct (candidates word)
  (let* ((save "[SAVE]")
         (accept-session "[ACCEPT (session)]")
         (accept-buffer "[ACCEPT (buffer)]")
         (skip "[SKIP]")
         (result (completing-read
                  (format "Correcting '%s': " word)
                  (append candidates
                          (list save accept-session accept-buffer skip)))))
    (cond
     ((string= result save)
      (cons 'save word))
     ((string= result accept-session)
      (cons 'session word))
     ((string= result accept-buffer)
      (cons 'buffer word))
     ((string= result skip)
      (cons 'skip word))
     (t
      result))))


(provide 'init-flyspell)
