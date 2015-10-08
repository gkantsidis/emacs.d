;;
;; C/C++
;;

(require-package 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require-package 'ac-c-headers)
(add-hook 'c-mode-hook
            (lambda ()
              (add-to-list 'ac-sources 'ac-source-c-headers)
              (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(require-package 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)              

(provide 'init-c-cpp)