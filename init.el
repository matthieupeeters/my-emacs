;;; package --- Summary
;;;
;;; Commentary:
;;; Emacs seems to have quite strickt (un-lispy) demands on the comments in a file.
;;; And flycheck is somehow bothered by a space after the final period on a line.


;;; Code:



(package-initialize)

(load "~/.emacs.d/utf-8-config.el")
(load "~/.emacs.d/general-convenience-config.el")
(load "~/.emacs.d/package-config.el")
(load "~/.emacs.d/ido-config.el")



(use-package diminish
  :ensure t)
(use-package bind-key
  :ensure t)
(use-package cl
  :ensure t)
(use-package try
  :ensure t)
(use-package which-key
  :ensure t 
  :config
  (which-key-mode))
(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'slime-repl-mode-hook       #'enable-paredit-mode)
  ;; Stop SLIME's REPL from grabbing DEL,
  ;; which is annoying when backspacing over a '('
  (defun override-slime-repl-bindings-with-paredit ()
    (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
  (defun my-paredit-nonlisp ()
    "Turn on paredit mode for non-lisps."
    (interactive)
    (set (make-local-variable 'paredit-space-for-delimiter-predicates)
         '((lambda (endp delimiter) nil)))
    (enable-paredit-mode)))


;; Flycheck: Syntax check for all languages:

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(load "~/.emacs.d/php-config.el")


;; JavaScript:

(use-package js2-mode
  :ensure t
  :interpreter "node"
  :mode "\\.js" "\\.jsx"
  :config
  (setq js2-highlight-level 3)
  (add-hook 'js2-mode-hook
            (lambda () (flycheck-mode t)))
  (add-hook 'js2-mode-hook
            (lambda () (flycheck-mode t)))
  :bind (:map js2-mode-map
              ("{" . paredit-open-curly)
              ("}" . paredit-close-curly-and-newline)))

(use-package json-mode
  :ensure t
  :mode "\\.json")


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




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(electric-pair-mode t)
 '(org-agenda-files (quote ("~/org/work.org" "~/org/study.org")))
 '(package-selected-packages
   (quote
    (ac-php web-mode paredit json-mode adoc-mode auto-complete better-defaults projectile cider clojure-mode langtool dictionary 2048-game magit use-package exec-path-from-shell flycheck eww-lnum httprepl git-command git flymake-jslint flymake-php flymake-jshint flymake flylisp neotree markdown-mode markdown-mode+)))
 '(safe-local-variable-values
   (quote
    ((Package . HUNCHENTOOT)
     (Package . CH1-EXERCISES)
     (Package . CH3-EXERCISES)
     (Package . CH3)
     (Package . CH4-FINAL)
     (Package . CH4-FIRST)
     (Base . 10)
     (Package . CL-USER)
     (Syntax . COMMON-LISP)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(load "~/.emacs.d/git-config.el")

(load "~/.emacs.d/org-config.el")


(put 'dired-find-alternate-file 'disabled nil)


;; Clojure

(defvar my-packages '(auto-complete
                      better-defaults
                      projectile
                      clojure-mode
                      cider))
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;; Date
(use-package calendar
  :ensure t)

(setq calendar-latitude 51.3)
(setq calendar-longitude 5.3)
(setq calendar-location-name "Eindhoven, NL")
(setq calendar-mark-diary-entries-flag t)


;; Proper bash-shell:

(push "--login" explicit-bash-args)
(global-set-key [f1] 'eshell)

                                       
;; emacsclient server


(if (or (string-equal system-type "darwin")
        (string-equal system-type "gnu/linux"))
    (server-start)
  (message "Unknown system for server (Windows?)."))


(load "~/.emacs.d/slime-config.el")
;;; init.el ends here


