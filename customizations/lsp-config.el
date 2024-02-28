
;; eglot doesn't seem to work
(when nil 
  (use-package eglot
    :ensure t
    :init 
    :hook (haskell-mode . eglot-ensure)
    :config
    (add-to-list 'eglot-server-programs
		 '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
    (setq-default eglot-workspace-configuration
                  '((haskell
                     (plugin
                      (stan
                       (globalOn . :json-false)))))) ;; disable stan
    :custom
    (eglot-autoshutdown t) ;; shutdown language server after closing last file
    (eglot-confirm-server-initiated-edits nil) ;; allow edits without confirmation
    ))





  
