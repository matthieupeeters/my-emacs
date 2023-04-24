

(use-package elpy 
  :ensure t)

(use-package py-autopep8 
  :ensure t)

(use-package blacken
  :ensure t)

(use-package flycheck
  :ensure t)


(elpy-enable)


;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
