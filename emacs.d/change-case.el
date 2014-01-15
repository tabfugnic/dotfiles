;; Taken from a gist by Jim Weirich
;; https://gist.github.com/jimweirich/846928

;; ----------------------------------------------------------------------
;; camelcase-region Given a region of text in snake_case format,
;; changes it to camelCase.

(provide 'change-case)

(defun camelcase-region (start end)
"Changes region from snake_case to camelCase"
(interactive "r")
(save-restriction (narrow-to-region start end)
(goto-char (point-min))
(while (re-search-forward "_\\(.\\)" nil t)
(replace-match (upcase (match-string 1))))))

;; ----------------------------------------------------------------------
;; cadged largely from http://xahlee.org/emacs/elisp_idioms.html:
;;
(defun camelcase-word-or-region ()
"Changes word or region from snake_case to camelCase"
(interactive)
(let (pos1 pos2 bds)
(if (and transient-mark-mode mark-active)
(setq pos1 (region-beginning) pos2 (region-end))
(progn
(setq bds (bounds-of-thing-at-point 'symbol))
(setq pos1 (car bds) pos2 (cdr bds))))
(camelcase-region pos1 pos2)))

;; ----------------------------------------------------------------------
;; snakecase-region
;; Given a region of text in camelCase format, changes it to snake_case.
;;
;; BUG: This is actually just a repeat of camelcase-region!
(defun snakecase-region (start end)
"Changes region from camelCase to snake_case"
(interactive "r")
(save-restriction
(let ((case-fold-search nil))
(narrow-to-region start end)
(goto-char (point-min))
(while (re-search-forward "\\([a-z]\\)\\([A-Z]\\)" nil t)
(message (match-string 1))
(replace-match (concat (match-string 1) "_" (downcase (match-string 2))))
(goto-char (point-min))))))

;; ----------------------------------------------------------------------
;; Given a region of text in camelCase format, changes it to snake_case.
(defun snakecase-word-or-region ()
"Changes word or region from camelCase to snake_case"
(interactive)
(let (pos1 pos2 bds)
(if (and transient-mark-mode mark-active)
(setq pos1 (region-beginning) pos2 (region-end))
(progn
(setq bds (bounds-of-thing-at-point 'symbol))
(setq pos1 (car bds) pos2 (cdr bds))))
(snakecase-region pos1 pos2)))

;; Suggested key bindings
(global-set-key (kbd "C-c C--") 'camelcase-word-or-region)
(global-set-key (kbd "C-c C-_") 'snakecase-word-or-region)
