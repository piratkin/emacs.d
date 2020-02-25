(use-package dash
  :config
  (dash-enable-font-lock))

(use-package dash-at-point
  :ensure t
  :bind
  (:prefix "C-c h"
   :prefix-map dash-at-point-map
   :prefix-docstring "Dash map."
   ("h" . dash-at-point)
   ("d" . dash-at-point-with-docset)))



(provide 'init-dash)
