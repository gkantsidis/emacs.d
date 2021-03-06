;;
;; -*-CEDET-*_
;; Collection of Emacs Development Environment Tools
;;
;; See also: http://cedet.sourceforge.net/
;;


(require-package cedet)

(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

(provide 'init-cedet)