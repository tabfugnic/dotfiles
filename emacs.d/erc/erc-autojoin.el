(require 'erc-services)
(require 'erc-join)

(load "~/.ercpass")

(setq erc-prompt-for-nickserv-password nil)

(erc-services-enable)
(erc-autojoin-enable)

(setq erc-nickserv-passwords
      `((freenode (("tabfugnic" . ,freenode-password)))))

(setq erc-autojoin-channels-alist
      '(("thoughtbot.net" "#everyone" "#code" "#learn")
        ("freenode.net" "#thoughtbot" "#emacs")))

(erc :server "irc.thoughtbot.net" :port 6668 :nick "eric_collins" :password campfire-thoughtbot )
(erc :server "irc.freenode.net" :port 6667 :nick "tabfugnic" )
