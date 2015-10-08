(require-package 'tuareg)

;; https://github.com/the-lambda-church/merlin
(require-package 'merlin)


(require-package 'flycheck-ocaml)
(with-eval-after-load 'merlin
 ;; Disable Merlin's own error checking
 (setq merlin-error-after-save nil)

 ;; Enable Flycheck checker
 (flycheck-ocaml-setup))

(add-hook 'tuareg-mode-hook #'merlin-mode)
   
(provide 'init-ocaml)