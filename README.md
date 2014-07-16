# .emacs.d

My personal emacs config.

## List of installed packages

- helm
- smex (https://github.com/nonsequitur/smex)
- ibuffer (http://emacs-fu.blogspot.fr/2010/02/dealing-with-many-buffers-ibuffer.html)

TODO complete

## Useful key binding

*Navigation*

* <kbd>C-c h</kbd> - helm-projectile
* <kbd>C-c C-<SPC></kbd> - ace-jump

*Editor*

* <kbd>C-=</kbd> - expand region
* <kbd>C-c C-<</kbd> - mc/mark-all-like-this

*Lisp*

* <kbd>C-M-q</kbd> - reformat
* <kbd>C-c C-d C-d</kbd> - elisp-slime-nav-describe-elisp-thing-at-point
* <kbd>C-;</kbd> - elisp-slime-nav-find-elisp-thing-at-point

*Version control*

* <kbd>C-c C-g</kbd> - git-status

## Personal functions and key bindings

```lisp
(global-set-key (kbd "<S-return>") 'newline-without-break-of-line)
```

