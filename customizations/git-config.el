
(use-package magit
  :ensure t)




(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Not sure how to access git on Windows. ")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (add-to-list 'load-path "/usr/local/Cellar/git/2.11.0/share/emacs/site-lisp/git")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Not sure how to access git on Linux"))))

; /usr/local/Cellar/git/2.11.0/share/emacs/site-lisp/git/git.el
(use-package git
  :ensure t)

                                        ;


  ;; (use-package git-blame
  ;;   :ensure t)
 
