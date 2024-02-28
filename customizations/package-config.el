;;; Emacs packages:

(require 'package)

(setq package-archives
      '(("tromey" . "http://tromey.com/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
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

;; Since version 29 use-package is part of emacs. So this is rarely needed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents) 
  (package-install 'use-package))
(eval-when-compile  
  (require 'use-package))

;; use-package-ensure allowes auto-loading of packages in use-package
;; it seems to use package.el for that job. 
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))


(use-package use-package-ensure-system-package
  :ensure t)

(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))
