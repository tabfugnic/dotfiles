;; -*- mode: emacs-lisp -*-

;; start server for fast startups
(server-start)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package, so I can use it to manage everything else
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(eval-when-compile (require 'use-package))

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
  :init
  (progn
    (require 'helm-config)
    ;; (setq helm-M-x-fuzzy-match t)
    ;; (setq helm-ag-fuzzy-match t)
    (helm-mode)))

(require 'dired-x)

(add-to-list 'load-path "~/.emacs.d/lisp" )
(add-to-list 'load-path "~/.emacs.d/configs/")

(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; mode-specific configuration

(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/lisp/" nil ".el"))

(mapcar (lambda (mode-file-name) (load mode-file-name))
        (directory-files "~/.emacs.d/configs/" nil ".el"))

;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))
; (put 'downcase-region 'disabled nil)
