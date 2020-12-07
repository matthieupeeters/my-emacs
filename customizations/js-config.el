
;; JavaScript:

(use-package js2-mode
  :ensure t
  :interpreter "node"
  :mode "\\.js" "\\.jsx"
  :config
  (setq js2-highlight-level 3)
  (add-hook 'js2-mode-hook
            (lambda () (flycheck-mode t)))
  (add-hook 'js2-mode-hook
            (lambda () (flycheck-mode t)))
  :bind (:map js2-mode-map
              ("{" . paredit-open-curly)
              ("}" . paredit-close-curly-and-newline)))

(use-package json-mode
  :ensure t
  :mode "\\.json")

