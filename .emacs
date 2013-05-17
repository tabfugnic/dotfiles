;; start server for fast startups
(server-start)

(require 'flymake)

;; add my local elisp folder
(setq load-path (cons "~/Documents/elisp" load-path))
(require 'scss-mode)

;;Folding-mode
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
;; (folding-add-to-marks-list 'scss-mode "//{"."//}" nil t)

;; autopair minor mode
(require 'autopair)
(autopair-global-mode) ;; enable in all buffers

;; Wrap Region minor mode
(require 'wrap-region)
(wrap-region-mode t)

;; php mode
(autoload 'php-mode "php-mode" "Php editing mode." t)
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.module$" . php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.install$" . php-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.inc$" . php-mode) auto-mode-alist))

(setq interpreter-mode-alist (cons '("php" . php-mode) interpreter-mode-alist))
(setq auto-mode-alist (cons '("\\.phtml$" . php-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("phtml" . php-mode) interpreter-mode-alist))

;; html mode
(setq auto-mode-alist (cons '("\\.html.erb$" . html-mode) auto-mode-alist))

;; javascript mode
(autoload 'javascript-mode "javascript-mode" "Javascript editing mode." t)
(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))
(setq js-indent-level 2)

;; rspec mode
(require 'rspec-mode)
(setq auto-mode-alist (cons '("\\.erb$" . rspec-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.haml$" . rspec-mode) auto-mode-alist))

;; ruby mode
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(require 'ruby-end)

;; scss mode
(autoload 'scss-mode "scss-mode" "Scss editing mode." t)
(setq auto-mode-alist (cons '("\\.scss$" . scss-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss.erb$" . scss-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("scss" . scss-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("scss.erb" . scss-mode) interpreter-mode-alist))

;; sass mode
(autoload 'sass-mode "sass-mode" "Sass editing mode." t)
(setq auto-mode-alist (cons '("\\.sass$" . sass-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("sass" . sass-mode) interpreter-mode-alist))

;; yaml mode
(autoload 'yaml-mode "yaml-mode" "Yaml editing mode." t)
(setq auto-mode-alist (cons '("\\.yml$" . yaml-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("yaml" . yaml-mode) interpreter-mode-alist))

;; haml mode
(autoload 'haml-mode "haml-mode" "Haml editing mode." t)
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("haml" . haml-mode) interpreter-mode-alist))
(require 'haml-mode)

;; coffee mode
(require 'coffee-mode)
(setq coffee-tab-width 2)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; feature mode - aka cucumber
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
(setq debug-on-error nil)               ; turn off debugger because of recursive edit annoyance

;; opens the development folder
(defun gitrep()
  (interactive "*")
  (find-file "~/dev"))

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)


;; Save browser
(defmacro defparameter (symbol &optional initvalue docstring)
  `(progn
     (defvar ,symbol nil ,docstring)
     (setq   ,symbol ,initvalue)))

(defparameter th-frame-config-register ?°
  "The register which is used for storing and restoring frame
configurations by `th-save-frame-configuration' and
`th-jump-to-register'.")


(defun th-save-frame-configuration (arg)
  "Stores the current frame configuration in register
`th-frame-config-register'. If a prefix argument is given, you
can choose which register to use."
  (interactive "P")
  (let ((register (if arg
                      (read-char "Which register? ")
                    th-frame-config-register)))
    (frame-configuration-to-register register)
    (message "Frame configuration saved in register '%c'."
             register)))

(defun th-jump-to-register (arg)
  "Jumps to register `th-frame-config-register'. If a prefix
argument is given, you can choose which register to jump to."
  (interactive "P")
  (let ((register (if arg
                      (read-char "Which register? ")
                    th-frame-config-register)))
    (jump-to-register register)
    (message "Jumped to register '%c'."
             register)))

(global-set-key "\C-ch" 'th-save-frame-configuration)
(global-set-key "\C-cj" 'th-jump-to-register)

;; bind hippie-expand
(global-set-key "\M- " 'hippie-expand)

;;remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;set aquamacs specific spots
(unless (boundp 'aquamac-version)
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file)
)


;; settings
;;(one-buffer-one-frame-mode 0)           ; turn off one buffer per frame
(scroll-bar-mode -1)                    ; turn off scroll bars
(menu-bar-mode 1)                       ; turn on menubar
(tool-bar-mode -1)                      ; turn on toolbar
(setq inhibit-startup-message t)        ; turn off startup screen
(setq visible-bell t)                   ; turn off the bell
(setq column-number-mode t)             ; number my columns for error handling
(setq-default truncate-lines t)         ; lines shouldn't wrap, just
                                        ; indicate continued lines
(setq
 make-backup-files         nil)         ; Don't want any backup files
(setq auto-save-list-file-name  nil)    ; Don't want any .saves files
(setq auto-save-default         nil)    ; Don't want any auto saving
(setq search-highlight           t)     ; Highlight search object
(setq query-replace-highlight    t)     ; Highlight query object
(setq mouse-sel-retain-highlight t)     ; Keep mouse high-lightening
(setq require-final-newline t)          ; last lines should end in a
                                        ; carriage return
(ido-mode nil)
(cua-mode nil)
(setq ido-max-directory-size 100000)
(put 'erase-buffer 'disabled nil)
