;; start server for fast startups
(server-start)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'dired-x)

(add-to-list 'load-path "~/.emacs.d/" )

(add-hook 'after-init-hook #'global-flycheck-mode)


(load "interface.el")
(load "settings.el")
(load "key-bindings.el")
(load "modes.el")
(load "org-settings.el")
(load "erc-settings.el")

;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))
