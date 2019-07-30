;;; Convenience settings, remove unneeded features.

(show-paren-mode 1)
(setq show-paren-delay 0)
(tool-bar-mode -1)
(when (not (display-graphic-p))
  (menu-bar-mode -1))
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)

(put 'narrow-to-region 'disabled nil)

(desktop-save-mode 1)



(defun prev-window ()
  "Go to previous window."
  (interactive)
  (other-window -1))

(define-key global-map (kbd "C-x p") 'prev-window)

;; fix the PATH variable on Unix systems
(defun set-exec-path-from-shell-PATH ()
  "Instruct bash that a certain terminal is in use."
  (if (or (string-equal system-type "darwin")
          (string-equal system-type "gnu/linux"))
      (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
        (setenv "PATH" path-from-shell)
        (setq exec-path (split-string path-from-shell path-separator)))))

(when window-system (set-exec-path-from-shell-PATH))


(defun insert-comment-info ()
    "Insert today's date using the current locale."
    (interactive)
    (insert "mathi:")
    (insert (format-time-string "%Y-%m-%d"))
    (insert " "))

(global-set-key "\C-x\C-\\" `insert-comment-info)

