;; general cleanup
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Color theme
;; (setq color-theme-is-global t)
;; (color-theme-initialize)
;; (color-theme-solarized-dark)

;; Lines
(global-hl-line-mode t)
(global-linum-mode t)

(defun tabfugnic/set-default-font ()
(set-default-font "-*-DejaVu Sans Mono-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1"))

(defun tabfugnic/highlight-long-lines-in-programming-modes ()
 (require 'whitespace)
 (setq whitespace-line-column 80)
 (setq whitespace-style '(face lines-tail))
 (add-hook 'prog-mode-hook 'whitespace-mode))

(tabfugnic/highlight-long-lines-in-programming-modes)
(tabfugnic/set-default-font)
