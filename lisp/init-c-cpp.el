;;; init-c-cpp.el --- Customize environment for C/C++ programming
;;; Commentary:
;;;  Declares packages and performs customizations for C/C++ programming.

;;
;; C/C++
;;

;;; Code:
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

(require-package 'ac-etags)
(custom-set-variables
    '(ac-etags-requires 1))
(eval-after-load "etags"
    '(progn
        (ac-etags-setup)))
(defun my/c-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))

(add-hook 'c-mode-common-hook 'my/c-mode-common-hook)



(provide 'init-c-cpp)
;;; init-c-cpp.el ends here
