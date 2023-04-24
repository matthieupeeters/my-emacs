




(setq scheme-program-name "guile")


(use-package geiser-guile)

(use-package geiser
  :config
  (setq geiser-active-implementations '(guile))
  (setq geiser-active-implementation '(guile))
  (setq geiser-guile-binary "guile"))
