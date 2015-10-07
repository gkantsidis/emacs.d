(require 'ispell)

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

;;
;; Extensions to enable spelling in more contexts
;;
(require-package 'ac-ispell)

;; Completion words longer than 4 characters
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 4)
 '(ac-ispell-requires 4)
 '(reftex-plug-into-AUCTeX t t)
 '(textlint-location-vm (quote textlint-location-vm-windows)))

(eval-after-load "auto-complete"
  '(progn
     (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)    
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)


  
(provide 'init-spelling)
