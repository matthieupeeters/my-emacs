
;; From emacs-for-clojure : shell-integration.el

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (use-package exec-path-from-shell
      :ensure t))



;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))


;; From emacs-for-clojure : ui.el
;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)



;; from emacs-for-clojure


;; key bindings and code colorization for Clojure
;; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :ensure t)

;; extra syntax highlighting for clojure
(use-package clojure-mode-extra-font-locking
  :ensure t)

;; integration with a Clojure REPL
;; https://github.com/clojure-emacs/cider
(use-package cider
  :ensure t)


;; allow ido usage in as many contexts as possible. see
;; customizations/navigation.el line 23 for a description
;; of ido
(use-package ido-completing-read+
  :ensure t)

;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
(use-package smex
  :ensure t)

;; project navigation
(use-package projectile
  :ensure t)

;; colorful parenthesis matching
(use-package rainbow-delimiters
  :ensure t)

;; edit html tags like sexps
(use-package tagedit
  :ensure t)
;; not from emacs-for-clojure
