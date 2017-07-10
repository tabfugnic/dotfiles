;;; -*- mode: emacs-lisp -*-
;;; emacs --- Eric's configuration
;; Author: Eric J. Collins

;; URL: https://github.com/tabfugnic/dotfiles/emacs

;;; Commentary:

;; My configuration for Emacs.  Simply created to open my config.org
;; file that is the rest of my configuration.

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(org-babel-load-file (concat user-emacs-directory "config.org"))

;;; emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/opt/android")
 '(package-selected-packages
   (quote
    (flycheck erc-image yaml-mode wrap-region scss-mode ruby-block ruby-end ruby-hash-syntax inf-ruby rspec-mode chruby php-mode mu4e-alert f move-text markdown-mode magithub magit rjsx-mode js2-mode coffee-mode json-mode slim-mode web-mode haskell-mode golden-ratio ggtags emmet-mode eclim feature-mode company android-mode java-imports auto-compile projectile helm-ag helm multiple-cursors ido-vertical-mode evil-surround linum-relative evil solarized-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
