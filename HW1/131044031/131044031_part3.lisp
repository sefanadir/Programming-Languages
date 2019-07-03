(load "csv-parser.lisp")
(in-package :csv-parser)

;; (read-from-string STRING)
;; This function converts the input STRING to a lisp object.
;; In this code, I use this function to convert lists (in string format) from csv file to real lists.

;; (nth INDEX LIST)
;; This function allows us to access value at INDEX of LIST.
;; Example: (nth 0 '(a b c)) => a

;; !!! VERY VERY VERY IMPORTANT NOTE !!!
;; FOR EACH ARGUMENT IN CSV FILE
;; USE THE CODE (read-from-string (nth ARGUMENT-INDEX line))
;; Example: (mypart1-funct (read-from-string (nth 0 line)) (read-from-string (nth 1 line)))

;; DEFINE YOUR FUNCTION(S) HERE
(defun  insert-n-recursive (liste number index insertList checkIndex)
    (if (= (list-length liste) 0)
        (if (< checkIndex index)
            (push number insertList)
            insertList
        )
    )
    (if (= index checkIndex )
        (push number insertList)
    )
    (if (/= (list-length liste) 0)
        (push (first liste) insertList)
    )
    (if (/= (list-length liste) 0)
        (setq insertList (insert-n-recursive (cdr liste) number index insertList (+ checkIndex 1)))
    )
    insertList
)
(defun insert-n  (liste number index)

    (setq insertList '())
    (setq checkIndex 0)
    (if (< index 0)
        (write-line "Invalid index. Did not add element to list")
    )
    (if (>= index 0)
        (setq liste(reverse(setq liste (insert-n-recursive liste number index insertList checkIndex))))
    )
    liste
)


;; MAIN FUNCTION
(defun main ()
  	(with-open-file (stream #p"input_part3.csv")
    	(loop :for line := (read-csv-line stream) :while line :collect
	      	(format t "~a~%"
	      	;; CALL YOUR (MAIN) FUNCTION HERE
	      		(insert-n (read-from-string (nth 0 line)) (read-from-string (nth 1 line)) (read-from-string (nth 2 line)))	
	      	)
    	)
  	)
)

;; CALL MAIN FUNCTION
(main)
