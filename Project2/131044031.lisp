(defun parser_wrapper (tokenList)
	(cond   ((null tokenList) 
				0
			) 
			(t
				(with-open-file (out "131044031.tree"
				                     :direction :output
				                     :if-exists :append
				                     :if-does-not-exist :create)
					(if (= 1 (length tokenList))  
						(format out "~S" (car tokenList) )
						(format out "~S~%" (car tokenList) )
					)
				)	
				(parser_wrapper (cdr tokenList))		
			)
	)
)
(defun parser( tokenList )
	(with-open-file (out "131044031.tree"
	                     :direction :output
	                     :if-exists :append
	                     :if-does-not-exist :create)
		(format out "; DIRECTIVE: print ~%")
	)	
	(parser_wrapper tokenList)
)
