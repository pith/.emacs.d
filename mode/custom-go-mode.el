;;; custom-go-mode.el --- This file set up go mode.

;;; Commentary:
;; Thanks to ejemba for this config file (https://github.com/kametic/.emacs.d/blob/master/ejemba/ejemba-golang.el).

;;; Code:

(require 'use-package)

(use-package go-mode
  :mode ("\\.go" . go-mode)
  :config (progn
            (setq tab-width 2)
            (setq standard-indent 2)
            (setq indent-tabs-mode -1)
            (setq compile-command "go test -coverprofile=c.out")

            ;; (add-hook 'go-mode-hook
            ;;           (lambda () (add-hook 'before-save-hook 'gofmt-before-save)))
            (add-hook 'go-mode-hook
                      (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
            (add-hook 'go-mode-hook
                      (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
            (add-hook 'go-mode-hook
                      (lambda () (local-set-key (kbd "<f3>") 'godef-jump)))
            (add-hook 'go-mode-hook
                      (lambda () (local-set-key (kbd "M-.") 'godef-jump)))
            (add-hook 'go-mode-hook
                      (lambda () (local-set-key (kbd "C-c C-c") 'go-errcheck)))
            (add-hook 'go-mode-hook
                      (lambda () (local-set-key (kbd "C-c C-d") 'godoc-at-point)))
            )
  :ensure t)

;; Go Oracle
;; http://yousefourabi.com/blog/2014/05/emacs-for-go/
;;


(setenv "GOPATH" "/Users/pith/dev/go/halgo-workspace")
;(setenv "PATH" (concat (getenv "PATH") ":" "/Users/pith/dev/go/parisgo-work/bin"  ":" "/usr/local/go/bin"))
(setq exec-path (cons "/Users/pith/dev/go/parisgo-work/bin/" exec-path))
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))


(use-package flycheck
  :init (global-flycheck-mode 1)
  :ensure t)

;; go get -u github.com/nsf/gocode
(use-package go-eldoc
  :init (add-hook 'go-mode-hook 'go-eldoc-setup)
  :ensure t)

(use-package go-autocomplete
  :ensure t)

(use-package go-snippets
  :ensure t)

;; go get github.com/kisielk/errcheck
(use-package go-errcheck
  :ensure t)

; go direx
(use-package popwin ; needed by direx
  :init (popwin-mode 1)
  :ensure t)
; go get -u github.com/jimweirich/gotags
; use rake
(use-package go-direx
  :init
  :ensure t)

; go get github.com/golang/lint/golint
(use-package golint
  :ensure t)

(provide 'custom-go-mode)

;;; custom-go-mode.el ends here
