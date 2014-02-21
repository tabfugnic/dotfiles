(setq org-directory "~/Dropbox/org/")

(defun org-file (file)
  (concat org-directory file))

(setq org-agenda-files (list (org-file "index.org")))

(setq org-capture-templates
      '(("t" "TODO"
        entry
        (file (org-file "index.org"))
        "* TODO %?\n %u\n")
        ("i" "Idea"
         entry
         (file (org-file "ideas.org"))
         "* %?\n %u\n")
        ("c" "Configurations"
         entry
         (file (org-file "config.org"))
         "* %?\n")))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
