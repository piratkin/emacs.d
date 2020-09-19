(use-package profiler
  :ensure t
  ;; :init
  ;; (evil-leader/set-key
  ;;   "ps" 'rw-profiler-toggle
  ;;   "pr" 'profiler-report)
  :commands (rw-profiler-toggle)
  :config
  (defun rw-profiler-toggle ()
    "Turn on/off profiler."
    (interactive)
    (if (not (profiler-running-p))
        (progn
          ;; (set-temp-cursor-color "chocolate1")
          (profiler-start 'cpu))
      (progn
        ;; (restore-cursor-color)
        (profiler-stop)))))



(provide 'init-profiler)
