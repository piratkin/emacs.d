;; (require-package 'gitignore-mode)
;; (require-package 'gitconfig-mode)
;; (require-package 'git-messenger)
;; (require-package 'git-timemachine)
;; (use-package magit-blame
;;       :bind ("C-c C-g b" . magit-blame-mode))

(use-package magit
  ;; :ensure t
  :ensure-system-package
  ((git . "yay -S git"))
  ;; :bind
  ;; (("C-x g" . magit-status))
  ;; :hook
  ;; (magit-mode . with-ldeck-magit-mode-customisations)
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  :config
  (progn
    (setq-default magit-completing-read-function 'helm--completing-read-default)
    (setq-default magit-diff-refine-hunk t)
    (setq magit-log-arguments
          (quote ("--graph" "--color" "--decorate" "-n256")))
    (setq magit-tag-arguments
          (quote ("--annotate")))))



(provide 'init-magit)
