(require 'erc-services)
(require 'erc-join)
(require 'erc-image)

(load "~/.ercpass")

(defun do-notify (nickname message)
  (with-temp-buffer
    (shell-command (format "notify-send '%s: %s' -t 5000" nickname message) t)))

(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 22)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "MODE"))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE"))
(add-to-list 'erc-modules 'image)
(erc-update-modules)

(erc-services-enable)
(erc-autojoin-enable)

(setq erc-autojoin-channels-alist
      '(("thoughtbot" "#general")
        ("freenode.net" "#thoughtbot" "#emacs")))

(setq erc-keywords '("\\NYC\\b"
                     "\\nyc\\b"
                     "\\pr\\b"
                     "\\PR\\b"
                     "\\:statue_of_liberty:\\b"
                     "\\corgi\\b"))

(setq ercn-notify-rules
      '((current-nick . all)
        (keyword . all)))

(add-hook 'ercn-notify 'do-notify)

(defun tabfugnic/erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (cond
    ((get-buffer "irc.freenode.net:6667")
     (erc-track-switch-buffer 1))
    (t
     (erc-ssl :server "irc.freenode.net" :port 6667 :nick "tabfugnic" :password freenode-password)
     (erc-ssl :server "thoughtbot.irc.slack.com" :port 6667 :nick "eric" :password slack-thoughtbot)
     (erc-ssl :server "skilledup.irc.slack.com" :port 6667 :nick "eric" :password slack-skilledup)
     )))
