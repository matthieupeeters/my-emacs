;;; package --- Summary
;;;
;;; Commentary:
;;; Emacs seems to have quite strickt (un-lispy) demands on the comments in a file.
;;; And flycheck is somehow bothered by a space after the final period on a line.


;;; Code:


;; Make everything UTF-8:

(setenv "LC_CTYPE" "en_US.UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Convenience settings, remove unneeded features.

(show-paren-mode 1)
(setq show-paren-delay 0)
(tool-bar-mode -1)
(when (not (display-graphic-p))
  (menu-bar-mode -1))
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)




;; Emacs packages:

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("marmelade" . "https://marmalade-repo.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))


(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; use-package:
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



(eval-when-compile
  (require 'use-package))

(require 'diminish)
(require 'bind-key)


(use-package try
  :ensure t)

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))


;; emacsclient server

(server-start)


;; org-brain:
(use-package org-brain :ensure t
  :init
  (setq org-brain-path "~/org/brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/org/.org-id-locations")
  (setq org-brain-visualize-default-choices 'all))

 (require 'org-brain)


;; Slime:

(load (expand-file-name "~/quicklisp/slime-helper.el"))

(global-set-key (kbd "C-x C-j") 'slime-eval-last-expression-in-repl)

(require 'slime-autoloads)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(slime-connect "127.0.0.1" 4005)

(setq slime-contribs '(slime-fancy))
(setq slime-net-coding-system 'utf-8-unix)

(global-set-key "\C-cs" 'slime-selector)



;; Flycheck: Syntax check for all languages:

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setf flycheck-indication-mode :left))



;; PHP:



(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))




(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js-mode))
(setq js2-highlight-level 3)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))
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
                  (find-grep-dired-do-search "~/src/xidy" (get-search-term))))
(put 'downcase-region 'disabled nil)
; (package-install 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (2048-game magit use-package exec-path-from-shell flycheck eww-lnum httprepl git-command git flymake-jslint flymake-php flymake-jshint flymake flylisp neotree markdown-mode markdown-mode+))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(use-package magit)
(require 'magit)



; /usr/local/Cellar/git/2.11.0/share/emacs/site-lisp/git/git.el
(add-to-list 'load-path "/usr/local/Cellar/git/2.11.0/share/emacs/site-lisp/git")
(require 'git)
(require 'git-blame)



(add-to-list 'org-modules 'org-mac-iCal)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/study.org" 
                             "~/org/home.org"))




(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))


(setq org-src-fontify-natively t)

(require 'org-indent)

(add-hook 'org-mode-hook #'toggle-word-wrap)

(setq org-startup-truncated nil)  ; This works

(define-key org-mode-map "\M-q" 'toggle-truncate-lines)

(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files '("~/.emacs.d/org"))


; (setq org-startup-indented t)


(put 'dired-find-alternate-file 'disabled nil)

(defun prev-window ()
  (interactive)
  (other-window -1))

(define-key global-map (kbd "C-x p") 'prev-window)



(put 'narrow-to-region 'disabled nil)


(desktop-save-mode 1)

