
;; JavaScript:

(use-package flymake-jshint
  :ensure t
  :defer t)

(use-package flymake-jslint
  :ensure t
  :defer t)


(use-package js2-mode
  :ensure t
  :interpreter "node"
  :mode "\\.js" "\\.jsx"
  :preface
  (defun js2-mode-flycheck-mode ()
    (flycheck-mode t))
  :hook ((js2-mode . js2-mode-flycheck-mode)
         (js2-mode . subword-mode))
  
  :config
  (setq js2-highlight-level 2)
  :bind (:map js2-mode-map
              ("{" . paredit-open-curly)
              ("}" . paredit-close-curly-and-newline)))

(use-package json-mode
  :ensure t
  :mode "\\.json")


;; html
(add-hook 'html-mode-hook 'subword-mode)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


;; coffeescript
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook
          (defun coffee-mode-newline-and-indent ()
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
            (setq coffee-cleanup-whitespace nil)))
(custom-set-variables
 '(coffee-tab-width 2))
