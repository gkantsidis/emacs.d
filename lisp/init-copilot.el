;;; init-copilot.el --- Support for CoPilot
;;; Commentary:
;;; Code:

(require-package 'quelpa)
(require-package 'quelpa-use-package)
(require-package 'use-package)

(quelpa
 '(copilot :fetcher github
           :repo "zerolfx/copilot.el"
           :branch "main"
           :files ("dist" "*.el")))

(use-package copilot)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(provide 'init-copilot)
;;; init-copilot.el ends here
