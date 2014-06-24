;;; elisp-mode.el --- Custom configuration for lisp mode

;;; Commentary:
;; This mode enable paredit, show-parent-mode, electrify-return-match.

;;; Code:

(defun pit-elisp-mode ()
  "Enable pit custom Lisp mode."
  (interactive)
  (paredit-mode t)
  (show-paren-mode t)
  (eldoc-mode t)
  (defvar electrify-return-match
    "[\]}\)]"
    "If this regexp matches the text after the cursor, do an \"electric\"
  return.")
  ;; Using local-set-key in a mode-hook is a better idea.
  (global-set-key (kbd "RET") 'electrify-return-if-match)
)

(add-hook 'emacs-lisp-mode-hook 'pit-elisp-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'pit-elisp-mode)
(add-hook 'ielm-mode-hook             'pit-elisp-mode)
(add-hook 'lisp-mode-hook             'pit-elisp-mode)
(add-hook 'lisp-interaction-mode-hook 'pit-elisp-mode)
(add-hook 'scheme-mode-hook           'pit-elisp-mode)

;; Electric RETURN
(defun electrify-return-if-match (arg)
    "New line and indent and close parenthesis on next line.
If the text after the cursor matches `electrify-return-match' then
open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line.
Argument ARG ending block caracter (eg. ')' for lisp)."
    (interactive "P")
    (let ((case-fold-search nil))
      (if (looking-at electrify-return-match)
	  (save-excursion (newline-and-indent)))
      (newline arg)
      (indent-according-to-mode)))

;; ELDoc config (http://www.emacswiki.org/emacs/ElDoc)

(provide 'pit-elisp-mode)

;;; elisp-mode.el ends here
