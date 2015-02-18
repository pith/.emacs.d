# .emacs.d

This is my personal emacs config which make an heavy use of `use-package` and `helm`.

## List of installed packages

Packages are installed with `use-package.el`, if you want to see the list of package installed go look at `load-packages.el`.

## Useful key binding
This is just a start. But here is the list of useful key binding I don't want to forget. Those I already forgot, will appear later.

*Navigation*

* <kbd>C-c C-l</kbd> - helm-list-elisp-packages
* <Kbd>C-c h</kbd> - helm-projectile
* <kbd>C-c C-<SPC></kbd> - ace-jump

*Editor*

* <kbd>C-=</kbd> - expand region
* <kbd>C-c C-<</kbd> - mc/mark-all-like-this

*Lisp*

* <kbd>C-c C-c</kbd> - eval-buffer
* <kbd>C-M-q</kbd> - reformat
* <kbd>C-c C-d C-d</kbd> - elisp-slime-nav-describe-elisp-thing-at-point
* <kbd>C-;</kbd> - elisp-slime-nav-find-elisp-thing-at-point

*Helm*
* <kbd>M-x</kbd> - Replaced actual M-x
* <kbd>C-c C-l</kdb> - helm-list-elisp-packages
* <kdb>C-c h</kdb> - helm-projectile
* <kbd>M-i</kbd> - helm-swoop

*Version control*

* <kbd>C-c C-g</kbd> - git-status

*Go mode*
* <kbd>C-c C-r</kbd> go-remove-unused-imports
* <kbd>C-c i</kbd> go-goto-imports
* <kbd>M-.</kbd> godef-jump
* <kbd>C-c C-j</kbd> godef-jump
* <kbd>C-c C-c</kbd> go-errcheck
* <kbd>C-c C-d</kbd> godoc-at-point
* <kbd>C-c C-c</kbd> go-errcheck
* <kbd>C-M-a</kbd> beginning-of-defun
* <kbd>C-M-e</kbd> end-of-defun
* mark-defun
* go-play-buffer
* go-play-region
* compile - go test -coverprofile=c.out
* go-coverage

## OS X

Specific key binding for OS X.

```elisp
(when (eq system-type 'darwin)
   ; Add special key binding
  (setq mac-option-modifier 'none)
  (setq mac-function-modifier 'meta)
  )
```

## Windows

On Windows, the `init.el` will look for a `~/.proxy.el` file. 
