;; start server for fast startups
(server-start)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(require 'dired-x)

(add-to-list 'load-path "~/.emacs.d/lisp" )
(add-to-list 'load-path "~/.emacs.d/configs/")

(add-hook 'after-init-hook #'global-flycheck-mode)

;; mode-specific configuration

(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/lisp/" nil ".el"))

(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/configs/" nil ".el"))

;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))
(put 'downcase-region 'disabled nil)
