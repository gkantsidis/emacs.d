;;; package --- Summary
;; Initialization of LaTeX-math-mode
;; Instructions from:
;; 1. http://www.emacswiki.org/emacs/AUCTeX
;; 2. https://github.com/xyguo/emacs.d/blob/master/lisp/init-auctex.el

;;; Commentary:
;; Includes various packages that make working with Emacs easy.

;;; Code:
(require-package 'auctex)

(require 'tex-mik)

(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list ;; 'auto-fill-mode
       'LaTeX-math-mode
       'turn-on-reftex
       'TeX-fold-mode
       'linum-mode
       'auto-complete-mode
       'electric-pair-mode
       'outline-minor-mode))


(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq ;;TeX-auto-untabify t     ; remove all tabs before saving
             TeX-engine 'xetex       ; use xelatex default
             TeX-show-compilation nil) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            ;;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))


;; configuration for TeX-fold-mode
;; add entries you want to be fold, or comment that needn't to be fold.
(setq TeX-fold-env-spec-list
      (quote (("[figure]" ("figure"))
              ("[table]" ("table"))
              ("[itemize]" ("itemize"))
              ("[description]" ("description"))
              ("[tabular]" ("tabular"))
              ("[frame]" ("frame"))
              ("[array]" ("array"))
              ("[code]" ("lstlisting"))
              ;;              ("[eqnarray]" ("eqnarray"))
              )))


;; configuration for reftex


;; make the toc displayed on the left
(setq reftex-toc-split-windows-horizontally t)
;; adjust the fraction
(setq reftex-toc-split-windows-fraction 0.3)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(defun latex-help-get-cmd-alist () ;corrected version:
  "Scoop up the commands in the index of the latex info manual.
The values are saved in `latex-help-cmd-alist' for speed."
  ;; mm, does it contain any cached entries
  (if (not (assoc "\\begin" latex-help-cmd-alist))
      (save-window-excursion
        (setq latex-help-cmd-alist nil)
        (Info-goto-node (concat latex-help-file "Command Index"))
        (end-of-buffer)
        (while (re-search-backward "^\\* \\(.+\\): *\\(.+\\)\\." nil t)
          (setq key (ltxh-buffer-substring (match-beginning 1) (match-end 1)))
          (setq value (ltxh-buffer-substring (match-beginning 2) (match-end 2)))
          (setq latex-help-cmd-alist
                (cons (cons key value) latex-help-cmd-alist))))
    )
  latex-help-cmd-alist
  )


(require-package 'cdlatex)
(require 'cdlatex)

;;
;; Outline
;;
(require-package 'outline-magic)
(add-hook 'latex-mode-hook      ; or 'LaTeX-mode-hook for AUCTeX
          (lambda ()
            (setq outline-promotion-headings
                  '("\\chapter" "\\section" "\\subsection"
                    "\\subsubsection" "\\paragraph" "\\subparagraph"))))

(add-hook 'texinfo-mode-hook
          (lambda ()
            (setq outline-promotion-headings
                  '("@chapter" "@section" "@subsection" "@subsubsection" nil
                    "@unnumbered" "@unnumberedsec" "@unnumberedsubsec"
                    "@unnumberedsubsubsec" nil
                    "@appendix" "@appendixsec" "@appendixsubsec"
                    "@appendixsubsubsec" nil
                    "@chapheading" "@heading" "@subheading" "@subsubheading"))))

;;
;; Emacs minor mode for avoiding cliches and bad grammar when writing about art (or other topics)
;;
(require-package 'artbollocks-mode)
(add-hook 'text-mode-hook 'artbollocks-mode)

;;
(require-package 'auto-complete-auctex)

(require-package 'auctex-latexmk)
(auctex-latexmk-setup)

(setq reftex-plug-into-AUCTeX t)

(require-package 'latex-extra)
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

(require-package 'latex-pretty-symbols)

(setq doc-view-ghostscript-program "gswin64c")

;; Turn on RefTeX for AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
(setq reftex-plug-into-AUCTeX t)

;;
;; EXPERIMENTAL AND NOT WORKING
;;

;; (load "preview-latex.el" nil t t)

;; (require-package 'latex-preview-pane)

;; Set bibtex dialect to biblatex
; (bibtex-set-dialect 'biblatex)


;;
;; End of configuration
;;

(provide 'init-latex)
;;; init-latex.el ends here
