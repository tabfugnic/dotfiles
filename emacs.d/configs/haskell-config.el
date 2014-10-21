(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

(eval-after-load "which-func"
  '(add-to-list 'which-func-modes 'haskell-mode))
