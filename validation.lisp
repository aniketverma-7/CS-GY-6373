  (defmacro validate (function)
    (let* ((function_name (second function)) 
          (args (car (cddr function)))
          (validArgs '(x y z))
          (verdict "")
          (f (char-int (char (string function_name) 0)))
         )
    
        (if (not (and (>= f 65) (<= f 90)) )
        (setq verdict (concatenate 'string verdict (format nil "~%Invalid function name: ~a is not an atom.~%" function_name)))  
        (setq verdict (concatenate 'string verdict (format nil "~%Valid function name: ~a is an atom.~%" function_name)))  
    )
    ;invalid argument checkpoint
    (dolist (item args) 
        (if (not (find item validArgs))
            (setq verdict (concatenate 'string verdict (format nil "Invalid argument: ~a~%" item)))
            (setq verdict (concatenate 'string verdict (format nil "Valid argument: ~a~%" item)))
        )
    )

    (if (= (length verdict) 0)
        (format t "No error founds, function defination is valid.~%")    
        (format t "The verdict of validate function is as following: ~a~%" verdict)
    )
    )    
)



(validate (defun abc (x) …))
(validate (defun 0.0g (x y) …))
(validate (defun 123g (a b c) …))
(validate (defun fucn_add (x y z) …))