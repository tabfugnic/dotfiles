(require 'scss-mode)

;; autopair minor mode
(require 'autopair)
(autopair-global-mode) ;;; enable in all buffers


;; Wrap Region minor mode
(require 'wrap-region)
(wrap-region-mode t)

;; Blog mode
(require 'weblogger)
;;;(weblogger-config-alist (quote (("default" "http://tabfugnic.wordpress.com/xmlrpc.php" "tabfugnic@gmail.com" "" "11073946")))))

;; Android Mode
(setq android-mode-sdk-dir "~/opt/android/")
(require 'android-mode)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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
(add-hook 'haml-mode-hook (lambda() (rspec-mode 1)))
(add-hook 'html-mode-hook (lambda() (rspec-mode 1)))
;; (setq auto-mode-alist (cons '("\\.erb$" . rspec-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.haml$" . rspec-mode) auto-mode-alist))

;; ruby mode
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Guardfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(require 'ruby-end)

;; scss mode
(autoload 'scss-mode "scss-mode" "Scss editing mode." t)
(setq auto-mode-alist (cons '("\\.scss$" . scss-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss.erb$" . scss-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("scss" . scss-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("scss.erb" . scss-mode) interpreter-mode-alist))
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)
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

(setq debug-on-error nil) ; turn off debugger because of recursive edit annoyance

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

(move-text-default-bindings)

(setq efire-host "thoughtbot.campfirenow.com")

;; Yasnippets
(setq yas-snippet-dirs
      "~/.emacs.d/snippets" )

(yas-global-mode 1)
