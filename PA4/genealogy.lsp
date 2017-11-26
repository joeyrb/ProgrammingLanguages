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

; use LISP structs to create and access genealogy DB
(defstruct person name gender parents children)

; Male filter
(defun malefilter

)

; Female filter
(defun femalefilter

)

(defun getFamTree (inputFile)
	; Check for file
	(setf fin (open inputFile :if-does-not-exist nil))   ; open file, returning NIL on error
    (when (null fin) (return-from getFamTree (format nil "Error: cannot open file ~a~%" inputFile)))

    ; read file and dump contents
    (format t "Contents of ~a:~%" inputFile)
    (do ((data (read fin nil) (read fin nil)))          ; read entire file, returning NIL at EOF
        ((null data) (close fin))                       ; exit when file is read
        (format t "~a~%" data)                          ; print what we read
    )
)

; main function
(defun main ( args )
	; (format t "~D command line arguments ~A" (length args) args)
	; ~D = # args, ~A = name of args
	(getFamTree *args*)
)



; call main function w/ command line args
; (main *args*)

(getFamTree (car *args*))