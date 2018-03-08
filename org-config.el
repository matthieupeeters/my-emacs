;;; Code:

(setf org-directory "~/org")

(defun my-after-load-org ()
  (add-to-list 'org-modules 'org-timer)
  (add-to-list 'org-modules 'org-mac-iCal))


(eval-after-load "org" '(my-after-load-org))

(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'note)

(setq org-agenda-files (mapcar (lambda (x) (concat org-directory "/" x ".org"))
                        (list "work"
                              "study"
                              "general"
                              "daily-routine"
                              "medical")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))


(setq org-src-fontify-natively t)

(require 'org-indent)

(add-hook 'org-mode-hook #'toggle-word-wrap)

(setq org-startup-truncated nil)  ; This works

(define-key org-mode-map "\M-q" 'toggle-truncate-lines)

(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-files (list org-directory))


(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-custom-commands
      '(("C-ci" "Import diary from iCal" agenda ""
         ((org-agenda-mode-hook
           (lambda ()
             (org-mac-iCal)))))))

(add-hook 'org-agenda-cleanup-fancy-diary-hook
          (lambda ()
            (goto-char (point-min))
            (save-excursion
              (while (re-search-forward "^[a-z]" nil t)
                (goto-char (match-beginning 0))
                (insert "0:00-24:00 ")))
            (while (re-search-forward "^ [a-z]" nil t)
              (goto-char (match-beginning 0))
              (save-excursion
                (re-search-backward "^[0-9]+:[0-9]+-[0-9]+:[0-9]+ " nil t))
              (insert (match-string 0)))))

; (setq org-startup-indented t)


;; org-brain:
(use-package org-brain :ensure t
  :init
  (setq org-brain-path "~/org/brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/org/.org-id-locations")
  (setq org-brain-visualize-default-choices 'all))

