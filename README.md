# .emacs.d

This is my personal emacs config which make an heavy use of `use-package` and `helm`.

## List of installed packages

Packages are installed with `use-package.el`, if you want to see the list of installed packages go look at `load-packages.el`.

## Useful key binding
This is just a start. But here is the list of useful key binding I don't want to forget. Those I already forgot, will appear later.

*Navigation*

* <kbd>C-c C-l</kbd> - helm-list-elisp-packages
* <Kbd>C-c h</kbd> - helm-projectile
* <kbd>C-c C-<SPC></kbd> - ace-jump
* <kbd>M-i</kbd> - helm-swoop

*Editor*

* <kbd>C-=</kbd> - expand region
* <kbd>C-c C-<</kbd> - mc/mark-all-like-this

*Lisp*

* <kbd>C-c C-c</kbd> - eval-buffer
* <kbd>C-M-q</kbd> - reformat
* <kbd>C-c C-d C-d</kbd> - elisp-slime-nav-describe-elisp-thing-at-point
* <kbd>C-;</kbd> - elisp-slime-nav-find-elisp-thing-at-point

*Version control*

* <kbd>C-c C-g</kbd> - git-status

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

On Windows, the `init.el` will look for a `~/proxy` file. 
