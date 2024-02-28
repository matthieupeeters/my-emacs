;; emacsclient server


(if (or (string-equal system-type "darwin")
        (string-equal system-type "gnu/linux"))
    (server-start)
  (message "Unknown system for server (Windows?)."))

