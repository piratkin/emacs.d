(use-package general
  :ensure t
  :after (which-key)
  :config
  ;; (define-key evil-motion-state-map " " nil)
  (general-evil-setup t)
  (general-define-key
   :states '(normal visual emacs)
   :prefix "SPC"
   :keymaps 'override
   ;; Main menu
   ;; "f" '(:ignore t :which-key "Files")
   ;; "b" '(:ignore t :which-key "Buffers")
   ;; "d" '(:ignore t :which-key "Dired")
   "g" '(:ignore t :which-key "Git")
   "T" '(:ignore t :which-key "Terminal")
   "e" '(:ignore t :which-key "Edit")
   ;; "s" '(:ignore t :which-key "Search")
   "x" '(:ignore t :which-key "System")
   "a" '(:ignore t :which-key "Additionally")
   "I" '(:ignore t :which-key "Help")
   "d" '(counsel-dired :which-key "Dired")
   "o" '(delete-other-windows :which-key "Kill other window")
   "q" '(kill-this-buffer :which-key "Buffer kill")
   "Q" '(evil-window-delete :which-key "Window kill")
   "s" '(save-buffer :which-key "Save buffer")
   "S" '(save-some-buffers :which-key "Save all")
   "r" '(rc:rename-current-buffer-file :which-key "Rename file")
   "z" '(zoom-window-zoom :which-key "Zoom current buffer")
   "b" '(ivy-switch-buffer :which-key "Switch buffer")
   "t" '(multi-vterm-dedicated-toggle :which-key "VTerm toggle")
   "f" '(ace-jump-char-mode :which-key "Jump to char")
   "F" '(swiper :which-key "Swiper")
   "w" '(ace-window :which-key "Jump to Windows")
   "m" '(counsel-semantic-or-imenu t :which-key "Imenu")
   ;; "I" '(:ignore t :which-key "Internet")
   ;; "H" '(evil-window-move-far-left :which-key "Window mv left")
   ;; "J" '(evil-window-move-very-bottom :which-key "Window mv bottom")
   ;; "K" '(evil-window-move-very-top :which-key "Window mv top")
   ;; "L" '(evil-window-move-far-right :which-key "Window mv right")
   "H" '(windswap-left :which-key "Window mv left")
   "J" '(windswap-down :which-key "Window mv bottom")
   "K" '(windswap-up :which-key "Window mv top")
   "L" '(windswap-right :which-key "Window mv right")
   "h" '(windmove-left :which-key "Window left")
   "j" '(windmove-down :which-key "Window bottom")
   "k" '(windmove-up :which-key "Window top")
   "l" '(windmove-right :which-key "Window right")
   "v" '(evil-window-vsplit :which-key "Window vsplit")
   "V" '(evil-window-split :which-key "Window split")
   ;; Generel
   "SPC" '(evil-window-map :which-key "Windows")
   "TAB" '(counsel-buffer-or-recentf :which-key "Recent Buffer")
   ;; Files
   ;; "ff" '(counsel-find-file :which-key "Find file")
   ;; Buffers
   ;; "bx" '(eval-buffer :which-key "Buffer execute")
   ;; "br" '(revert-buffer :which-key "Revert buffer")
   ;; Dired
   ;; Git
   "gh" '(git-timemachine :which-key "Git history")
   "gf" '(counsel-git :which-key "Find in git dir")
   ;; "gm" '(git-timemachine-mode-map :which-key "Git history")
   ;; Terminal
   "Tm" '(multi-vterm :which-key "Multi VTerm")
   "Tv" '(vterm :which-key "VTerm")
   "Ts" '(shell :which-key "Shell")
   "Te" '(eshell :which-key "Emacs Lisp Shell")
   "Ta" '(ansi-term :which-key "ANSI Term")
   ;; Edit
   "ea" '(mark-whole-buffer :which-key "Select All")
   "ee" '(company-yasnippet :which-key "Snippet")
   "eu" '(undo-tree-visualize :which-key "Undo-tree view")
   ;; "ec" '(flyspell-correct-wrapper :which-key "Spell correct")
   "ec" '(flyspell-correct-at-point :which-key "Spell correct")
   "es" '(auto-sudoedit-sudoedit :which-key "Sudo edit")
   "ey" '(yas-insert-snippet :which-key "Snippet insert")
   "eY" '(yas-visit-snippet-file :which-key "Snippet visit")
   "ei" '(symbol-overlay-put :which-key "Symbol put")
   "eI" '(symbol-overlay-remove-all :which-key "Symbol remove all")
   "eH" '(hs-hide-all :which-key "Collapse")
   "eh" '(hs-show-all :which-key "Expand")
   ;; Jump
   ;; "jj" '(ace-jump-char-mode :which-key "Jump to char")
   ;; "jw" '(ace-window :which-key "Jump to Windows")
   ;; "jW" '(ace-jump-word-mode :which-key "Jump to word")
   ;; "jl" '(ace-jump-line-mode :which-key "Jump to line")
   ;; "js" '(eassist-switch-h-cpp :which-key "Header\Source")
   ;; Search
   ;; "sd" '(dumb-jump-go :which-key "Jump to def")
   ;; "sD" '(dumb-jump-go-other-window :which-key "Jump def ext")
   ;; "sb" '(dumb-jump-back :which-key "Jump back")
   ;; "sp" '(dumb-jump-go-prompt :which-key "Jump to prompt")
   ;; "sS" '(rc:evil-gtags-goto-dwim :which-key "Locate lib")
   ;; System
   "xx" '(save-buffers-kill-emacs :which-key "Save & exit")
   "xr" '(restart-emacs :which-key "Restart")
   "xm" '(memory-usage :which-key "Memory usage")
   "xi" '(package-list-packages :which-key "Packages")
   "xp" '(rw-profiler-toggle :which-key "Toggle Profiler")
   "xP" '(profiler-report :which-key "Profiler report")
   "xd" '(toggle-debug-on-error :which-key "Debug on Error")
   "xD" '(toggle-debug-on-quit :which-key "Debug on Quit")
   "xb" '(bug-hunter-file :which-key "Bug hunter file")
   "xB" '(Bug-Hunter-Init-file :which-key "Bug hunter init")
   ;; Additionally
   ;; "aa" '(counsel-M-x :which-key "M-x")
   "aa" '(rc:tags-create-or-update :which-key "Generate TAGS")
   "a+" '(text-scale-increase :which-key "Zoom (+)")
   "a-" '(text-scale-decrease :which-key "Zoom (-)")
   "a=" '(text-scale-adjust :which-key "Zoom (=)")
   "at" '(display-time-world :which-key "World time")
   "ac" '(counsel-world-clock :which-key "World clock")
   "ag" '(google-translate-smooth-translate :which-key "Google Translate")
   "ab" '(google-translate-buffer :which-key "Buffer translate")
   "aG" '(google-this :which-key "Google search")
   "ap" '(list-colors-display :which-key "Color Palette")
   "af" '(counsel-faces :which-key "Counsel Faces")
   "al" '(counsel-locate :which-key "Locate file")
   "aL" '(counsel-find-library :which-key "Locate lib")
   ;; Help
   "Ih" '(help-command :which-key "Help")
   "Id" '(dash-at-point :which-key "Dash at point")
   "ID" '(dash-at-point-with-docset :which-key "Dash with docset")
   "Ik" '(describe-personal-keybindings :which-key "Describe bindings")
   "Im" '(describe-mode :which-key "Describe mode")
   ;; ;; Internet
   ;; "Ii" '(eww :which-key "Emacs Web Wowser")
   ;; "Ib" '(eww-list-bookmarks :which-key "Eww bookmarks")
   ;; "Il" '(eww-browse-url :which-key "Eww link")
   ))






(provide 'init-general)
