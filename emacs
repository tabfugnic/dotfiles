;; -*- mode: emacs-lisp -*-

(org-babel-load-file (concat user-emacs-directory "config.org"))

(use-package auto-compile
  :config (auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package evil
  :init
  (use-package linum-relative)
  (use-package evil-surround
    :config
    (global-evil-surround-mode 1))
  (setq evil-toggle-key "C-`")
  :config
  (evil-mode 1))

(use-package helm
  :bind ("M-x" . helm-M-x)
  :init
  (progn
    (require 'helm-config)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-ag-fuzzy-match t)
    (helm-mode)))

(require 'dired-x)

(add-to-list 'load-path "~/.emacs.d/configs/")

(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; mode-specific configuration

(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/configs/" nil ".el"))

;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))
; (put 'downcase-region 'disabled nil)
