;;; load-packages.el --- This lisp file is use to load emacs packages with use-package library.

;;; Commentary:
;; 

;;; Code:

(add-to-list 'load-path "~/.emacs.d/third-party/use-package")

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

; UI

; Powerline (https://github.com/milkypostman/powerline)

; In order to use the utf-8 support install patched fonts
; (https://github.com/powerline/fonts)

(use-package powerline
  :init (progn
          (setq powerline-default-separator 'utf-8)
          (powerline-center-theme))
  :ensure t)

;;; Other mode-line lib (https://github.com/Malabarba/smart-mode-line)

;; (use-package smart-mode-line-powerline-theme
;;   :ensure t)

;; (use-package smart-mode-line
;;   :init (progn
;;           (rich-minority-mode 1)
;;           (add-to-list 'rm-whitelist "")
;;           (setq sml/theme 'powerline)
;;           (sml/setup))
;;   :ensure t)

(use-package solarized-theme
  :config (load-theme 'solarized-dark t)
  :ensure t)

; Edit

(use-package paredit
  :ensure t)

(use-package yasnippet
  :init (yas-global-mode 1)
  :ensure t)

; help

(use-package guide-key
  :init (progn
          (setq guide-key/guide-key-sequence '("C-c" "C-x r" "C-x 4" "C-c C-d"))
          (guide-key-mode 1))
  :ensure t)

; Navigation

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :ensure t)

(use-package ace-jump-mode
  :bind (("C-c SPC" . ace-jump-word-mode)
         ("C-c C-SPC" . ace-jump-word-mode))
  :ensure t)

(use-package guru-mode
  :ensure t)

(use-package helm
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files))
  :init
  (progn
    (helm-mode)
    (setq helm-buffers-fuzzy-matching t))
  :ensure t)

(use-package helm-helm-commands
  :ensure t)

(use-package projectile
  :init (progn
          (projectile-global-mode)
          (setq projectile-enable-caching t)
          (add-to-list 'guide-key/guide-key-sequence "C-c p"))
  :ensure t)

(use-package helm-projectile
  :bind (("C-c h" . helm-projectile)
         ("C-c p f" . helm-projectile-find-file)
         ("C-c p p" . helm-projectile-switch-project)
         ("C-c p b" . helm-projectile-switch-to-buffer))
  :ensure t)

(use-package helm-swoop
  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all))
  :ensure t)


; Version control

(use-package magit
  :bind ("C-c C-g" . magit-status)
  :ensure t)

; editor

(use-package auto-complete
  :ensure t)

(use-package expand-region
  :bind (("C-=" . er/expand-region)
          ("C-+" . er/contract-region))
  :ensure t)


; modes


(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :interpreter ("markdown" . markdown-mode)
  :ensure t)

(use-package mkdown
  :init (setq markdown-css-path mkdown-css-file-name)
  :ensure t)

(use-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode)
  :interpreter ("dockerfile" . dockerfile-mode)
  :ensure t)

(use-package gitconfig-mode
  :mode ("\\.gitconfig\\'" . gitconfig-mode)
  :interpreter ("gitconfig" . gitconfig-mode)
  :ensure t)

(use-package gitignore-mode
  :mode ("\\.gitignore\\'" . gitignore-mode)
  :interpreter ("gitignore" . gitignore-mode)
  :ensure t)

(use-package syslog-mode
  :mode ("/var/log.*\\'" . syslog-mode)
  :interpreter ("syslog-mode" . syslog-mode)
  :ensure t)

(use-package log4j-mode
  :mode ("\\.log\\'" . log4j-mode)
  :interpreter ("syslog-mode" . log4j-mode)
  :ensure t)

(use-package emacs-lisp-mode
  :init (progn
          (defvar flycheck-emacs-lisp-load-path)
          (setq flycheck-emacs-lisp-load-path load-path))
  :mode ("\\.el\\'" . emacs-lisp-mode)
  :interpreter ("emacs-lisp-mode" . emacs-lisp-mode))

; lisp

(use-package elisp-slime-nav
  :bind (("C-;" . elisp-slime-nav-find-elisp-thing-at-point)
         ("C-c C-d C-d" . elisp-slime-nav-describe-elisp-thing-at-point)
         ("C-c C-d d" . elisp-slime-nav-describe-elisp-thing-at-point))
  :ensure t)

(use-package eldoc
    :ensure t)

(use-package fic-mode
  :ensure t)

(bind-keys :map emacs-lisp-mode-map ("C-c C-c" . eval-buffer))

; Global

;; ibuffer (http://emacs-fu.blogspot.fr/2010/02/dealing-with-many-buffers-ibuffer.html)
(use-package ibuffer
  :init
  (progn
    (add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default"))))
  :config
  (progn
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
    )
    :ensure t)

(bind-key "M-x" 'helm-M-x)
(bind-key "C-c C-l" 'helm-list-elisp-packages)

(provide 'load-packages)

;;; load-packages.el ends here
