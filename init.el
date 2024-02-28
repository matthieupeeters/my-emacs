
;;; Code:



(package-initialize)
(add-to-list 'load-path "~/.emacs.d/customizations")


(load "custom.el") ; this file is in the same directory as init.el.
;; the rest is in ./customizations

(load "utf-8-config.el")

(load "package-config.el")

(load "small-packages.el")
(load "programming-config.el")

(load "paredit-config.el")
(load "clojure-config.el")
(load "scheme-config.el")

(load "lsp-config.el")

(load "ido-config.el") ; this file also contains smex and projectile config
(load "php-config.el")
(load "js-config.el") ; json mode as well
(load "sql-config.el")
(load "csharp-config.el")
(load "python-config.el")
(load "maxima-config.el")
(load "sly-config.el")
(load "elisp-config.el")
(load "haskell-config.el")


;; (load "slime-config.el")

(load "mail-config.el")

(load "search-config.el")
(load "git-config.el")

(load "org-config.el")
(load "org-static-blog-config.el")

(load "date-config.el")

(load "uuid-config.el")
(load "ispell-config.el")

(load "editing.el")

(load "shell-integration.el")
(load "ui.el")

(load "translate-char.el")
(load "emacsclient-server.el")

;;; init.el ends here




