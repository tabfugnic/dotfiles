(add-hook 'git-commit-mode-hook 'git-commit-training-wheels-mode)

(eval-after-load 'magit
  '(progn
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
