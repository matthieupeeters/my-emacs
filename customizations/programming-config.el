;;; emacs config and packages used for programming for no specific language.

;; dumb-jump allows for jumping to function definition on pressing M-.
(use-package dumb-jump 
  :ensure t
  :config  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))


;; Flycheck: Syntax check for all languages:
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package flymake
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

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t
  :defer t)

(use-package auto-complete
  :ensure t)


;; (use-package dap-LANGUAGE) to load the dap adapter for your language

