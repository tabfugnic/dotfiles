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
