;;; Emacs packages:

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("tromey" . "http://tromey.com/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(setq package-pinned-packages
      '((cider . "melpa-stable")
        (magit . "melpa-stable")))


(when (not package-archive-contents)
  (package-refresh-contents))


;; Bootstrap 'use-package'
; (eval-after-load 'gnutls
;   '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents) 
  (package-install 'use-package))

(eval-when-compile  
  (require 'use-package))

(setq use-package-always-ensure t)


(require 'bind-key)



