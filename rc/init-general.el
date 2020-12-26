(use-package general
  :ensure t
  ;; :after (which-key)
  :config
  ;; (define-key evil-motion-state-map " " nil)
  (general-evil-setup t)

   ;; (general-define-key
   ;; ;; :states '(emacs normal)
   ;; :prefix "SPC"
   ;; :keymaps 'gdb-keys-mode-map
   ;; F8    Create watcher
   ;; (define-key map (kbd    "<f8>") #'gdb-watcher-add)
   ;; C-F8  Evaluate expression once
   ;; F12   Switch buffer or pop to frame
   ;; S-F5  Kill inferior
   ;; (define-key map (kbd  "<S-f5>") #'gdb-kill)
   ;; (define-key map (kbd  "<C-f8>") #'gdb-eval-expression)
   ;; (define-key map (kbd "<M-f10>") #'gdb-next-instruction)
   ;; (define-key map (kbd "<M-f11>") #'gdb-step-instruction)
   ;; (define-key map (kbd   "<f12>") #'gdb-switch-buffer/body)
   ;; )

  ;; (general-define-key
  ;;  :states '(normal)
  ;;  ;; :keymaps evil-visual-state-map
  ;;  "*" '(evil-visualstar/begin-search-forward :which-key "Search forward")
  ;;  "#" '(evil-visualstar/begin-search-backward :which-key "Search backward"))

  ;; (general-define-key
  ;;  :states '(normal)
  ;;  :keymaps 'company-active-map
  ;;  "TAB"     '(company-complete :which-key "Complete")
  ;;  [return]  '(company-complete-selection :which-key "Complete selection")
  ;;  [backtab] '(company-complete-common :which-key "Complete common"))

  (general-define-key
   :states '(normal)
   ;; Dont override
   "-" '(dired-jump :which-key "revert")
   "TAB" '(evil-toggle-fold :which-key "Fold/Unfold")
   "u" '(undo-tree-undo :which-key "Undo")
   "U" '(undo-tree-redo :which-key "Redo"))

  ;; (general-define-key
  ;;  :keymaps '(company-mode-map)
  ;;  ;; "M-SPC" '(company-complete-selection :which-key "Company popup")
  ;;  "<return>" '(company-complete :which-key "Complete selection"))

  (general-define-key
   :keymaps '(company-active-map)
   [return] '(company-complete-selection :which-key "Complete selection")
   "<right>" '(company-complete-common :which-key "Complete common"))

  (general-define-key
   :states '(visual)
   :keymaps 'override
   "*" '(evil-visualstar/begin-search-forward :which-key "Search forward")
   "#" '(evil-visualstar/begin-search-backward :which-key "Search backward"))

  (general-define-key
   :states '(normal emacs)
   :keymaps 'dired-mode-map
   "TAB" '(dired-subtree-toggle :which-key "Subtree toggle")
   "m" '(dired-toggle-marks :which-key "Mark/Unmark")
   ;; "g" '(revert-buffer :which-key "revert")
   "r" '(revert-buffer :which-key "revert")
   "<left>" '(dired-up-directory :which-key "Dired outside")
   "<right>" '(dired-find-alternate-file :which-key "Dired inside"))

  ;; Ентер должен дополнять, когда выбран пункт менюа иначе дополнять,
  ;; пробел, аналогично. должен прерывать ввод и вставлять пробел, возможно
  ;; подойдет функция

  (general-define-key
   ;; use global-map by default
   :keymaps 'override
   ;; "<escape>" '(keyboard-quit :which-key "Keyboard quit")
   "<escape>" '(evil-escape :which-key "Evil escape"))

  (general-define-key
   :states '(normal motion emacs)
   :keymaps 'override
   "C-f" '(describe-face :which-key "Describe face")
   "C-k" '(describe-key-briefly :which-key "Describe key")
   ";" '(helm-M-x :which-key "M-x")
   ":" '(evil-ex :which-key "Evil ex:")
   "H" '(evil-join :which-key "Join")
   "\M-h" '(evil-join-whitespace :which-key "Glue")
   "<S-return>" '(default-indent-new-line :which-key "Newline")
   ;; Degug
   "M-j" '(gud-next :which-key "Gud next")
   "M-l" '(gud-step :which-key "Gud step")
   "M-k" '(gud-finish :which-key "Step out")
   "M-h" '(gud-cont :which-key "Gud continue")
   "M-p" '(gud-print :which-key "Gud print")
   "K" '(evil-scroll-up t :which-key "Half a page up")
   "J" '(evil-scroll-down t :which-key "Half a page down"))

  (general-define-key
   :states '(normal)
   :prefix "g"
   :keymaps 'override
   "f" '(rc:find-file-at-point-with-line :which-key "Find file witn line")
   "d" '(rc:goto-definiton-dwim :which-key "Goto dwim")
   "r" '(rc:find-tag-reference :which-key "Goto reference")
   ;; "v" '(better-jumper-jump-backward :which-key "Jump backward")
   ;; "b" '(better-jumper-jump-forward :which-key "Jump forward")
   ;; "v" '(evil-jump-backward-swap :which-key "Jump backward")
   "v" '(evil-jump-backward :which-key "Jump backward")
   "b" '(evil-jump-forward :which-key "Jump forward")
   "V" '(helm-all-mark-rings :which-key "All mark rings"))

  (general-define-key
   :states '(normal visual emacs)
   :prefix "SPC"
   :keymaps 'override
   ;; General
   ;; "TAB" '(counsel-buffer-or-recentf :which-key "Recent Buffer")
   "TAB" '(helm-recentf :which-key "Recent Buffer")
   ;; "f" '(:ignore t :which-key "Files")
   ;; "b" '(:ignore t :which-key "Buffers")
   ;; "d" '(:ignore t :which-key "Dired")
   "g" '(:ignore t :which-key "Git")
   "T" '(:ignore t :which-key "Terminal")
   "e" '(:ignore t :which-key "Edit")
   "i" '(:ignore t :which-key "Imenu")
   "w" '(:ignore t :which-key "Window")
   "W" '(evil-window-map :which-key "Window key map")
   ;; "s" '(:ignore t :which-key "Search")
   "x" '(:ignore t :which-key "System")
   "a" '(:ignore t :which-key "Additionally")
   "I" '(:ignore t :which-key "Help")
   ";" '(helm-M-x :which-key "M-x")
   "o" '(helm-find-files :which-key "Open")
   "O" '(helm-locate :which-key "Locate")
   "q" '(kill-this-buffer :which-key "Buffer kill")
   "Q" '(evil-window-delete :which-key "Window kill")
   "s" '(rc:save-buffer :which-key "Save buffer")
   "S" '(save-some-buffers :which-key "Save all")
   "r" '(rc:rename-current-buffer-file :which-key "Rename file")
   "z" '(zoom-window-zoom :which-key "Zoom current buffer")
   "b" '(switch-to-buffer :which-key "Switch buffer")
   "t" '(multi-vterm-dedicated-toggle :which-key "VTerm toggle")
   ;; "f" '(ace-jump-char-mode :which-key "Jump to char")
;   "F" '(swiper :which-key "Swiper")
   "F" '(helm-occur :which-key "Swiper")
   "f" '(avy-goto-subword-1 :which-key "Jump to char")
   ;; Window
   "ww" '(ace-window :which-key "Jump to Window")
   "wo" '(delete-other-windows :which-key "Kill other window")
   ;; "i" '(counsel-semantic-or-imenu t :which-key "Imenu")
   "ii" '(helm-imenu :which-key "Imenu")
   "ia" '(helm-imenu-in-all-buffers :which-key "Imenu in all buffers")
   ;; "H" '(windmove-swap-states-left :which-key "Swap window left")
   ;; "J" '(windmove-swap-states-down :which-key "Swap window bottom")
   ;; "K" '(windmove-swap-states-up :which-key "Swap window top")
   ;; "L" '(windmove-swap-states-right :which-key "Swap window right")
   ;; "h" '(windmove-left :which-key "Move left window")
   "H" '(windswap-left :which-key "Swap window left")
   "J" '(windswap-down :which-key "Swap window bottom")
   "K" '(windswap-up :which-key "Swap window top")
   "L" '(windswap-right :which-key "Swap window right")
   "h" '(windmove-left :which-key "Move left window")
   "h" '(windmove-left :which-key "Move left window")
   "j" '(windmove-down :which-key "Move bottom window")
   "k" '(windmove-up :which-key "Move top window")
   "l" '(windmove-right :which-key "Move right window")
   "v" '(evil-window-vsplit :which-key "Window vsplit")
   "V" '(evil-window-split :which-key "Window split")
   ;; "SPC h" '(evil-window-move-far-left :which-key "Move far left")
   ;; "SPC l" '(evil-window-move-far-right :which-key "Move far right")
   ;; "SPC j" '(evil-window-move-very-bottom :which-key "Move far bottom")
   ;; "SPC k" '(evil-window-move-very-top :which-key "Move far top")
   "SPC h" '(rc:window-move-far-left :which-key "Move far left")
   "SPC l" '(rc:window-move-far-right :which-key "Move far right")
   "SPC j" '(rc:window-move-very-bottom :which-key "Move far bottom")
   "SPC k" '(rc:window-move-very-top :which-key "Move far top")
   "SPC H" '(evil-window-move-far-left :which-key "Move far left")
   "SPC L" '(evil-window-move-far-right :which-key "Move far right")
   "SPC J" '(evil-window-move-very-bottom :which-key "Move far bottom")
   "SPC K" '(evil-window-move-very-top :which-key "Move far top")
   ;; Files
   ;; "ff" '(counsel-find-file :which-key "Find file")
   ;; Buffers
   ;; "bx" '(eval-buffer :which-key "Buffer execute")
   ;; Dired
   ;; Debug
   "dx" '(gdb :which-key "Debug gdb-mi")
   "dX" '(gud-gdb :which-key "Debug gud")
   "dn" '(gud-next :which-key "Gud next")
   "ds" '(gud-step :which-key "Gud step")
   "df" '(gud-finish :which-key "Gud finish")
   "dB" '(gud-break :which-key "Gud break")
   "db" '(gud-tbreak :which-key "Gud tbreak")
   "dd" '(gud-remove :which-key "Gud unbreak")
   "dD" '(gud-remove :which-key "Gud unbreak all")
   "dc" '(gud-cont :which-key "Gud continue")
   "dr" '(gud-run :which-key "Gud run")
   "du" '(gud-until :which-key "Gud until")
   "d," '(gud-up :which-key "Gud up stack")
   "d." '(gud-down :which-key "Gud down stack")
   "dp" '(gud-print :which-key "Gud print")
   "dP" '(gud-pstar :which-key "gud-pstar")
   "da" '(gud-call :which-key "gud-call")
   "dw" '(gud-watch :which-key "Gud watch")
   "di" '(gdb-io-interrupt :which-key "gdb-io-interrupt")
   "de" '(gdb-io-stop :which-key "gdb-io-stop")
   "dq" '(gdb-io-quit :which-key "gdb-io-quit")
   "dvi" '(gdb-display-io-buffer :which-key "gdb-display-io-buffer")
   "dvI" '(gdb-frame-io-buffer :which-key "gdb-frame-io-buffer")
   "dvb" '(gdb-display-breakpoints-buffer :which-key "gdb-display-breakpoints-buffer")
   "dvB" '(gdb-frame-breakpoints-buffer :which-key "gdb-frame-breakpoints-buffer")
   "dvd" '(gdb-delete-frame-or-window :which-key "gdb-delete-frame-or-window")
   "dvt" '(gdb-display-threads-buffer :which-key "gdb-display-threads-buffer")
   "dvT" '(gdb-frame-threads-buffer :which-key "gdb-frame-threads-buffer")
   "dvm" '(gdb-display-memory-buffer :which-key "gdb-display-memory-buffer")
   "dvM" '(gdb-frame-memory-buffer :which-key "gdb-frame-memory-buffer")
   "dvs" '(gdb-display-stack-buffer :which-key "gdb-display-stack-buffer")
   "dvs" '(gdb-frame-stack-buffer :which-key "gdb-frame-stack-buffer")
   "dvl" '(gdb-display-locals-buffer :which-key "gdb-display-locals-buffer")
   "dvL" '(gdb-frame-locals-buffer :which-key "gdb-frame-locals-buffer")
   "dvr" '(gdb-display-registers-buffer :which-key "gdb-display-registers-buffer")
   "dvR" '(gdb-frame-registers-buffer :which-key "gdb-frame-registers-buffer")
   "dvg" '(gdb-display-gdb-buffer :which-key "gdb-display-gdb-buffer")
   "dvG" '(gdb-frame-gdb-buffer :which-key "gdb-frame-gdb-buffer")

   ;; "d+" '(gud-up :which-key "gud up")
   ;; "d-" '(gud-down :which-key "gud down")

   ;; "dl" '(gud-until :which-key "Run until cursor")
   ;; "dL" '(gud-advance :which-key "Advance to cursor")
   ;; "ds" '(gud-stop :which-key "Stop")
   ;; "dx" '(gud-executable :which-key "GDB exec")
   ;; "dX" '(gud-create-session :which-key "GDB session")
   ;; "dq" '(gud-kill-session :which-key "GDB kill")

   ;; "dn" '(gdb-next :which-key "Step over")
   ;; "di" '(gdb-step :which-key "Step into")
   ;; "do" '(gdb-finish :which-key "Step out")
   ;; "db" '(gdb-toggle-breakpoint :which-key "Toggle breakpoint")
   ;; "dr" '(gdb-run-or-continue :which-key "Run or continue")
   ;; "dm" '(gdb-start :which-key "(Re)Start and break at main")
   ;; "dl" '(gdb-until :which-key "Run until cursor")
   ;; "dL" '(gdb-advance :which-key "Advance to cursor")
   ;; "ds" '(gdb-stop :which-key "Stop")
   ;; "dx" '(gdb-executable :which-key "GDB exec")
   ;; "dX" '(gdb-create-session :which-key "GDB session")
   ;; "dq" '(gdb-kill-session :which-key "GDB kill")
   ;; Git
   "gh" '(git-timemachine :which-key "Git history")
   "gf" '(counsel-git :which-key "Find in git dir")
   ;; "gm" '(git-timemachine-mode-map :which-key "Git history")
   "gs" '(magit-status :which-key "Magit status")
   "gi" '(magit-init :which-key "Magit init")
   "gd" '(magit-pull :which-key "Magit pull")
   "gu" '(magit-push :which-key "Magit push")
   "gc" '(magit-commit :which-key "Magit commit")
   "gb" '(magit-branch :which-key "Magit branch")
   "gm" '(magit-merge :which-key "Magit merge")
   ;; Terminal
   "Tm" '(multi-vterm :which-key "Multi VTerm")
   "Tv" '(vterm :which-key "VTerm")
   "Ts" '(shell :which-key "Shell")
   "Te" '(eshell :which-key "Emacs Lisp Shell")
   "Ta" '(ansi-term :which-key "ANSI Term")
   ;; Edit
   "ea" '(mark-whole-buffer :which-key "Select All")
   "eu" '(undo-tree-visualize :which-key "Undo-tree view")
   ;; "ec" '(flyspell-correct-wrapper :which-key "Spell correct")
   "ec" '(flyspell-correct-at-point :which-key "Spell correct")
   "es" '(auto-sudoedit-sudoedit :which-key "Sudo edit")
   "ei" '(symbol-overlay-put :which-key "Symbol put")
   "eI" '(symbol-overlay-remove-all :which-key "Symbol remove all")
   "eH" '(hs-hide-all :which-key "Collapse")
   "eh" '(hs-show-all :which-key "Expand")
   "ex" '(eval-buffer :which-key "Eval buffer")
   ;; TODO: Опасные команд, надо понять что с ними делать
   ;; во время редактирования буфера с сообщение о комите
   ;; можно отменить или отправить сообщение для коммита.
   ;; Лучше их привязать к самому буфферу с комитом
   ;; "eq" '(with-editor-cancel :which-key "Editor cancel")
   ;; "ef" '(with-editor-finish :which-key "Editor finish")
   "er" '(revert-buffer :which-key "Revert buffer")
   ;; "ey" '(:ignore t :which-key "Yasnippet")
   ;; "eyy" '(company-yasnippet :which-key "Yasnippet")
   ;; "eyi" '(yas-insert-snippet :which-key "Yasnippet insert")
   ;; "eyf" '(yas-visit-snippet-file :which-key "Yasnippet visit")
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
   "xB" '(bug-hunter-init-file :which-key "Bug hunter init.el")
   ;; Additionally
   ;; "aa" '(counsel-M-x :which-key "M-x")
   ;; "aa" '(rc:tags-create-or-update :which-key "Generate TAGS")
   ;; "aa" '(ctags-update :which-key "Generate TAGS")
   ;; "aa" '(counsel-gtags-create-tags :which-key "Generate TAGS")
   ;; "aa" '(helm-gtags-create-tags :which-key "Generate TAGS")
   "aa" '(rc:create-or-update-tags :which-key "Create TAGS")
   "a+" '(text-scale-increase :which-key "Zoom (+)")
   "a-" '(text-scale-decrease :which-key "Zoom (-)")
   "a=" '(text-scale-adjust :which-key "Zoom (=)")
   "at" '(display-time-world :which-key "World time")
   "ac" '(counsel-world-clock :which-key "World clock")
   "ag" '(google-translate-smooth-translate :which-key "Google Translate")
   "ab" '(google-translate-buffer :which-key "Buffer translate")
   "aG" '(google-this :which-key "Google search")
   "ar" '(google-this-cpp-reference :which-key "Google on GitHub.com")
   "ap" '(list-colors-display :which-key "Color Palette")
   "af" '(counsel-faces :which-key "Counsel Faces")
   "al" '(counsel-locate :which-key "Locate file")
   "aL" '(counsel-find-library :which-key "Locate lib")
   "aU" '(auto-package-update-now :which-key "Update packages")

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

;; --------------------------------------------------------

;; (defun rc:create-or-update-tags ()     (interactive nil))
;; (defun rc:find-tag-reference ()        (interactive nil))
;; (defun rc:goto-definiton-dwim ()       (interactive nil))
;; (defun rc:find-file-at-point-lineno () (interactive nil))
;; (defun rc:save-buffer () (interactive (save-buffer)))

;; --------------------------------------------------------

(defun rc:find-file-at-point-with-line()
  "if file has an attached line num goto that line, ie boom.rb:12"
  (interactive)
  (setq line-num 0)
  (save-excursion
    (search-forward-regexp "[^ ]:" (point-max) t)
    (if (looking-at "[0-9]+")
         (setq line-num (string-to-number (buffer-substring (match-beginning 0) (match-end 0))))))
  (find-file-at-point)
  (if (not (equal line-num 0))
      (goto-line line-num)))

;; (defun rc:company-ret-if-tooltip-invisible-or-complete-selection ()
;;   (interactive)
;;   (message "company-candidates-length %d" company-candidates-length)
;;   (if (and (not (company-tooltip-visible-p)) (= company-candidates-length 1))
;;       (call-interactively 'company-complete)
;;     (call-interactively 'evil-ret)))



(provide 'init-general)
