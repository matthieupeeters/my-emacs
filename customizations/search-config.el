
;;; Search - to be used with dired

;;; https://stackoverflow.com/questions/4969373/emacs-find-grep-dired-then-automatically-isearch-forward-on-given-regexp


;;; Search support:
(defun get-search-term (beg end)
  "message region or \"empty string\" if none highlighted"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (message "%s" (if (and beg end)
                    (buffer-substring-no-properties beg end)
                  "empty string")))
(defun find-grep-dired-do-search (dir regexp)
      "First perform `find-grep-dired', and wait for it to finish.
    Then, using the same REGEXP as provided to `find-grep-dired',
    perform `dired-do-search' on all files in the *Find* buffer."
      (interactive "DFind-grep (directory): \nsFind-grep (grep regexp): ")
      (find-grep-dired dir regexp)
      (while (get-buffer-process (get-buffer "*Find*"))
        (sit-for 1))
      (with-current-buffer "*Find*"
        (dired-toggle-marks)
        (dired-do-search regexp)))
(global-set-key (kbd "C-x C-`")
                (lambda ()
                  (interactive)
                  (find-grep-dired-do-search "~/src" (get-search-term))))
(put 'downcase-region 'disabled nil)

