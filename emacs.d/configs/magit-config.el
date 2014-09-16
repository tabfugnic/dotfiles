(eval-after-load 'magit
  '(progn
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
