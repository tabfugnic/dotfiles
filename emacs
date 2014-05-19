;; start server for fast startups
(server-start)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(require 'dired-x)

(add-to-list 'load-path "~/.emacs.d/" )
(add-to-list 'load-path "~/.emacs.d/erc/")
(add-to-list 'load-path "~/.emacs.d/modes/")

(add-hook 'after-init-hook #'global-flycheck-mode)

(load "interface.el")
(load "settings.el")
(load "key-bindings.el")
(load "org-settings.el")

;; mode-specific configuration

(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/modes/" nil ".el"))

;; erc-specific configuration
(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/erc/" nil ".el"))

;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))
