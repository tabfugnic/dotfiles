;; (add-to-list 'erc-modules 'notifications)
(load "~/.ercpass" )
(require 'erc-services)
(require 'erc-join)

(erc-services-mode 1)

(erc-autojoin-enable)
(erc-autojoin-mode t)

(setq erc-prompt-for-nickserv-password nil)

(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 22)

(setq erc-autojoin-channels-alist
      '(("thoughtbot.net" "#everyone" "#code", "#learn")
        ("freenode.net" "#thoughtbot" "#emacs")))

(erc :server "irc.thoughtbot.net" :port 6668 :nick "eric_collins" :password campfire-thoughtbot)
(erc :server "irc.freenode.net" :port 6667 :nick "tabfugnic" :password freenode-password)

(require 'erc-image)
(add-to-list 'erc-modules 'image)

(erc-update-modules)

(setq erc-pals '("\\.*\\b"))

(setq erc-keywords '("\\NYC\\b"
                     "\\:statue_of_liberty:\\b"
                     "\\corgi\\b"))

(setq ercn-notify-rules
      '((current-nick . all)
        (keyword . all)
        (pal . ("#thought_bot_school_keep" "#code"))))

(defun do-notify (nickname message)
  (with-temp-buffer
    (shell-command (format "notify-send '%s: %s' -t 5000" nickname message) t)))

(add-hook 'ercn-notify 'do-notify)
