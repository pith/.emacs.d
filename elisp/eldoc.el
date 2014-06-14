;;  (turn-on-eldoc-mode)
;; (eldoc-add-command
;;  'paredit-backward-delete
;;  'paredit-close-round)
;;  (local-set-key (kbd "RET") 'electrify-return-if-match)
;;  (eldoc-add-command 'electrify-return-if-match)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ELDoc config (http://www.emacswiki.org/emacs/ElDoc)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Highlighting Eldoc Arguments in EmacsLisp 
;; (defun eldoc-get-arg-index ()
;;   (save-excursion
;;     (let ((fn (eldoc-fnsym-in-current-sexp))
;;           (i 0))
;;       (unless (memq (char-syntax (char-before)) '(32 39)) ; ? , ?'
;;         (condition-case err
;;             (backward-sexp)             ;for safety
;;           (error 1)))
;;       (condition-case err
;;           (while (not (equal fn (eldoc-current-symbol)))
;;             (setq i (1+ i))
;;             (backward-sexp))
;;         (error 1))
;;       (max 0 i))))

;; (defun eldoc-highlight-nth-arg (doc n)
;;   (cond ((null doc) "")
;;         ((<= n 0) doc)
;;         (t
;;          (let ((i 0))
;;            (mapconcat
;;             (lambda (arg)
;;               (if (member arg '("&optional" "&rest"))
;;                   arg
;;                 (prog2
;;                     (if (= i n)
;;                         (put-text-property 0 (length arg) 'face 'underline arg))
;;                     arg
;;                   (setq i (1+ i)))))
;;             (split-string doc) " ")))))

;; (defadvice eldoc-get-fnsym-args-string (around highlight activate)
;;   ""
;;   (setq ad-return-value (eldoc-highlight-nth-arg ad-do-it
;;                          (eldoc-get-arg-index))))

;; Add docstring to ElDoc output
;; (defadvice eldoc-get-fnsym-args-string (after add-dacstring (sym)
;;                                                 activate compile)
;;     "Add a doc string to ElDoc's modeline information."
;;     (let ((doc (eldoc-docstring-first-line
;;                 (cdr (help-split-fundoc (documentation sym t) sym)))))
;;       (when (and doc (not (equal doc "")))
;;         (setq ad-return-value
;;               (concat ad-return-value
;;                       (if (> (+ (length ad-return-value) (length doc) 4)
;;                              (frame-width)) "\n" "    ")
;;                       doc))))
;;     ad-return-value)


