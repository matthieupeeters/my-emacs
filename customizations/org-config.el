;;; Org mode settings 

(use-package org
  :ensure t
  :preface
  (use-package ob-restclient :ensure t)
  (setf org-directory "~/org")
  (unless (file-exists-p org-directory)
    (make-directory org-directory))
  ;; recursively find .org files in provided directory
  ;; modified from an Emacs Lisp Intro example
  ;; from: https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
  (defun sa-find-org-file-recursively (&optional directory filext)
    "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
    (interactive "DDirectory: ")
    (let* (org-file-list
           (case-fold-search t)	      ; filesystems are case sensitive
           (file-name-regex "^[^.#].*") ; exclude dot, autosave, and backupfiles
           (filext (or filext "org$\\\|org_archive"))
           (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
           (cur-dir-list (directory-files directory t file-name-regex)))
      ;; loop over directory listing
      (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
	(cond
	 ((file-regular-p file-or-dir)             ; regular files
          (if (string-match fileregex file-or-dir) ; org files
              (add-to-list 'org-file-list file-or-dir)))
	 ((file-directory-p file-or-dir)
          (dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
                            org-file-list) ; add files found to result
            (add-to-list 'org-file-list org-file)))))))
  :hook 
  (org-mode . toggle-word-wrap)
  :init 
  :bind (("\C-cc" . org-capture)
         :map org-mode-map
         ("\C-cl" . org-store-link)
         ("\C-ca" . org-agenda)
         ("\C-cc" . org-capture)
         ("\C-cb" . org-iswitchb)
         ("\M-q" . toggle-truncate-lines))
  :config
  (add-to-list 'org-modules 'org-timer)
  (add-to-list 'org-modules 'org-habit)
  (setq org-log-done 'time)
  (setq org-enforce-todo-dependencies t)
  (setq org-agenda-files (sa-find-org-file-recursively org-directory))
  (setq org-src-fontify-natively t)
  (setq org-startup-truncated nil)  ; This works
  (setq org-default-notes-file (concat org-directory "/notes.org")))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)
   (emacs-lisp . t)
   (css . t)
   (shell . t)
   (js . t)
   (org . t)
   (sql . t)
   (sqlite . t)
   (restclient . t)
   (mermaid . t)
   (scheme .t)))


;; (setq org-agenda-files (mapcar (lambda (x) (concat org-directory "/" x ".org"))
;;                                (list "work"
;;                                      "study"
;;                                      "general"
;;                                      "daily-routine"
;;                                      "medical")))





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
(use-package org-brain 
  :ensure t
  :init
  (setq org-brain-path "~/org/brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/org/.org-id-locations")
  (setq org-brain-visualize-default-choices 'all))

;; From https://github.com/org-roam/org-roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename org-directory))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;; Specific orgmode configuration goes here

(defun sqlformat-org-block ()
"Formats the sql-org-block the cursor is in."
(interactive)
  (when (org-in-src-block-p)
   (org-edit-special)
    (sqlformat-buffer)
    (org-edit-src-exit)))



