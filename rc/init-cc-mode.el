(use-package cc-mode
  :ensure t
  :config
  ;;; Indent settings
  (setq-default indent-tabs-mode nil) ;;disable the ability to indent TAB
  (setq-default tab-width 4) ;;tab width - 4 whitespace
  (setq-default standart-indent 4) ;;standard width of indent - 4 white-space
  (setq-default c-basic-offset 4)
  ;;; Spacing between lines
  ;; (setq-default line-spacing 0.1)
  ;;; Available C style:
  ;; "gnu": The default style for GNU projects
  ;; "k&r": What Kernighan and Ritchie, the authors of C used in their book
  ;; "bsd": What BSD developers use, aka "Allman style" after Eric Allman.
  ;; "whitesmith": Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
  ;; "stroustrup": What Stroustrup, the author of C++ used in his book
  ;; "ellemtel": Popular C++ coding standards as defined by "Programming in C++, Rules and Recommendations," Erik Nyquist and Mats Henricson, Ellemtel
  ;; "linux": What the Linux developers use for kernel development
  ;; "python": What Python developers use for extension modules
  ;; "java": The default style for java-mode (see below)
  ;; "user": When you want to define your own style
  (setq c-default-style "stroustrup") ;; set style to "linux"
  (setq gdb-many-windows t ;; use gdb-many-windows by default
        gdb-show-main t))


(provide 'init-cc-mode)
