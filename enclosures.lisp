(defun makc ()
  (let ((c 0)) 
  (list 
  (lambda () (setq c (+ 1 c))) 
  (lambda () (setq c 0))  
  ))
)


(defvar enclose (makc))
(defvar getc (car enclose))
(defvar setc (cadr enclose))


(print (funcall getc))
(print (funcall getc))
(print (funcall getc))
(print (funcall getc))
(print (funcall getc))
(print (funcall setc))
(print (funcall getc))