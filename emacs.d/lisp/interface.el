;; general cleanup
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Lines
(global-hl-line-mode t)
(global-linum-mode t)

(set-default-font "-*-DejaVu Sans Mono-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")

(use-package whitespace
  :init
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail))
  (add-hook 'prog-mode-hook 'whitespace-mode))
