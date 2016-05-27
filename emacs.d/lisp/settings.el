(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; indents
(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)

;; Search related
(setq query-replace-highlight    t)     ; Highlight query object
(setq mouse-sel-retain-highlight t)     ; Keep mouse high-lightening

(setq make-backup-files nil)
(setq auto-save-list-file-name  nil)
(setq auto-save-default nil)

;; ido mode!
(ido-mode t)
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode t))
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-max-directory-size 100000)
(setq ido-everywhere t)

;; buffer stuff
(put 'erase-buffer 'disabled nil)
(global-auto-revert-mode t)

;; No startup message
(setq inhibit-startup-message t)        ; turn off startup screen

;; visible bell
(setq visible-bell t)                   ; turn off the bell

;; CUA Rectangles only please
(setq cua-enable-cua-keys nil)
(cua-mode t)

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;;remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq require-final-newline t)

(setq-default dired-listing-switches "-alhv")

;; auto move cursor after split
(defun split-window-below-and-move()
  (interactive)
  (split-window-below)
  (other-window 1))

;; auto move cursor after split
(defun split-window-right-and-move()
  (interactive)
  (split-window-right)
  (other-window 1))

(global-set-key "\C-x2" 'split-window-below-and-move)

(global-set-key "\C-x3" 'split-window-right-and-move)

(global-subword-mode t)
