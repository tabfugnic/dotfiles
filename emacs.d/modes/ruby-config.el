;; rspec mode
(add-hook 'haml-mode-hook (lambda() (rspec-mode 1)))
(add-hook 'html-mode-hook (lambda() (rspec-mode 1)))
(setq auto-mode-alist (cons '("\\.erb$" . rspec-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.haml$" . rspec-mode) auto-mode-alist))

;; ruby mode
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Guardfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))

;; RVM
(rvm-use-default)
(add-hook 'ruby-mode-hook (lambda () (rvm-activate-corresponding-ruby)))

;; Ruby end
(require 'ruby-end)


(defun rspec-toggle-spec-target-in-new-buffer
  (interactive)
  (split-window-right-and-move)
  (rspec-toggle-spec-and-target))
