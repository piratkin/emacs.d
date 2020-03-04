(use-package which-key
  :ensure t
  ;; :diminish which-key-mode)
  :config
  (which-key-setup-minibuffer)
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.05
        which-key-show-early-on-C-h t
        which-key-prefix-prefix "+"
        which-key-max-description-length 42
        which-key-separator " → "
        which-key-show-prefix 'bottom
        which-key-sort-order 'which-key-prefix-then-key-order)

  ;; (which-key-setup-side-window-right)
  ;; (which-key-setup-side-window-bottom)
  ;; (which-key-setup-side-window-right-bottom)
  ;; (setq which-key-popup-type 'side-window
  ;;       which-key-side-window-location 'bottom
  ;;       which-key-side-window-max-width 0.3
  ;;       which-key-side-window-max-height 0.5)

  (setq which-key-replacement-alist
        '((("<\\([[:alnum:]-]+\\)>") . ("\\1"))
          ;; (("DEL") . ("⌫"))
          ;; (("RET") . ("⏎"))
          ;; (("SPC") . ("␣"))
          ;; (("TAB") . ("↹"))
          (("up") . ("↑"))
          (("right") . ("→"))
          (("down") . ("↓"))
          (("left") . ("←"))))

  ;; (which-key-declare-prefixes
  ;;   ;; Prefixes for global prefixes and minor modes
  ;;   "C-c @" "outline"
  ;;   "C-c 8" "typo"
  ;;   "C-c 8 -" "typo/dashes"
  ;;   "C-c 8 <" "typo/left-brackets"
  ;;   "C-c 8 >" "typo/right-brackets"
  ;;   ;; Prefixes for my personal bindings
  ;;   "C-c a" "applications"
  ;;   "C-c b" "buffers"
  ;;   "C-c c" "compile-and-comments"
  ;;   "C-c e" "errors"
  ;;   "C-c f" "files"
  ;;   "C-c f v" "variables"
  ;;   "C-c g" "git"
  ;;   "C-c g g" "github/gist"
  ;;   "C-c h" "helm/help"
  ;;   "C-c i" "insert"
  ;;   "C-c i l" "licenses"
  ;;   "C-c j" "jump"
  ;;   "C-c l" "language/spelling"
  ;;   "C-c m" "major mode"
  ;;   "C-c o" "cursors"
  ;;   "C-c p" "projects"
  ;;   "C-c p s" "projects/search"
  ;;   "C-c p x" "projects/execute"
  ;;   "C-c p 4" "projects/other-window"
  ;;   "C-c s" "search"
  ;;   "C-c t" "toggle"
  ;;   "C-c w" "windows/frames"
  ;;   "C-c x" "text")

  ;; ;; Prefixes for major modes
  ;; (which-key-declare-prefixes-for-mode 'markdown-mode
  ;;   "C-c TAB" "markdown/images"
  ;;   "C-c C-a" "markdown/links"
  ;;   "C-c C-c" "markdown/process"
  ;;   "C-c C-s" "markdown/style"
  ;;   "C-c C-t" "markdown/header"
  ;;   "C-c C-x" "markdown/structure"
  ;;   "C-c m" "markdown/personal")

  ;; (which-key-declare-prefixes-for-mode 'emacs-lisp-mode
  ;;   "C-c m" "elisp/personal"
  ;;   "C-c m e" "eval")

  ;; (which-key-declare-prefixes-for-mode 'web-mode
  ;;   "C-c C-a" "web/attributes"
  ;;   "C-c C-b" "web/blocks"
  ;;   "C-c C-d" "web/dom"
  ;;   "C-c C-e" "web/element"
  ;;   "C-c C-t" "web/tags")
  :init
  (which-key-mode))



(provide 'init-which-key)
