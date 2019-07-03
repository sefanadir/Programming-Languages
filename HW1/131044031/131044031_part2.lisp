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
(defun  merge-list-recursive (liste1 liste2 combineList)
    (if (null (or liste1 liste2))
         (reverse combineList)
    )
    (if (/= (list-length liste1) 0 )
        (push (first liste1) combineList)
    )
    (if (/= (list-length liste1) 0 )
        (setq combineList (merge-list-recursive (cdr liste1) (cdr liste2) combineList))
    )
    (if (/= (list-length liste2) 0 )
        (push (first liste2) combineList)
    )
    (if (and (/= (list-length liste2) 0 ) (= (list-length liste1) 0 ))
        (setq combineList (merge-list-recursive liste1 (cdr liste2) combineList))
    )
    combineList
)
(defun merge-list (liste1 liste2)
    (setq combineList '())
    (setq combineList (merge-list-recursive liste1 (reverse liste2) combineList))
    (reverse combineList)
)


;; MAIN FUNCTION
(defun main ()
  	(with-open-file (stream #p"input_part2.csv")
    	(loop :for line := (read-csv-line stream) :while line :collect
	      	(format t "~a~%"
	      	;; CALL YOUR (MAIN) FUNCTION HERE
	      		(merge-list (read-from-string (nth 0 line)) (read-from-string (nth 1 line)))	
	      	)
    	)
  	)
)

;; CALL MAIN FUNCTION
(main)
