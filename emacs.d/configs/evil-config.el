(require 'linum-relative)

(setq evil-toggle-key "C-`")

(evil-mode 1)
(global-evil-surround-mode 1)

(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
