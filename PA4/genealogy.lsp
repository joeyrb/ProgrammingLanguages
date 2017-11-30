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

; GLOBAL database varaible
(defvar *database* (list nil))

; use LISP structs to create and access genealogy DB
(defstruct person 
    pername
    gender
    parents
    children
)

; Male filter
(defun malefilter (personlist)
    (remove-if (lambda (x) (string= (person-gender x) 'female)) personlist)
)

; Female filter
(defun femalefilter (personlist)
    (remove-if (lambda (x) (string= (person-gender x) 'male)) personlist)
)

; Queries the database to find the tuple for the given name.
(defun query (personname) 
    (cond
        ((checkmember personname *database*) (find-if (lambda (x) (string= (person-pername x) personname)) *database*))
        (t nil)
    )
)

; Recursively checks to see if the given name is in the given list. Returns T if the name is found, NIL if not.
(defun checkmember (personname lst)
    (cond 
        ((car lst) (or (string= (person-pername (car lst)) personname) (checkmember personname (cdr lst))))
        (t nil)
    )
)

; Returns children (if existing, else nil) of the person with the given name.
(defun children (name)
    (person-children (query name))
)

; Returns parents (if existing, else nil) of the person with the given name.
(defun parents (name)
    (person-parents (query name))
)

(defun siblings
    nil
)

(defun grandparents
    nil
)

(defun grandchildren
    nil
)

(defun cousins
    nil
)

(defun ancestors
    nil
)

(defun descendants
    nil
)

;*****************************

(defun mothers
    nil
)

(defun fathers
    nil
)

(defun sons
    nil
)

(defun daughters
    nil
)

(defun sisters
    nil
)

(defun brothers
    nil
)

(defun grandfathers
    nil
)

(defun grandmothers
    nil
)

(defun grandsons
    nil
)

(defun granddaughters
    nil
)

(defun uncles
    nil
)

(defun aunts
    nil
)

(defun nieces
    nil
)

(defun nephews
    nil
)

(defun male-cousins
    nil
)

(defun female-cousins
    nil
)

(defun male-ancestors
    nil
)

(defun female-ancestors
    nil
)

(defun male-descendants
    nil
)

(defun female-descendants
    nil
)


; Reads input file from command line and generates list for family tree
(defun getFamTree (inputFile)
	; Check for file
	(setf fin (open inputFile :if-does-not-exist nil))   ; open file, returning NIL on error
    (when (null fin) (return-from getFamTree (format nil "Error: cannot open file ~a~%" inputFile)))

    ; read file and dump contents
    (format t "Contents of ~a:~%" inputFile)
    (do ((data (read fin nil) (read fin nil)))
        ; read entire file, returning NIL at EOF
        ((null data) (close fin))                       
        ; exit when file is read
        (format t "~a~%" data)                          
        ; print what we read
        (setf *database* 
            (push 
                (make-person 
                    :pername (car data) 
                    :gender (car (cdr data)) 
                    :parents (car (cdr (cdr data))) 
                    :children (car (cdr (cdr (cdr data))))
                )
                *database*
            )
        )
        ; populate the database
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
