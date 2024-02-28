;; from emacs-for-clojure
;; Clojure


;; integration with a Clojure REPL
;; https://github.com/clojure-emacs/cider
;;;;
;; Cider
;;;;

(package-install 'cider)

(use-package cider
  :ensure t
  :hook (
         ;; provides minibuffer documentation for the code you're typing into the repl
         (cider-mode . eldoc-mode)
         ;; enable paredit in your REPL
         (cider-repl-mode . paredit-mode))
  :preface 
  :config
  ;; go right to the REPL buffer when it's finished connecting
  (setq cider-repl-pop-to-buffer-on-connect t)
  ;; When there's a cider error, show its buffer and switch to it
  (setq cider-show-error-buffer t)
  (setq cider-auto-select-error-buffer t)
  ;; Where to store the cider history.
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  ;; Wrap when navigating history.
  (setq cider-repl-wrap-history t)
  :bind ((:map clojure-mode-map
               ("C-c C-v" . cider-start-http-server)
               ("C-M-r" . cider-refresh)
               ("C-c u" . cider-user-ns)
               :map cider-mode-map
               ("C-c u" . cider-user-ns))))

;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))
(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))
(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))



;;;;
;; Clojure
;;;;




;; key bindings and code colorization for Clojure
;; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :ensure t
  :after (cider)
  :hook (;; Enable paredit for Clojure
         (clojure-mode . enable-paredit-mode)
         ;; This is useful for working with camel-case tokens, like names of
         ;; Java classes (e.g. JavaClassName)
         (clojure-mode . subword-mode)
         ;; syntax hilighting for midje
         (clojure-mode . 
                       (lambda ()
                         (setq inferior-lisp-program "lein repl")
                         (font-lock-add-keywords
                          nil
                          '(("(\\(facts?\\)"
                             (1 font-lock-keyword-face))
                            ("(\\(background?\\)"
                             (1 font-lock-keyword-face))))
                         (define-clojure-indent (fact 1))
                         (define-clojure-indent (facts 1))
                         (rainbow-delimiters-mode))))
  :config
  ;; Use clojure mode for other extensions
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))
  
  )

;; A little more syntax highlighting
(use-package clojure-mode-extra-font-locking
  :ensure t)

;; extra syntax highlighting for clojure
(use-package clojure-mode-extra-font-locking
  :ensure t)

