


(use-package maxima
  :ensure t
  :after (org)
  :init
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)
	  maxima-display-maxima-buffer nil)
  (add-to-list 'auto-mode-alist
		 (cons "\\.mac\\'" 'maxima-mode))
  (add-to-list 'interpreter-mode-alist
		 (cons "maxima" 'maxima-mode)))
