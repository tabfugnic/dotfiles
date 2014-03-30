;; scss mode
(autoload 'scss-mode "scss-mode" "Scss editing mode." t)
(setq auto-mode-alist (cons '("\\.scss$" . scss-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss.erb$" . scss-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("scss" . scss-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("scss.erb" . scss-mode) interpreter-mode-alist))
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

;; sass mode
(autoload 'sass-mode "sass-mode" "Sass editing mode." t)
(setq auto-mode-alist (cons '("\\.sass$" . sass-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("sass" . sass-mode) interpreter-mode-alist))
