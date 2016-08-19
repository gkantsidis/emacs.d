;; The following will update automatically a timestamp when saving a file.
;; To use add: Time-stamp&colon <>
(add-hook 'write-file-hooks 'time-stamp) ; update timestamp when saving

(provide 'init-local)