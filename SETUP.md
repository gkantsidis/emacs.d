# Extra setup steps

## Dictionary

Use `hunspell` (it is also part of the configuration process, `hunspell.portable`).
If it compaints that it cannot find the dictionary, check the dictionaries installed with
`hunspell -D`. You can change it in emacs configuration options, and, if necessary, copy
the default dictionary to what emacs expects to find.

In addition, in the configuration menu for spelling, do:

- Set the path to `hunspell` executable.

- Set the dictionary according to:

  ```emacs
  (setq ispell-local-dictionary-alist
	 '(("en_US"
		"[[:alpha:]]"
		"[^[:alpha:]]"
		"[']" nil ("-r") nil utf-8)
  ```

I could place those definitions in `lisp/init-spelling.el`, but then I would force those configurations to everyone.

## Integration with windows

From: <http://www.emacswiki.org/emacs/EmacsMsWindowsIntegration>

Create a startup task to run emacs upon login:

1. Open `Win+R` and then `shell:startup`

1. Add an entry for emacs with target
   `C:\tools\lib\Emacs\tools\emacs\bin\emacs.exe "--daemon"`
   (adjust location of `Emacs`)

Open files with `emacsclientw`.

Create shortcut: emacsclientw.exe -na runemacs.exe -c ""

Create associations (from an admin cmd):

ftype txtfile=emacsclientw -na runemacs "%1"
ftype EmacsLisp=emacsclientw -na runemacs "%1"
ftype CodeFile=emacsclientw -na runemacs "%1"
assoc .txt=txtfile
assoc .text=txtfile
assoc .log=txtfile
assoc .el=EmacsLisp
assoc .c=CodeFile
assoc .h=CodeFile
assoc .tex=CodeFile
assoc .bib=CodeFile
assoc .csv=txtfile
assoc .tab=txtfile

## Additional programs / libraries to install

1. zlib
   Install zlib from <http://gnuwin32.sourceforge.net/packages/zlib.htm>

1. GnuPG
   TBD

