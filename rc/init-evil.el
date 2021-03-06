;; ;; Enable evil for vi(m) goodness.
;; (defvar evil-want-C-u-scroll t)
;; (defvar evil-echo-state nil)
;; (defvar evil-symbol-word-search t)

;; ;; Modeline-tags.
;; (defvar evil-normal-state-tag "(n)")
;; (defvar evil-emacs-state-tag "(e)")
;; (defvar evil-visual-state-tag "(v)")
;; (defvar evil-insert-state-tag "(i)")
;; (defvar evil-operator-state-tag "(o)")
;; (defvar evil-motion-state-tag "(m)")
;; (defvar evil-replace-state-tag "(r)")

(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-want-keybinding nil)
    (setq evil-want-integration t))
  :config
  (progn
    ;; (setq evil-want-C-u-scroll t)
    ;; (setq evil-search-module 'evil-search)
    ;; (setq evil-ex-substitute-global t)
    (setq evil-want-fine-undo t)
    (setq evil-kill-on-visual-paste nil)
    ;; cursor color
    (setq evil-default-cursor '(box "magenta"))
    (setq evil-insert-state-cursor '(hollow "#28def0")) ;; green
    (setq evil-replace-state-cursor '(hollow "#28def0")) ;; green
    (setq evil-operator-state-cursor '(hollow "#28def0")) ;; green
    (setq evil-motion-state-cursor '(box "red"))
    (setq evil-normal-state-cursor '(box "#eead0e")) ;; yellow
    (setq evil-visual-state-cursor '(hollow "#eead0e")) ;; yellow
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    ;; (define-key evil-normal-state-map "Y" (kbd "y$"))
    ;; Use escape to quit, and not as a meta-key.
    ;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
    ;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
    ;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
    ;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
    ;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
    ;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
    ;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
    ;; C-hjkl to move around windows
    ;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    ;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    ;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    ;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    ;; Lazy ex with ';'
    ;; (define-key evil-normal-state-map ";" 'evil-ex)
    ;; (define-key evil-visual-state-map ";" 'evil-ex)
    ;; (define-key evil-normal-state-map ";" 'counsel-M-x)
    ;; (define-key evil-visual-state-map ";" 'counsel-M-x)
    ;; (define-key evil-normal-state-map [tab] 'evil-toggle-fold)
    (evil-mode 1)))

;; vim-like keybindings everywhere in emacs
(use-package evil-collection
  :ensure t
  :after (evil)
  ;; :init
  ;; (progn
  ;;   (setq evil-want-keybinding nil))
  :config
  (progn
    (setq evil-collection-setup-minibuffer t)
    ;; (setq evil-collection-key-blacklist '("SPC" "gd" "gf"))
    (evil-collection-init)))

;; gl and gL operators, like vim-lion
(use-package evil-lion
  :ensure t
  :after (evil)
  :config
  (evil-lion-mode))

;; gc operator, like vim-commentary
(use-package evil-commentary
  :ensure t
  :after (evil)
  :config
  (evil-commentary-mode 1))

;; * operator in vusual mode
(use-package evil-visualstar
  :after (evil)
  ;; :bind
  ;; (:map evil-visual-state-map
  ;;       ("*" . evil-visualstar/begin-search-forward)
  ;;       ("#" . evil-visualstar/begin-search-backward))
  :ensure t)

;; like vim-surround
(use-package evil-surround
  :ensure t
  :after (evil)
  ;; :diminish evil-surround-mode
  :config
  (global-evil-surround-mode 1))

;; visual hints while editing
(use-package evil-goggles
  :ensure t
  :after (evil)
  :config
  (progn
    ;; optionally use diff-mode's faces; as a result, deleted text
    ;; will be highlighed with `diff-removed` face which is typically
    ;; some red color (as defined by the color theme)
    ;; other faces such as `diff-added` will be used for other actions
    (evil-goggles-use-diff-faces)
    (evil-goggles-mode)))

(use-package evil-escape
  :ensure t
  :after (evil)
  ;; :bind
  ;; (:map evil-insert-state-map
  ;;       ("C-g" . evil-escape)
  ;;       ("ESC" . evil-escape))
  ;; (:map evil-replace-state-map
  ;;       ("C-g" . evil-escape)
  ;;       ("ESC" . evil-escape))
  ;; (:map evil-visual-state-map
  ;;       ("C-g" . evil-escape)
  ;;       ("ESC" . evil-escape))
  ;; (:map evil-operator-state-map
  ;;       ("C-g" . evil-escape)
  ;;       ("ESC" . evil-escape))
  :config
  (setq-default evil-escape-key-sequence "jk"
                evil-escape-delay 0.2)
  ;; no `evil-escape' in minibuffer
  ;; (push #'minibufferp evil-escape-inhibit-functions)
  (evil-escape-mode 1))

;; Evil-indent-textobject, but better
(use-package evil-indent-plus
  :ensure t
  :after (evil)
  :config
  (evil-indent-plus-default-bindings))

(use-package evil-matchit
  :after (evil)
  :ensure t)

;; (use-package evil-anzu
;;   :defer t
;;   :after evil
;;   :init
;;   ;; (setq anzu-cons-mode-line-p nil)
;;   (global-anzu-mode +1))

(use-package evil-anzu
  :quelpa
  :after (evil)
  :config
  ;; (setq anzu-cons-mode-line-p nil)
  (global-anzu-mode t))

;; (use-package evil-anzu
;;   :after evil
;;   :quelpa
;;   (evil-anzu :fetcher github :repo "syohex/emacs-evil-anzu")
;;   :init
;;   ;; (setq anzu-cons-mode-line-p nil)
;;   (global-anzu-mode t))

;; (setq el-get-sources (append el-get-sources '(
;;   (:name evil-anzu
;;    :type github
;;    :pkgname "syohex/emacs-evil-anzu"
;;    :depends (evil anzu)
;;    :features (evil-anzu)   ;; ---- this is the "fix"
;;    :after (progn
;;       (global-anzu-mode t)
;; )))))

;; (use-package evil-jumper
;;   :ensure t
;;   :after (evil)
;;   :config
;;   (progn
;;     (evil-jumper-mode)))

;; (use-package evil-ediff
;;   :ensure t
;;   :config
;;   (evil-ediff-init))


(provide 'init-evil)
