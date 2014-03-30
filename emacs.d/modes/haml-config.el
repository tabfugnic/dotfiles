;; haml mode
(autoload 'haml-mode "haml-mode" "Haml editing mode." t)
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("haml" . haml-mode) interpreter-mode-alist))
