(setq erc-keywords '("\\NYC\\b"
                     "\\nyc\\b"
                     "\\:statue_of_liberty:\\b"
                     "\\corgi\\b"))

(setq ercn-notify-rules
      '((current-nick . all)
        (keyword . all)))

(defun do-notify (nickname message)
  (with-temp-buffer
    (shell-command (format "notify-send '%s: %s' -t 5000" nickname message) t)))

(add-hook 'ercn-notify 'do-notify)
