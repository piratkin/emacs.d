;;; Add the "rc/*" directory to the load path
(push "~/.dotmacs.d/rc" load-path)

(load "~/.dotmacs.d/rc/init-theme.el")
(load "~/.dotmacs.d/rc/init-evil.el")
(load "~/.dotmacs.d/rc/init-auto-compile.el")
(load "~/.dotmacs.d/rc/init-markdown.el")
(load "~/.dotmacs.d/rc/init-which-key.el")
(load "~/.dotmacs.d/rc/init-projectile.el")
;(load "~/.dotmacs.d/rc/init-doom-modeline.el")

(provide 'rconf)
