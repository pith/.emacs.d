;;; org-config.el --- My personal config for Org-mode


;;; Commentary:
;; Bind org-capture on "C-c c".  And specify the org-directory.

;;; Code:
(defvar org-directory)
(setq org-directory "~/notes")

(defvar org-default-notes-file)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(require 'bind-key)

(bind-key "C-c c" 'org-capture)


(provide 'org-config)

;;; org-config.el ends here
