;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize MELPA

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (wombat)))
 '(grep-find-ignored-directories (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".DS_Store")))
 '(menu-bar-mode nil)
 '(menu-prompting nil)
 '(ns-alternate-modifier (quote none))
 '(ns-function-modifier (quote meta))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tool-bar-style (quote text))
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Monaco")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/eldoc.el")

;; WindMove (http://www.emacswiki.org/emacs/WindMove)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; uniquify (http://www.emacswiki.org/emacs/uniquify)
(require 'uniquify)

;; ido (https://github.com/gempesaw/ido-vertical-mode.el)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-enable-flex-matching t)


;; ibuffer (http://emacs-fu.blogspot.fr/2010/02/dealing-with-many-buffers-ibuffer.html)
(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("Org" ;; all org-related buffers
              (mode . org-mode))  
            ("Emacs config"
              (filename . ".emacs.d/"))
            ("Markdown"
              (mode . markdown-mode))  
            ("Mail"
              (or  ;; mail-related buffers
               (mode . message-mode)
               (mode . mail-mode)
               ;; etc.; all your mail related modes
               ))
            ("Programming" ;; prog stuff
              (or
                (mode . java-mode)
                (mode . go-mode)
                (mode . docker-mode)
                (mode . emacs-lisp-mode)
                ;; etc
                )) 
            ("ERC"   (mode . erc-mode))))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))


;; Smex (https://github.com/nonsequitur/smex)
(require 'smex) 
(smex-initialize)

;; smex
(global-set-key (kbd "M-x") 'smex)
  ;; Show only major mode commands
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs lisp configuration

(require 'eldoc)
(eldoc-add-command 'paredit-backward-delete 'paredit-close-round)

;; Active show parent mode
(show-paren-mode 1)

;; Electric RETURN
 (defvar electrify-return-match
    "[\]}\)\"]"
    "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
    "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
    (interactive "P")
    (let ((case-fold-search nil))
      (if (looking-at electrify-return-match)
	  (save-excursion (newline-and-indent)))
      (newline arg)
      (indent-according-to-mode)))

;; Using local-set-key in a mode-hook is a better idea.
;;  (global-set-key (kbd "RET") 'electrify-return-if-match)

(defun pit-elisp-mode ()
  (interactive)
  (paredit-mode t)
  (turn-on-eldoc-mode)
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round)
;;  (local-set-key (kbd "RET") 'electrify-return-if-match)
;;  (eldoc-add-command 'electrify-return-if-match)
  (show-paren-mode t)  
)
(add-hook 'emacs-lisp-mode-hook 'pit-elisp-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'pit-elisp-mode)
(add-hook 'ielm-mode-hook             'pit-elisp-mode)
(add-hook 'lisp-mode-hook             'pit-elisp-mode)
(add-hook 'lisp-interaction-mode-hook 'pit-elisp-mode)
(add-hook 'scheme-mode-hook           'pit-elisp-mode)

;; Auto complete
(add-to-list 'load-path "/Users/pith/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom edition functions

;; newline-withoug-break-of-line
(defun newline-without-break-of-line ()
  "1. remove to end of the line.
  2. insert newline with index"

  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(global-set-key (kbd "<S-return>") 'newline-without-break-of-line)
;;

;; Change the buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; The following is a work in progress

(defun pit-duplicate-line-or-region ()
  "Copy current line, or current text selection."
  (interactive)
  (let ((oldpos (point)))
  (if (region-active-p)
      (setq myString region-beginning region-end)
    (setq myString (buffer-substring (line-beginning-position) (line-end-position))))
  (newline-without-break-of-line)
  (insert myString)
  (goto-char oldpos)
  (forward-line 1))
)

(global-set-key (kbd "C-c C-y") 'pit-duplicate-line-or-region)



(defun pit-kill-current-line ()
  "Kill the current line."
  (interactive)
;; grab the start and end positions of a word (or any other thing)
(setq myBoundaries (bounds-of-thing-at-point 'line))

;; get the beginning and ending positions
(setq p1 (car myBoundaries))
(setq p2 (cdr myBoundaries))

;; grab it
(setq myStr (buffer-substring-no-properties p1 p2))

;; delete region
(kill-region p1 p2))

(global-set-key (kbd "C-c C-d") 'pit-kill-current-line)
;;

;; move line up
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(global-set-key (kbd "M-p") 'move-line-up)

;; move line down
(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key (kbd "M-n") 'move-line-down)

