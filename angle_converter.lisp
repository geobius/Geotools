(in-package :geotools-library)
;;the *angular-units* lookup table has stored the name of each unit and the required ammount to
;;complete a circle

(defvar *angular-units* (alexandria:alist-hash-table 
  '(
    (grads . 400)
    (degrees . 360)
    (radians . 6.28318530718)
    (revolutions . 1)
    (hour . 24)
    ))
  )

(defun angular-unit-convertion (angle-value source-unit-of-measurement destination-unit-of-measurement)
  (let (
	(dividend (gethash destination-unit-of-measurement *angular-units*))
	(divisor (gethash source-unit-of-measurement *angular-units* )))
    
    (* angle-value (/ dividend divisor))))

(defun sexadecimal->decimal (sexadecimal-angle)
  (let (
	(a (first sexadecimal-angle))
	(b (second sexadecimal-angle))
	(c (third sexadecimal-angle)))
    
    (+ a (/ b 60) (/ c 3600))))

(defun decimal->sexadecimal (decimal-angle)
  (let* (
	(a (floor decimal-angle))
	(b (floor (* (- decimal-angle a) 60)))
	(c (* (- (* (- decimal-angle a) 60) b) 60)))
    
    (list a b c)))
