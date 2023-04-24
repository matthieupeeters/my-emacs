
(use-package sly 
  :ensure t)


(eval-after-load 'sly
  `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))

