
;;use org mode for eml files (useful for thunderbird plugin)
(add-to-list 'auto-mode-alist '("\\.eml\\'" . org-mode))

(use-package gnus
  :ensure t
  :config 
  (setq gnus-select-method '(nnnil nil))
  (setq gnus-secondary-select-methods
        '((nnimap "fxw"
                  (nnimap-address "srv21151.flexwebhosting.nl")
                  (nnimap-server-port "imaps")
                  (nnimap-stream ssl)
                  (nnir-search-engine imap)
                  (nnmail-expiry-target "nnimap+home:fxw/Trash")
                  (nnmail-expiry-wait 'immediate))))
  (setq gnus-asynchronous t
	gnus-use-cache t
	gnus-use-header-prefetch t))

(use-package notmuch 
  :ensure t
  :defer t)

(use-package notmuch-indicator
  :ensure t
  :defer t)

(use-package oauth2
  :ensure t
  :defer t)


;; (setq smtpmail-default-smtp-server "srv21151.flexwebhosting.nl" ; start with just the fxw configuration
;;       smtpmail-local-domain "matthieupeeters.nl"
;;       smtpmail-sendto-domain "matthieupeeters.nl"
;;       smtpmail-smtp-server  "srv21151.flexwebhosting.nl"  ;; Redundant? 
;;       smtpmail-stream-type  'ssl ; can also be nil starttls plain
;;       smtpmail-smtp-service 465
;;       smtpmail-servers-requiring-authorization ".*"
;;       smtpmail-debug-info t
;;       user-mail-address (concat "matthieu@" smtpmail-local-domain)
;;      )

;; (load-library "smtpmail")


;; (setq send-mail-function 'smtpmail-send-it)

;; (setq message-send-mail-function 'smtpmail-send-it)



