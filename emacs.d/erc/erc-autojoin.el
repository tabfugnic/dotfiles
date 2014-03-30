(require 'erc-services)
(require 'erc-join)

(load "~/.ercpass" )

(setq erc-prompt-for-nickserv-password nil)

(erc-services-mode 1)
(erc-autojoin-enable)
(erc-autojoin-mode t)

(setq erc-autojoin-channels-alist
      '(("thoughtbot.net" "#everyone" "#code", "#learn")
        ("freenode.net" "#thoughtbot" "#emacs")))

(erc :server "irc.thoughtbot.net" :port 6668 :nick "eric_collins" :password campfire-thoughtbot)
(erc :server "irc.freenode.net" :port 6667 :nick "tabfugnic" :password freenode-password)
