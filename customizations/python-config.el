

(use-package elpy 
  :ensure t)

;; NOTE: Run M-x elpy-config once to check if everything is all ok. 

(use-package py-autopep8 
  :ensure t)

;; NOTE: Don't forget to install the "python3-autopep8" package on the OS

(use-package blacken
  :ensure t
  :hook (python-mode . (lambda ()
                         (blacken-mode 1)
                         ;; other config
                         ))
  :config
  ;; Enable Flycheck
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))

;; NOTE: Don't forget to install the "black" package on the OS


(elpy-enable)

