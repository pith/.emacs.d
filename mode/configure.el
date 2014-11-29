;;; configure.el --- Global configuration of the emacs layout.

;;; Commentary:
;; TODO reorganize this file.

;;; Code:

; WindMove (http://www.emacswiki.org/emacs/WindMove)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; Insert 4 space instead of TAB
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; Show column number
(global-linum-mode t)

; Enable auto-indent
(bind-key "<RET>" 'newline-and-indent)
(bind-key "<C-return>" 'newline)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'configure)

;;; configure.el ends here
