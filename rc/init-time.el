(use-package time                       ; Show current time
  :bind (("C-c a c" . display-time-world))
  :config
    ;; (display-time-mode t)
  (setq display-time-world-time-format "%H:%M, %d. %b -  %Z"
        display-time-24hr-format t
        display-time-world-list '(("America/New_York" "New York (USA)")
                                  ;; ("Europe/London" "London")
                                  ;; ("Europe/Berlin" "Berlin")
                                  ("Europe/Warsaw"    "Poland")
                                  ("Europe/Minsk"     "Belarus")
                                  ("Europe/Moscow"    "Russia")
                                  ("Asia/Shanghai"    "China"))))
