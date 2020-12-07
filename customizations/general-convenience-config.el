;;; Convenience settings, remove unneeded features.
;;; Only emacs settings, no package settings

(show-paren-mode 1)
(setq show-paren-delay 0)
;; Show line numbers
(global-linum-mode)


(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))


;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))



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


;; increase font size for better readability
(set-face-attribute 'default nil :height 140)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
; (blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)
