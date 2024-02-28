;;; used for sql code

(use-package sqlformat
  :ensure t
  :commands (sqlformat sqlformat-buffer sqlformat-region)
  :hook ((sql-mode . sqlformat-on-save-mode)
         (sql-mode . (lambda ()
                       (sql-highlight-postgres-keywords))))
  :bind
  (:map sql-mode-map
	("C-c C-f" . sqlformat))
  :init
  (setq sqlformat-command 'pgformatter
        sqlformat-args '("-s2" "-g" "-u1" "-U1" "-b" "-f1" "-W1")))

;; (add-hook 'sql-mode-hook
;;           (lambda ()
;;             (sql-highlight-postgres-)))


;; (define-key sql-mode-map (kbd "C-c C-f") 'sqlformat)

