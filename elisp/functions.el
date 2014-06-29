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

(global-set-key (kbd "C-c C-k") 'pit-kill-current-line)
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
