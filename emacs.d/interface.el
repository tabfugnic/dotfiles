;; general cleanup
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Color theme
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-classic)

;; Lines
(global-hl-line-mode t)
(global-linum-mode t)
(set-face-foreground 'highlight nil)
(set-face-background 'hl-line "#4682b4" )
