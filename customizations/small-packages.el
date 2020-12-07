

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


;; Flycheck: Syntax check for all languages:

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


