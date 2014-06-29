(require 'use-package)

(use-package monokai-theme
  :ensure t)

(use-package magit
  :ensure t)

(use-package helm
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
	 )
  :init 
  (progn
    (helm-mode)
    (setq helm-buffers-fuzzy-matching t))
  :ensure t)

(use-package auto-complete
  :ensure t)

(use-package mkdown
  :init (setq markdown-css-path mkdown-css-file-name)
  :ensure t)

(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :interpreter ("markdown" . markdown-mode)
  :ensure t)

(use-package eldoc
    :ensure t)

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

