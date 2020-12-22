;;; package --- Summary
;;;
;;; Commentary:
;;; Emacs seems to have quite strickt (un-lispy) demands on the comments in a file.
;;; And flycheck is somehow bothered by a space after the final period on a line.


;;; Code:



(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")


(load "utf-8-config.el")
(load "general-convenience-config.el")
(load "package-config.el")
(load "small-packages.el")
(load "paredit-config.el")
(load "clojure-config.el")

;; Some loads
(load "ido-config.el") ; this file also contains smex and projectile config
(load "php-config.el")
(load "js-config.el")
(load "search-config.el")
(load "git-config.el")
(load "org-config.el")
(load "org-static-blog-config.el")
(load "csharp-config.el")
(load "date-config.el")

(load "slime-config.el")
;; (load "no-easy-keys-config.el")

(load "editing.el")
(load "elisp-editing.el")
(load "misc.el")
(load "navigation.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "shell-integration.el")
(load "ui.el")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(electric-pair-mode t)
 '(org-agenda-files (quote ("~/org/work.org" "~/org/study.org")))
 '(package-selected-packages
   (quote
    (which-key web-mode use-package try shut-up projectile php-mode paredit-everywhere org-brain omnisharp neotree markdown-mode magit json-mode js2-mode httprepl git-command git flymake-php flymake-jslint flymake-jshint flymake exec-path-from-shell eww-lnum emstar cider better-defaults)))
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

;; emacsclient server


(if (or (string-equal system-type "darwin")
        (string-equal system-type "gnu/linux"))
    (server-start)
  (message "Unknown system for server (Windows?)."))



;;; init.el ends here

;; Proper bash-shell:

(push "--login" explicit-bash-args)
(global-set-key [f1] 'eshell)

