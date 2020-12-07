(use-package windmove
  :ensure t)

(defun rc:window-move-far-right () (interactive) (rc:window-far-move 'right))
(defun rc:window-move-far-left () (interactive) (rc:window-far-move 'left))
(defun rc:window-move-very-top () (interactive) (rc:window-far-move 'up))
(defun rc:window-move-very-bottom () (interactive) (rc:window-far-move 'down))
(defun rc:window-far-move (dir &optional arg window)
  "Moves the cursor to the window located near the border of the frame.
   the `dir ' function argument sets the direction of movement and can
   take the values ` 'right', ' left`,' up `and'down'. Argument
   the `window ' function sets the window relative to which events occur movings."
  (let ((other-window (windmove-find-other-window dir arg window)))
    (if (or (null other-window)
            (and (window-minibuffer-p other-window)
                 (not (minibuffer-window-active-p other-window))))
        (if window
            (select-window window)
          (user-error "No window %s from selected window" dir))
      (rc:window-far-move dir arg other-window))))


(provide 'init-windmove)
