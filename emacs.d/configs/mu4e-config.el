(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(require 'mu4e)
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
    (goto-char (point-min))))
