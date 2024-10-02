;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; diminish allows for less or no minor-mode indication
(use-package diminish :ensure t)

(use-package shut-up :ensure t :defer t)

(setq show-paren-delay 0)


;; from: https://emacs.stackexchange.com/questions/35959/emacs-blue-color-too-dark
(setq frame-background-mode 'dark)

;; Show line numbers
; (global-linum-mode)

(setq inhibit-startup-screen t)

;; Use spaces instead of tabs:
(setq-default indent-tabs-mode nil)


;; Enable narrow-to-region. 
;; narrow region: C-x n n   
;; widen: C-x n w
;; page: C-x n p
;; defun: C-x n d
(put 'narrow-to-region 'disabled nil)


;; save state of emacs. https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html#Saving-Emacs-Sessions
(desktop-save-mode 1)

;; In addition to C-x o
(defun prev-window ()
  "Go to previous window."
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'prev-window)


;; Add page up and down navigation on M-p and M-n
(defun page-up ()
  "Move one page up, number of lines in current window. "
  (interactive) 
  (setq this-command 'previous-line)
  (previous-line (window-body-height)))

(global-set-key (kbd "M-p") 'page-up)

(defun page-down ()
  "Move one page down, number of lines in current window. "
  (interactive) 
  (setq this-command 'next-line)
  (next-line (window-body-height)))

(global-set-key (kbd "M-n") 'page-down)



(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (delete-file filename)
              (message "Deleted file %s." filename)
              (kill-buffer)))
      (message "Not a file visiting buffer!"))))

(global-set-key (kbd "C-x DEL") 'delete-file-and-buffer)



;; fix the PATH variable on Unix systems, by getting it from the shell

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))


(when (not window-system) (set-exec-path-from-shell-PATH))



;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
; (load-theme 'tomorrow-night-bright t)
; (load-theme 'material t)


;; increase font size for better readability
(set-face-attribute 'default nil :height 100)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
(setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

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


;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)


(set-face-foreground 'highlight nil)


(put 'dired-find-alternate-file 'disabled nil)


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)


(setq display-buffer-alist ;; Setting window rules
      '( 
       ("\\*messages.*" ;; For buffer with a name beginning with "*messages", 
        (display-buffer-in-side-window) ;; Display it in side window
        (window-width . 0.25) ;; Side window takes up 1/4th of the screen
        (side . right) ;; On the right side of the screen, please
        )
       ("\\*warnings.*" ;; For buffer with a name beginning with "*warnings",
        (display-buffer-in-side-window) ;; Display it in side window
        (window-width . 0.25) ;; Side window takes up 1/4th of the screen
        (side . right) ;; On the right side of the screen, please
        )))


;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.


;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

