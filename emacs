;; start server for fast startups
(server-start)

(require 'dired-x)

(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/" )

             (add-to-list 'load-path "~/.emacs.d/snippets")
(require 'yasnippet)
(yas-global-mode 1)

(add-hook 'after-init-hook #'global-flycheck-mode)

(load "interface.el")
(load "settings.el")
(load "key-bindings.el")

(load "modes.el")


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))
