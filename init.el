;;; init.el --- My personal emacs config

;;; Commentary:

;; This init.el file use melpa and use-package for installation of packages.
;; Currently the modes configured are lisp and markdown. You will find all
;; installed packaged in the file load-package.el.

;; Install procedure:
;; git clone https://github.com/pith/.emacs.d
;; git submodule init
;; git sumodule update

;;; Code:

; Start by disabling useless UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode 0)

; Load system specific configuration
(when (eq system-type 'darwin)
   ; Add special key binding
  (setq mac-option-modifier 'none)
  (setq mac-function-modifier 'meta)
  )
(when (eq system-type 'windows-nt)
    ; load proxy settings (should be done before loading  packages)
    (load "~/.proxy.el")
    ; default indexing mode is not supported on windows
    (setq projectile-indexing-method 'native)
  )

; Initialize packages
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Load external libraries
(add-to-list 'load-path "~/.emacs.d/lib/use-package")
(add-to-list 'load-path "~/.emacs.d")
(require 'load-packages)
; Load modes
(add-to-list 'load-path "~/.emacs.d/mode/")
(require 'pit-elisp-mode)

; Externalize customize configuration
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;; Externalize the following line
(require 'eldoc)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "eldoc")
(load-library "functions")
(load-library "configure")

;; Auto complete
(add-to-list 'load-path "/Users/pith/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'org-config)


(provide 'init)

;;; init.el ends here
