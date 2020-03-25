
(defun rc:init-dired-conf ()
  (interactive)
  (setq-default
   ;; dired-ls-F-marks-symlinks t
   truncate-lines t))

(use-package dired
  :ensure nil
  :hook
  ((dired-mode . rc:init-dired-conf)
   (dired-mode . auto-fill-mode)
   ;; (dired-mode . dired-omit-mode)
   (dired-mode . dired-hide-details-mode))
  :config
  ;; Dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)
  ;; Always delete and copy recursively
  (setq-default
   dired-recursive-deletes 'always
   dired-recursive-copies 'always
   ;; Human-readable sizes and sort by size
   ;; dired-listing-switches "-alh --group-directories-first"
   ;; dired-listing-switches "-alXGh --group-directories-first"
   ;; dired-listing-switches "-vAohpL --group-directories-first"
   ;; dired-listing-switches "-vAohLF --group-directories-first"
   ;; dired-listing-switches "-AohF --time-style=iso --group-directories-first"
   ;; dired-listing-switches "-vAohbq --time-style=iso --group-directories-first --indicator-style=file-type"
   dired-listing-switches "-vAohbqF --time-style=iso --group-directories-first"
   ;; dired-listing-switches "-AhFvo --group-directories-first --time-style=+%d/%m/%y"
   ;; dired-listing-switches "-AhFo --group-directories-first --time-style=+%d/%m/%y"
   ;; If there is a dired buffer displayed in the next window, use its
   ;; current subdir, instead of the current subdir of this dired buffer
   dired-dwim-target t
   ;; Allow editing file permissions in dired (rwx)
   wdired-allow-to-change-permissions t)
  ;;
  (when (executable-find "fd")
    (use-package fd-dired))
  ;;
  (when (executable-find "gls")
    ;; Use GNU ls as `gls' from `coreutils' if available.
    (setq insert-directory-program "gls")))

;; (use-package diredfl
;;   :after dired
;;   :init
;;   (diredfl-global-mode t))

(use-package dired-aux
  :after dired
  :ensure nil)

(use-package dired-rsync
  :after dired
  :bind
  (;;:map dired-mode-map
   ("C-c C-r" . dired-rsync)))

;; (use-package dired+
;;   :after dired
;;   :quelpa
;;   (dired+ :fetcher github :repo "emacsmirror/dired-plus")
;;   :config
;;   (setq diredp-wrap-around-flag nil))

(use-package dired-avfs
  :after dired)

(use-package dired-filter
  :after dired)

(use-package dired-open
  :after dired)

(use-package dired-collapse
  :after dired
  :ensure t
  :hook
  (dired-mode . dired-collapse-mode))

(use-package image-dired
  :after dired
  :ensure t)

