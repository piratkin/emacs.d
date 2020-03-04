;; general-create-definer
(use-package general
  :ensure t
  :after which-key
  :config
  (general-evil-setup t)
  ;; (define-key evil-motion-state-map " " nil)
  (general-define-key
   :states '(normal visual emacs)
   :prefix "SPC"
   :keymaps 'override
   ;; Main menu
   "f" '(:ignore t :which-key "Files")
   "w" '(evil-window-map :which-key "Windows")
   "b" '(:ignore t :which-key "Buffers")
   "d" '(:ignore t :which-key "Dired")
   "t" '(:ignore t :which-key "Terminal")
   "j" '(:ignore t :which-key "Jump")
   "e" '(:ignore t :which-key "Edit")
   "s" '(:ignore t :which-key "Search")
   "x" '(:ignore t :which-key "System")
   "a" '(:ignore t :which-key "Other")
   "h" '(:ignore t :which-key "Help")
   "i" '(:ignore t :which-key "Inet")
   ;; Generel
   "SPC" '(evil-escape :which-key "Escape")
   "TAB" '(ivy-switch-buffer :which-key "Switch buffer")
   ;; Files
   "ff" '(counsel-find-file :which-key "Find file")
   "fg" '(counsel-git :which-key "Find in git dir")
   "fh" '(bug-hunter-file :which-key "Bug hunter file")
   "fH" '(bug-hunter-init-file :which-key "Bug hunter init")
   "fll" '(locate :which-key "Locate")
   "fls" '(locate-library :which-key "Locate lib")
   ;; "flf" '(locate-file :which-key "Locate file")
   ;; "flt" '(locate-tags :which-key "Locate tag")
   ;; "flc" '(locate-command :which-key "Locate command")
   ;; "fld" '(locate-find-directory :which-key "Locate dir")
   ;; "flD" '(locate-find-directory-other-window :which-key "Locate new windir")
   ;; Buffers
   "bb" '(counsel-buffer-or-recentf :which-key "Recent Buffer")
   "bk" '(kill-this-buffer :which-key "Buffer kill")
   "bz" '(zoom-window-zoom :which-key "Zoom curent buffer")
   "bs" '(save-buffer :which-key "Save buffer")
   "bS" '(save-some-buffers :which-key "Save all")
   ;; "bf" '(toggle-frame-fullscreen :which-key "Toggle fullscreen")
   ;; "bm" '(toggle-frame-maximized :which-key "Toggle maximize")
   ;; Dired
   "dd" '(counsel-dired :which-key "Open Dired buffer")
   ;; Terminal
   "tt" '(shell :which-key "Shell")
   "te" '(eshell :which-key "Emacs Lisp Shell")
   "ta" '(ansi-term :which-key "Ansi Term")
   ;; Edit
   "eu" '(undo-tree-visualize :which-key "Visual undo-tree")
   ;; Jump
   "jj" '(ace-jump-word-mode :which-key "Jump to word")
   "jl" '(ace-jump-line-mode :which-key "Jump to line")
   "jc" '(ace-jump-char-mode :which-key "Jump to char")
   "jg" '(dumb-jump-go :which-key "Jump to def")
   "jG" '(dumb-jump-go-other-window :which-key "Jumpdef ext win")
   "jb" '(dumb-jump-back :which-key "Jump back")
   ;; System
   "xs" '(sudo-edit :which-key "Sudo edit")
   ;; "xf" '(sudo-edit-current-file :which-key "Sudo curent")
   ;; Other
   "aa" '(counsel-M-x :which-key "M-x")
   "az" '(text-scale-increase :which-key "Zoom +")
   "aZ" '(text-scale-decrease :which-key "Zoom -")
   "a0" '(text-scale-adjust :which-key "Zoom reset")
   "ax" '(save-buffers-kill-termina :which-key "Save and exit")
   "ar" '(restart-emacs :which-key "Restart emacs")
   "am" '(memory-usage :which-key "Memory usage")
   "at" '(display-time-world :which-key "World time")
   ;; Help
   "hh" '(help-command :which-key "Help")
   "hd" '(dash-at-point :which-key "Dash at point")
   "hD" '(dash-at-point-with-docset :which-key "Dash with docset")
   ;;
   "ii" '(eww :which-key "Emacs Web Wowser")
   "ib" '(eww-list-bookmarks :which-key "Eww bookmarks")
   "il" '(eww-browse-url :which-key "Eww link")
   ))



(provide 'init-general)
