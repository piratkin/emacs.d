;; (message "script: %s" "sysconf.el")
;;; System hederfile path
(cond
 ((string-equal system-type "cygwin") ; Microsoft Windows
  (progn
    (message "Detected: Microsoft Windows")
    ;; (setq find-function-C-source-directory "~/Projects/emacs-25.1/src/")
    (setq sys:c-headers-path-system '(
        "/usr/include"
        "/usr/lib/clang/5.0.1/include"
        "/usr/include/w32api"
        "/usr/lib/gcc/x86_64-pc-cygwin/6.4.0/include"
        "/usr/lib/gcc/x86_64-pc-cygwin/6.4.0/include/c++"
        "/usr/lib/gcc/x86_64-pc-cygwin/6.4.0/include/c++/x86_64-pc-cygwin"
        "/usr/lib/gcc/x86_64-pc-cygwin/6.4.0/include/c++/backward"))))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Detected: Mac OS X")))
 ((string-equal system-type "gnu/linux") ; GNU/Linux
  (progn
    (message "Detected: GNU/Linux")
    (setenv "GTAGSLIBPATH"
            (concat "/usr/include:"
                    "/usr/local/include"))
    ;; (setq find-function-C-source-directory "~/Projects/emacs-25.1/src/")
    (setq sys:c-headers-path-system '(
        "/usr/include/c++/5"
        "/usr/include/x86_64-linux-gnu/c++/5"
        "/usr/include/c++/5/backward"
        "/usr/lib/gcc/x86_64-linux-gnu/5/include"
        "/usr/local/include"
        "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
        "/usr/include/x86_64-linux-gnu"
        "/usr/include"
        "/usr/lib/llvm-3.8/lib/clang/3.8.0/include")))))

;; Windows performance tweaks
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))

;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

(provide 'sysconf)
