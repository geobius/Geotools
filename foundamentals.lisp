(in-package :geotools-library)

(defun forward-geodetic (x-initial y-initial distance azimuth)
  (let ((x-final (+ x-initial (* distance (sin azimuth))))
        (y-final (+ y-initial (* distance (cos azimuth)))))
    (cons x-final y-final)))

(defun square (x) (* x x))



(defun reverse-geodetic (x1 y1 x2 y2)
  (let ((distance (sqrt (+ (square (- x2 x1)) (square (- y2 y1)))))
        (azimuth  (mod (atan (- x2 x1) (- y2 y1)) (* 2 pi))))
    (cons distance azimuth)))

;;distance and azimuth lists must have the same size. azimuths are in radians


(defun tachimetry (x-ref y-ref absolute-distances-list azimuths-list)
  (mapcar
   (lambda (length angle) (forward-geodetic x-ref y-ref length angle))
   absolute-distances-list
   azimuths-list))
  



(defun traversing (x y relative-distances-list azimuths-list) 
  (if (null relative-distances-list) nil
      (let* ((res (forward-geodetic x y (car relative-distances-list) (car azimuths-list)))
	     (x-new (car res))
	     (y-new (cdr res)))
	(cons res
	 (traversing x-new y-new (cdr relative-distances-list) (cdr azimuths-list))))))


