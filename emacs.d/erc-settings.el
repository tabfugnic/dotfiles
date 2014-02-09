;; (add-to-list 'erc-modules 'notifications)
(load "~/.ercpass" )
(require 'erc-services)
(require 'erc-join)

(erc-services-mode 1)

(erc-autojoin-enable)
(setq erc-autojoin-timing :ident)

(setq erc-autojoin-channels-alist
      '(("thoughtbot" "#everyone" "#code")
        ("schoolkeepinc" "#thought_bot_school_keep")))

(erc :server "thoughtbot" :port 6668 :nick "eric_collins" :password campfire-thoughtbot)
(erc :server "schoolkeepinc" :port 6668 :nick "eric" :password campfire-schoolkeepinc)
