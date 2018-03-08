

;; Slime:
;;; Code:

(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors
          (load (expand-file-name "~/quicklisp/slime-helper.el")))))


(load (expand-file-name "~/quicklisp/slime-helper.el"))

(global-set-key (kbd "C-x C-j") 'slime-eval-last-expression-in-repl)

(require 'slime-autoloads)


(setq inferior-lisp-program "/usr/local/bin/sbcl")

(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors
          (slime-connect "127.0.0.1" 4005))))


(setq slime-contribs '(slime-fancy))
(setq slime-net-coding-system 'utf-8-unix)

(global-set-key "\C-cs" 'slime-selector)

;;; slime-config.el ends here

