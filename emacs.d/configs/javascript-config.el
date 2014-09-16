;; javascript mode
(autoload 'javascript-mode "javascript-mode" "Javascript editing mode." t)
(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))
(setq js-indent-level 2)
