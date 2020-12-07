;;; Emacs packages:

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives
      '(("tromey" . "http://tromey.com/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("marmelade" . "https://marmalade-repo.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(setq package-pinned-packages
      '((cider . "melpa-stable")
        (magit . "melpa-stable")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; use-package:
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



(eval-when-compile
  (require 'use-package))

