;;
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; vim-like keybindings everywhere in emacs
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; gl and gL operators, like vim-lion
(use-package evil-lion
  :ensure t
  :config
  (evil-lion-mode))

;; gc operator, like vim-commentary
(use-package evil-commentary 
  :ensure t
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode 1))

;; * operator in vusual mode
(use-package evil-visualstar
  :ensure t
  :bind (:map evil-visual-state-map
        ("*" . evil-visualstar/begin-search-forward)
        ("#" . evil-visualstar/begin-search-backward)))

;; like vim-surround  
(use-package evil-surround 
  :ensure t
  :diminish evil-surround-mode
  :config
  (global-evil-surround-mode 1))

;; visual hints while editing
(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))