(require 'erc-services)
(require 'erc-join)

(load "~/.ercpass")

(setq erc-prompt-for-nickserv-password nil)

(erc-services-enable)
(erc-autojoin-enable)

(setq erc-autojoin-channels-alist
      '(("thoughtbot" "#general")
        ("freenode.net" "#thoughtbot" "#emacs")))

(erc :server "irc.freenode.net" :port 6667 :nick "tabfugnic" :password freenode-password )
(erc-ssl :server "thoughtbot.irc.slack.com" :port 6667 :nick "eric" :password slack-thoughtbot)
(erc-ssl :server "skilledup.irc.slack.com" :port 6667 :nick "eric" :password slack-skilledup)
