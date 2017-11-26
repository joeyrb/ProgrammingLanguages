#|
		***genealogy.lsp***

Description:
Write a Lisp program that reads in a file of family relationships, builds a database, and then allows
queries to that database. Queries include: parents, mothers, fathers, children, sons, daughters, siblings,
sisters, brothers, grandparents, grandfathers, grandmothers, grandchildren, grandsons,
granddaughters, uncles, aunts, nieces, nephews, cousins, male-cousins, female-cousins, ancestors, maleancestors,
female-ancestors, descendants, male-descendants, and female-descendants.

Usage : $>> clisp –repl genealogy.lsp family.dat
|#


; main function
(defun main ( args )
	"(main args): main function called with command-line args"
	(format t "~D command line arguments ~A" (length args) args)
)

; call main function w/ command line args
(main *args*)