(use-package dired-subtree
  :after dired
  :bind
  (;;:map dired-mode-map
   :prefix "C-c t"
   :prefix-map dired-subtree-map
   :prefix-docstring "Dired subtree map."
   ("<C-i-key>" . dired-subtree-insert)
   ("C-/" . dired-subtree-apply-filter)
   ("C-k" . dired-subtree-remove)
   ("C-n" . dired-subtree-next-sibling)
   ("C-p" . dired-subtree-previous-sibling)
   ("C-u" . dired-subtree-up)
   ("C-d" . dired-subtree-down)
   ("C-a" . dired-subtree-beginning)
   ("C-e" . dired-subtree-end)
   ("C-c" . dired-subtree-cycle)
   ("m" . dired-subtree-mark-subtree)
   ("u" . dired-subtree-unmark-subtree)
   ("C-o C-f" . dired-subtree-only-this-file)
   ("C-o C-d" . dired-subtree-only-this-directory))
  ;; (:map dired-mode-map
   ;; ("<enter>" . rc:dwim-toggle-or-open)
   ;; ("<return>" . rc:dwim-toggle-or-open)
   ;; ("<tab>" . rc:dwim-toggle-or-open)
   ;; ("<down-mouse-1>" . rc:mouse-dwim-to-toggle-or-open))
  :config
  ;; Function to customize the line prefixes (I simply indent the lines a bit)
  (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
  :custom
  (dired-subtree-use-backgrounds nil)
  (dired-subtree-apply-filter t))

(use-package dired-toggle-sudo
  :ensure t
  ;; :defer t
  :bind
  (("C-c D" . dired-toggle-sudo)))

(use-package dired-ranger
  :ensure t
  :bind
  (;;:map dired-mode-map
   :prefix "C-c r"
   :prefix-map dired-ranger-map
   :prefix-docstring "Map for ranger operations."
   ("c" . dired-ranger-copy)
   ("p" . dired-ranger-paste)
   ("m" . dired-ranger-move))
  (;;:map dired-mode-map
   ("'" . dired-ranger-bookmark)
   ("`" . dired-ranger-bookmark-visit)))

(use-package dired-narrow
  :commands dired-narrow
  ;; :init
  ;; (bind-key "s" 'dired-narrow dired-mode-map)
  :bind
  (;;:map dired-mode-map
   :prefix "C-c d"
   :prefix-map dired-ranger-map
   :prefix-docstring "Map for ranger operations."
   ("c" . dired-ranger-copy)
   ("p" . dired-ranger-paste)
   ("m" . dired-ranger-move))
  )

(use-package dired-tagsistant
  :after dired
  :quelpa
  (dired+ :fetcher github :repo "emacsmirror/dired-plus")
  :bind
  (;;:map dired-mode-map
   :prefix "M-t"
   :prefix-map dired-tagsistant-map
   :prefix-docstring "Dired tagsistant map."
   ("t" . dired-tagsistant-tag)
   ("s" . dired-tagsistant-tag-symlink)))

;; (use-package dirtree
;;   :defer t)

;; (defun rc:dwim-toggle-or-open ()
;;   "Toggle subtree or open the file."
;;   (interactive)
;;   (if (file-directory-p (dired-get-file-for-visit))
;;       (progn
;;     (dired-subtree-toggle)
;;     (revert-buffer))
;;     (dired-find-file)))

;; (defun rc:mouse-dwim-to-toggle-or-open (event)
;;   "Toggle subtree or the open file on mouse-click in dired."
;;   (interactive "e")
;;   (let* ((window (posn-window (event-end event)))
;;      (buffer (window-buffer window))
;;      (pos (posn-point (event-end event))))
;;     (progn
;;       (with-current-buffer buffer
;;     (goto-char pos)
;;     (mhj/dwim-toggle-or-open)))))

;; (defun rc:toggle-project-explorer ()
;;   "Toggle the project explorer window."
;;   (interactive)
;;   (let* ((buffer (dired-noselect (projectile-project-root)))
;;     (window (get-buffer-window buffer)))
;;     (if window
;;     (rc:hide-project-explorer)
;;       (rc:show-project-explorer))))

;; (defun rc:show-project-explorer ()
;;   "Project dired buffer on the side of the frame.
;; Shows the projectile root folder using dired on the left side of
;; the frame and makes it a dedicated window for that buffer."
;;   (let ((buffer (dired-noselect (projectile-project-root))))
;;     (progn
;;       (display-buffer-in-side-window buffer '((side . left) (window-width . 0.2)))
;;       (set-window-dedicated-p (get-buffer-window buffer) t))))

;; (defun rc:hide-project-explorer ()
;;   "Hide the project-explorer window."
;;   (let ((buffer (dired-noselect (projectile-project-root))))
;;     (progn
;;       (delete-window (get-buffer-window buffer))
;;       (kill-buffer buffer))))

;; (use-package dired-rainbow
;;   :ensure t)

;; (defconst my-dired-media-files-extensions '("mp3" "mp4" "MP3" "MP4" "avi" "mpg" "flv" "ogg" "wmv" "mkv" "mov" "wma")
;;   "Media file extensions that should launch in VLC.
;; Also used for highlighting.")

;; (use-package dired-rainbow
;;   :ensure t
;;   :config
;;   (progn
;;     (dired-rainbow-define html "#4e9a06" ("htm" "html" "xhtml"))
;;     (dired-rainbow-define xml "#b4fa70" ("xml" "xsd" "xsl" "xslt" "wsdl"))

;;     (dired-rainbow-define document "#fce94f" ("doc" "docx" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub"))
;;     (dired-rainbow-define excel "#3465a4" ("xlsx"))
;;     (dired-rainbow-define media "#ce5c00" my-dired-media-files-extensions)
;;     (dired-rainbow-define image "#ff4b4b" ("jpg" "png" "jpeg" "gif" "png"))

;;     (dired-rainbow-define log "#c17d11" ("log"))
;;     (dired-rainbow-define sourcefile "#fcaf3e" ("py" "c" "cc" "h" "java" "pl" "rb" "R" "php"))

;;     (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
;;     (dired-rainbow-define compressed "#ad7fa8" ("zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
;;     (dired-rainbow-define packaged "#e6a8df" ("deb" "rpm"))
;;     (dired-rainbow-define encrypted "LightBlue" ("gpg" "pgp"))

;;     (dired-rainbow-define-chmod executable-unix "Green" "-.*x.*")
;;     ))

;; (use-package dired-subtree
;;   :demand
;;   :bind
;;   (:map dired-mode-map
;; 	("<enter>" . dwim-toggle-or-open)
;; 	("<return>" . dwim-toggle-or-open)
;; 	("<tab>" . dwim-toggle-or-open)
;; 	("<down-mouse-1>" . mouse-dwim-to-toggle-or-open))
;;   :config
;;   (progn
;;     ;; Function to customize the line prefixes (I simply indent the lines a bit)
;;     (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
;;     (setq dired-subtree-use-backgrounds nil)))

;; (defun dwim-toggle-or-open ()
;;   "Toggle subtree or open the file."
;;   (interactive)
;;   (if (file-directory-p (dired-get-file-for-visit))
;;       (progn
;; 	(dired-subtree-toggle)
;; 	(revert-buffer))
;;     (dired-find-file)))

;; (defun mouse-dwim-to-toggle-or-open (event)
;;   "Toggle subtree or the open file on mouse-click in dired."
;;   (interactive "e")
;;   (let* ((window (posn-window (event-end event)))
;; 	 (buffer (window-buffer window))
;; 	 (pos (posn-point (event-end event))))
;;     (progn
;;       (with-current-buffer buffer
;; 	(goto-char pos)
;; 	(dwim-toggle-or-open)))))


;; (use-package dired-sidebar
;;   :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
;;   :ensure t
;;   :commands (dired-sidebar-toggle-sidebar)
;;   :init
;;   (add-hook 'dired-sidebar-mode-hook
;;             (lambda ()
;;               (unless (file-remote-p default-directory)
;;                 (auto-revert-mode))))
;;   :config
;;   (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
;;   (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

;;   (setq dired-sidebar-subtree-line-prefix "__")
;;   (setq dired-sidebar-theme 'nerd)
;;   (setq dired-sidebar-use-term-integration t)
;;   (setq dired-sidebar-use-custom-font t))


;; ;; Show git info in dired
;; (use-package dired-git-info
;;   :after dired
;;   :bind
;;   (:map dired-mode-map
;;         (")" . dired-git-info-mode)))

;; (use-package dired-quick-sort
;;   :ensure t
;;   :after dired
;;   :config
;;   (dired-quick-sort-setup))


;; ;; Quick sort dired buffers via hydra
;; (use-package dired-quick-sort
;;   :bind
;;   (:map dired-mode-map
;;         ("S" . hydra-dired-quick-sort/body)))

;; ;; http://www.emacswiki.org/DiredPlus
;; (use-package dired+
;;   :after dired
;;   ;; :load-path "elisp/manually-synced/dired-plus"
;;   :init
;;   ;; Details toggling is bound to "(" in `dired-mode' by default
;;   (setq diredp-hide-details-initially-flag nil)
;;   :hook
;;   (dired-mode rc:dired-update-privilege-faces)
;;   :config
;;   ;; Privilege indicator faces
;;   (defun rc:dired-update-privilege-faces ()
;;     (set-face-attribute 'diredp-dir-priv nil
;;                         :foreground "#7474FFFFFFFF"
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-exec-priv nil
;;                         :foreground "dodger blue"
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-other-priv nil
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-write-priv nil
;;                         :foreground "#25258F8F2929"
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-read-priv nil
;;                         :foreground "#999932325555"
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-no-priv nil
;;                         :foreground "#2C2C2C2C2C2C"
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-rare-priv nil
;;                         :foreground "Green"
;;                         :background (face-background 'default))
;;     (set-face-attribute 'diredp-link-priv nil
;;                         :foreground "#00007373FFFF")))

;; (use-package dired-ranger
;;   :ensure t
;;   :bind (:map dired-mode-map
;;               ("W" . dired-ranger-copy)
;;               ("X" . dired-ranger-move)
;;               ("Y" . dired-ranger-paste)))

;; (use-package dired-subtree
;;   :ensure t
;;   :after dired
;;   :config
;;   (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
;;   (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))



(provide 'init-dired)
