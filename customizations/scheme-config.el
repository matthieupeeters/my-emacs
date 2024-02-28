
(setq scheme-program-name "guile")


(use-package geiser
  :ensure t
  :config
  (setq geiser-active-implementations '(guile))
  (setq geiser-active-implementation '(guile))
  (setq geiser-guile-binary "guile"))


(use-package geiser-guile
  :ensure t)

