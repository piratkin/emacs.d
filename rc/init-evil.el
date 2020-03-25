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

;;
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t ;; This is optional since it's already set to t by default.
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        ;; evil-search-module 'evil-search
        evil-search-module 'isearch
        ;; evil-ex-substitute-global t
        evil-want-fine-undo 'no
        evil-kill-on-visual-paste nil)
  :custom
  (evil-default-cursor '(box "magenta"))
  (evil-insert-state-cursor '(hollow "#28def0")) ;; green
  (evil-replace-state-cursor '(hollow "#28def0")) ;; green
  (evil-operator-state-cursor '(hollow "#28def0")) ;; green
  (evil-motion-state-cursor '(box "red"))
  (evil-normal-state-cursor '(box "#eead0e")) ;; yellow
  (evil-visual-state-cursor '(hollow "#eead0e")) ;; yellow
  (evil-vsplit-window-right t "like vim's 'splitright'")
  (evil-split-window-below t  "like vim's 'splitbelow'")
  :config
  (define-key evil-normal-state-map "Y" (kbd "y$"))
  ;; Use escape to quit, and not as a meta-key.
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  ;; C-hjkl to move around windows
  ;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  ;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  ;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  ;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  ;; Lazy ex with ';'
  (define-key evil-normal-state-map ";" 'evil-ex)
  (define-key evil-visual-state-map ";" 'evil-ex)
  (evil-mode 1))

;; vim-like keybindings everywhere in emacs
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; gl and gL operators, like vim-lion
(use-package evil-lion
  :after evil
  :ensure t
  :config
  (evil-lion-mode))

;; gc operator, like vim-commentary
(use-package evil-commentary
  :after evil
  :ensure t
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode 1))

;; * operator in vusual mode
(use-package evil-visualstar
  :after evil
  :ensure t
  :bind
  (:map evil-visual-state-map
        ("*" . evil-visualstar/begin-search-forward)
        ("#" . evil-visualstar/begin-search-backward)))

;; like vim-surround
(use-package evil-surround
  :after evil
  :ensure t
  :diminish evil-surround-mode
  :config
  (global-evil-surround-mode 1))

;; visual hints while editing
(use-package evil-goggles
  :after evil
  :ensure t
  :config
  (evil-goggles-mode)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))

(use-package evil-escape
  :after evil
  :ensure t
  :bind
  (:map evil-insert-state-map
        ("C-g" . evil-escape)
        ("ESC" . evil-escape))
  (:map evil-replace-state-map
        ("C-g" . evil-escape)
        ("ESC" . evil-escape))
  (:map evil-visual-state-map
        ("C-g" . evil-escape)
        ("ESC" . evil-escape))
  (:map evil-operator-state-map
        ("C-g" . evil-escape)
        ("ESC" . evil-escape))
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "tn"
                evil-escape-delay 0.25)
  ;; no `evil-escape' in minibuffer
  (push #'minibufferp evil-escape-inhibit-functions))

;; Evil-indent-textobject, but better
(use-package evil-indent-plus
  :after evil
  :ensure t
  ;; :demand t
  :config
  (evil-indent-plus-default-bindings))

(use-package evil-matchit
  :after evil
  :ensure t)

;; (use-package evil-anzu
;;   :defer t
;;   :after evil
;;   :init
;;   ;; (setq anzu-cons-mode-line-p nil)
;;   (global-anzu-mode +1))

(use-package evil-anzu
  :after evil
  :quelpa
  (evil-anzu :fetcher github :repo "syohex/emacs-evil-anzu")
  :init
  ;; (setq anzu-cons-mode-line-p nil)
  (global-anzu-mode t))

;; (setq el-get-sources (append el-get-sources '(
;;   (:name evil-anzu
;;    :type github
;;    :pkgname "syohex/emacs-evil-anzu"
;;    :depends (evil anzu)
;;    :features (evil-anzu)   ;; ---- this is the "fix"
;;    :after (progn
;;       (global-anzu-mode t)
;; )))))



(provide 'init-evil)
