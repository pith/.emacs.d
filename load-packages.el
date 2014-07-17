(require 'use-package)

; UI

(use-package monokai-theme
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

(use-package helm
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files))
  :init 
  (progn
    (helm-mode)
    (setq helm-buffers-fuzzy-matching t))
  :ensure t)

(use-package projectile
  :init (progn
          (projectile-global-mode)
          (setq projectile-enable-caching t)
          (add-to-list 'guide-key/guide-key-sequence "C-c p"))
  :ensure t)

(use-package helm-projectile
  :bind ("C-c h" . helm-projectile)
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

; lisp

(use-package elisp-slime-nav
  :bind (("C-;" . elisp-slime-nav-find-elisp-thing-at-point)
         ("C-c C-d C-d" . elisp-slime-nav-describe-elisp-thing-at-point)
         ("C-c C-d d" . elisp-slime-nav-describe-elisp-thing-at-point))
  :ensure t)

(use-package eldoc
    :ensure t)

; Global

;; ido (https://github.com/gempesaw/ido-vertical-mode.el)
(use-package ido-vertical-mode
    :config
    (progn
      (ido-mode 1)
      (ido-vertical-mode 1)
      (setq ido-enable-flex-matching t)
      )
    :ensure t)

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

;; Smex (https://github.com/nonsequitur/smex)
(use-package smex
    :config 
    (progn
      (smex-initialize)
      ;; smex
      (global-set-key (kbd "M-x") 'smex)
      ;; Show only major mode commands
      (global-set-key (kbd "M-X") 'smex-major-mode-commands)
      ;; This is your old M-x.
      (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
      )
    :ensure t)

(use-package paredit
  :ensure t)

(provide 'load-packages)

