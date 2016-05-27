(use-package android-mode
  :config
  (custom-set-variables '(android-mode-sdk-dir "~/opt/android")))

(electric-pair-mode 1)
(show-paren-mode 1)

(c-set-offset 'arglist-intro '+)

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package feature-mode
  :mode "\\.feature$")

(use-package emacs-eclim
  :config
  (global-eclim-mode))

(use-package emmet-mode
  :init
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

(use-package ggtags
  :config
  (add-hook 'ruby-mode-hook ( lambda() ( ggtags-mode 1 ))))

(use-package golden-ratio
  :init
  (setq golden-ratio-mode t)
  (setq golden-ratio-auto-scale t))

(use-package haskell-mode
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
  :bind
  (:map haskell-mode-map
        ("C-," . haskell-move-nested-left)
        ("C-." . haskell-move-nested-right)
        ("C-c C-c" . haskell-compile)))

;; html mode
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html\\.erb$" . web-mode)))

(defun tabfugnic/ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'tabfugnic/ido-define-keys)

;; coffee mode
(use-package coffee-mode
  :mode ("\\.coffee$" "Cakefile")
  :init
  (setq coffee-tab-width 2))

;; javascript mode
(use-package js2-mode
  :init
  (setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))
  (setq js-indent-level 2))

;; JSX mode
(use-package jsx-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
  (setq jsx-indent-level 2))


(use-package magit
  :bind ("C-x g" . magit-status))

;; Markdown mode
(use-package markdown-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :ensure f
  :bind ("C-x e" . mu4e)
  :config
  (use-package org-mu4e)
  (require 'org-mu4e)
  (setq mu4e-contexts
        `(,(make-mu4e-context
            :name "personal"
            :match-func (lambda (msg)
                          (when msg
                            (mu4e-message-contact-field-matches msg
                                                                :to "tabfugnic@gmail.com")))
            :enter-func '()
            :leave-func (lambda () (mu4e-clear-caches))
            :vars '((mu4e-maildir . "~/mail/personal")
                    (mu4e-mu-home . "~/.mu/personal")
                    (mu4e-get-mail-command . "offlineimap -a personal")
                    (user-mail-address . "tabfugnic@gmail.com")
                    (mu4e-compose-signature . (concat
                                               "Eric J. Collins\n"
                                               "Software Developer\n"
                                               "thoughtbot\n")
                                            )))
          ,(make-mu4e-context
            :name "thoughtbot"
            :match-func (lambda (msg)
                          (when msg
                            (mu4e-message-contact-field-matches msg
                                                                :to "eric@thoughtbot.com")))
            :enter-func '()
            :leave-func (lambda () (mu4e-clear-caches))
            :vars '((mu4e-maildir . "~/mail/thoughtbot")
                    (mu4e-mu-home . "~/.mu/thoughtbot")
                    (mu4e-get-mail-command . "offlineimap -a thoughtbot")
                    (user-mail-address . "eric@thoughtbot.com")
                    (mu4e-compose-signature . (concat
                                               "Eric J. Collins\n"
                                               "Software Developer\n"
                                               "thoughtbot\n")
                                            )))))

  (setq mu4e-drafts-folder "/drafts")
  (setq mu4e-sent-folder   "/sent")
  (setq mu4e-trash-folder  "/trash")
  (setq mu4e-refile-folder "/archive")
  (setq mu4e-sent-messages-behavior 'delete)

  (setq mu4e-maildir-shortcuts
        '( ("/INBOX"               . ?i)
           ("/sent"                . ?s)
           ("/trash"               . ?t)
           ("/archive"             . ?a)))

  (setq mu4e-html2text-command 'tabfugnic/html-message)

  ;; something about ourselves
  (setq user-full-name  "Eric J Collins")
  (setq mu4e-update-interval 180)

  (setq message-send-mail-function 'message-send-mail-with-sendmail)
  (setq sendmail-program "/usr/bin/msmtp")
  (setq message-sendmail-extra-arguments '("--read-envelope-from"))
  (setq message-sendmail-f-is-evil 't)

  (mu4e-alert-set-default-style 'libnotify)
  (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
  (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

  (add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime)

  (setq mu4e-alert-interesting-mail-query
        (concat
         "flag:unread"
         " AND NOT flag:trashed"
         " AND maildir:"
         "\"/INBOX\""))

  (setq org-mu4e-link-query-in-headers-mode nil)

  (add-hook 'mu4e-compose-mode-hook
            (defun my-setup-epa-hook ()
              (epa-mail-mode)))

  (add-hook 'mu4e-view-mode-hook
            (defun my-view-mode-hook ()
              (epa-mail-mode)))

  (defun tabfugnic/html-message ()
    (let ((dom (libxml-parse-html-region (point-min) (point-max))))
      (erase-buffer)
      (shr-insert-document dom)
      (goto-char (point-min)))))

(use-package org
  :init
  (require 'org-agenda)
  (setq org-directory "~/Dropbox/org/")

  (defun org-file (file)
    (concat org-directory file))

  (setq org-agenda-files (list (org-file "index.org")))

  (setq org-capture-templates
        '(("t" "TODO"
           entry
           (file (org-file "index.org"))
           "* TODO %?\n %u\n")
          ("v" "Travel"
           plain
           (file (org-file "travel.org"))
           "* %a\n %^G\n")
          ("i" "Idea"
           entry
           (file (org-file "ideas.org"))
           "* %?\n %u\n")
          ("c" "Configurations"
           entry
           (file (org-file "config.org"))
           "* %?\n")))

  (defun org-agenda-complete-and-archive ()
    (interactive)
    (org-agenda-todo 'done)
    (org-agenda-archive-default))

  (defun org-complete-and-archive ()
    (interactive)
    (org-todo 'done)
    (org-archive-default))

  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)
  (define-key org-agenda-mode-map (kbd "C-c f") 'org-agenda-complete-and-archive)
  (define-key org-mode-map (kbd "C-c f") 'org-complete-and-archive))


;; php mode
(use-package php-mode
  :init
  (setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.module$" . php-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.install$" . php-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.inc$" . php-mode) auto-mode-alist))

  (setq interpreter-mode-alist (cons '("php" . php-mode) interpreter-mode-alist))
  (setq auto-mode-alist (cons '("\\.phtml$" . php-mode) auto-mode-alist))
  (setq interpreter-mode-alist (cons '("phtml" . php-mode) interpreter-mode-alist)))

(use-package projectile
  :bind ("C-p" . projectile-find-file)
  :config
  (projectile-global-mode))

;; chruby
(use-package chruby
  :config
  (chruby "2.2.3"))

;; rspec mode
(use-package rspec-mode
  :init
  (add-hook 'haml-mode-hook (lambda() (rspec-mode )))
  (add-hook 'html-mode-hook (lambda() (rspec-mode )))
  (add-hook 'slim-mode-hook (lambda() (rspec-mode )))
  (add-hook 'web-mode-hook (lambda() (rspec-mode )))
  (add-hook 'coffee-mode-hook (lambda() (rspec-mode ))))

;; ruby mode
(use-package ruby-mode
  :init
  (setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("Guardfile" . ruby-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
  (setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist)))

;; Ruby end
(use-package ruby-end)

(defun rspec-toggle-spec-target-in-new-buffer
  (interactive)
  (split-window-right-and-move)
  (rspec-toggle-spec-and-target))


;; scss mode
(use-package scss-mode
  :init
  (setq auto-mode-alist (cons '("\\.scss$" . scss-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.scss.erb$" . scss-mode) auto-mode-alist))
  (setq interpreter-mode-alist (cons '("scss" . scss-mode) interpreter-mode-alist))
  (setq interpreter-mode-alist (cons '("scss.erb" . scss-mode) interpreter-mode-alist))
  (setq scss-compile-at-save nil)
  (setq css-indent-offset 2))

;; Wrap Region minor mode
(use-package wrap-region
  :config
  (wrap-region-mode t))

;; yaml mode
(use-package yaml-mode
  :init
  (setq auto-mode-alist (cons '("\\.yml$" . yaml-mode) auto-mode-alist))
  (setq interpreter-mode-alist (cons '("yaml" . yaml-mode) interpreter-mode-alist)))

(use-package yasnippet
  :config
  (yas-global-mode 1))


(use-package erc
  :bind ("C-c r" . tabfugnic/reset-erc-track-mode)
  :init

  (use-package erc-image
    :config
    (add-to-list 'erc-modules 'image))

  (setq erc-prompt-for-nickserv-password nil)
  (setq erc-fill-function 'erc-fill-static)
  (setq erc-fill-static-center 22)
  (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "MODE"))
  (setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE"))

  (setq erc-keywords '("\\NYC\\b"
                       "\\nyc\\b"
                       "\\pr\\b"
                       "\\PR\\b"
                       "\\:statue_of_liberty:\\b"
                       "\\corgi\\b"))

  (setq ercn-notify-rules
        '((current-nick . all)
          (keyword . all)))

  (add-hook 'ercn-notify 'tabfugnic/do-notify)

  :config
  (erc-update-modules)

  (require 'erc-join)
  (setq erc-autojoin-channels-alist
        '(("thoughtbot" "#general")
          ("freenode.net" "#thoughtbot" "#emacs")))
  (erc-autojoin-enable))

(defun tabfugnic/erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (cond
    ((get-buffer "irc.freenode.net:6667")
     (erc-track-switch-buffer 1))
    (t
     (erc :server "irc.freenode.net" :port 6667 :nick "tabfugnic")
     (erc-ssl :server "thoughtbot.irc.slack.com" :port 6667 :nick "eric")
     )))

(defun tabfugnic/reset-erc-track-mode ()
  (interactive)
  (setq erc-modified-channels-alist nil)
  (erc-modified-channels-display))

(defun tabfugnic/do-notify (nickname message)
  (with-temp-buffer
    (shell-command (format "notify-send '%s: %s' -t 5000" nickname message) t)))
