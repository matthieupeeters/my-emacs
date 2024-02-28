;;; PHP --- Configuration of Emacs for PHP use
;;; Commentary:
;;; Nice weather isn't it?
;;; Code:
(use-package flymake-php)

(use-package web-mode
  :ensure t
  :mode "\\.phtml"
  "\\.tpl" "\\.php"
  "\\.html" "\\.twig"
  "\\.xhtml" "\\.htm?\\'")


(use-package php-mode
  :ensure t
  :interpreter "php"
  :mode "\\.php" "\\.inc"
  :config
  (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (use-package ac-php :ensure t)
               (setq ac-sources '(ac-source-php))
               (yas-global-mode 1)
               (ac-php-core-eldoc-setup) ;; enable eldoc
               (setq electric-pair-mode t)
               ))
  :bind (:map php-mode-map
              ("C-]" . ac-php-find-symbol-at-point) ;goto define
              ("C-t" . ac-php-location-stack-back) ;go back
              ))



;;; Php-config ends here

