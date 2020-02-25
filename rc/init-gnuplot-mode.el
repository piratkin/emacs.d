(use-package gnuplot-mode
  :ensure t
  ;; :defer t
  :mode ("\\.gp$" . gnuplot-mode)
  :commands gnuplot-mode gnuplot-make-buffer)



(provide 'init-gnuplot-mode)
