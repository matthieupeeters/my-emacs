


(use-package haskell-mode
  :ensure t
  :init
  :hook ((haskell-mode . lsp) 
         (haskell-literate-mode . lsp))
  :bind (("C-M-x" . haskell-interactive-bring) ;; Bind Haskell REPL to C-M-x
         ("C-c C-f" . ormolu-format-buffer)) ;; Bind formatting to C-c C-f
  :config
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile)
  (let ((stack-command "stack build --pedantic --fast"))
    (setq haskell-stylish-on-save t
          haskell-compile-cabal-build-command (concat "cd %s && " stack-command)
          projectile-project-compilation-cmd stack-command
          projectile-project-test-cmd (concat stack-command " --test")
          flycheck-ghc-language-extensions '("OverloadedStrings"
                                             "NamedFieldPuns"
                                             "FlexibleInstances"
                                             "FlexibleContexts"))))
  
;; Install and configure ormolu
(use-package ormolu
  :ensure t
  )


(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp-deferred)
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config   
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  (setq lsp-haskell-process-args-hie '("-d" "-l" "/tmp/hls.log"))
  (setq lsp-enable-snippet nil) ;; Disable snippet support
  (setq lsp-auto-configure t))

  ;; optionally

(use-package lsp-ui :commands lsp-ui-mode
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))
  ;; if you are helm user

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
  ;; if you are ivy user

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)



(use-package lsp-haskell
  :ensure t
  :after lsp
  :demand t
  :config 
  (setq lsp-haskell-server-path "haskell-language-server-wrapper")
  :custom
  (lsp-haskell-formatting-provider "brittany"))



(provide 'haskell-config)

;;; haskell-config.el ends here
  
