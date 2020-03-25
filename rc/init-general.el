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
   "fl" '(:ignore t :which-key "Locate")
   "w" '(evil-window-map :which-key "Windows")
   "b" '(:ignore t :which-key "Buffers")
   "d" '(:ignore t :which-key "Dired")
   "g" '(:ignore t :which-key "Git")
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
   "fb" '(bug-hunter-file :which-key "Bug hunter file")
   "fB" '(bug-hunter-init-file :which-key "Bug hunter init")
   "fll" '(locate :which-key "Locate")
   "fls" '(locate-library :which-key "Locate lib")
   ;; Buffers
   "bb" '(counsel-buffer-or-recentf :which-key "Recent Buffer")
   "bk" '(kill-this-buffer :which-key "Buffer kill")
   "bz" '(zoom-window-zoom :which-key "Zoom curent buffer")
   "bs" '(save-buffer :which-key "Save buffer")
   "bS" '(save-some-buffers :which-key "Save all")
   "bx" '(eval-buffer :which-key "Buffer execute")
   ;; Dired
   "dd" '(counsel-dired :which-key "Open Dired buffer")
   ;; Git
   "gh" '(git-timemachine :which-key "Git history")
   ;; "gm" '(git-timemachine-mode-map :which-key "Git history")
   ;; Terminal
   "tt" '(shell :which-key "Shell")
   "te" '(eshell :which-key "Emacs Lisp Shell")
   "ta" '(ansi-term :which-key "Ansi Term")
   ;; Edit
   "eu" '(undo-tree-visualize :which-key "Undo-tree view")
   ;; Jump
   "jj" '(ace-jump-word-mode :which-key "Jump to word")
   "jl" '(ace-jump-line-mode :which-key "Jump to line")
   "jc" '(ace-jump-char-mode :which-key "Jump to char")
   ;; "js" '(eassist-switch-h-cpp :which-key "Header\Source")
   ;; Search
   "sw" '(web-search :which-key "Web search")
   "sd" '(dumb-jump-go :which-key "Jump to def")
   "sD" '(dumb-jump-go-other-window :which-key "Jump def ext")
   "sb" '(dumb-jump-back :which-key "Jump back")
   "sp" '(dumb-jump-go-prompt :which-key "Jump to prompt")
   ;; System
   "xs" '(sudo-edit :which-key "Sudo edit")
   "xx" '(save-buffers-kill-emacs :which-key "Save & exit")
   "xr" '(restart-emacs :which-key "Restart")
   "xm" '(memory-usage :which-key "Memory usage")
   ;; Other
   "aa" '(counsel-M-x :which-key "M-x")
   "az" '(text-scale-increase :which-key "Zoom (+)")
   "aZ" '(text-scale-decrease :which-key "Zoom (-)")
   "a=" '(text-scale-adjust :which-key "Zoom (=)")
   "at" '(display-time-world :which-key "World time")
   ;; Help
   "hh" '(help-command :which-key "Help")
   "hd" '(dash-at-point :which-key "Dash at point")
   "hD" '(dash-at-point-with-docset :which-key "Dash with docset")
   ;; Internet
   "ii" '(eww :which-key "Emacs Web Wowser")
   "ib" '(eww-list-bookmarks :which-key "Eww bookmarks")
   "il" '(eww-browse-url :which-key "Eww link")
   ))



(provide 'init-general)



(provide 'init-general)
