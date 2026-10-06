(import srfi-1)

(define (upper-positions s)
  (filter (lambda (i)
	    (let ((c (string-ref s i)))
	      (and (char>=? c #\A) (char<=? c #\Z))))
	  (iota (string-length s))))

(define (cost upper start)
  (fold (lambda (u t acc) (+ acc (abs (- u t))))
	0
	upper
	(iota (length upper) start 2)))

(define (alternate-case s)
  (let ((up (upper-positions s)))
    (min (cost up 0) (cost up 1))))

(for-each
 (lambda (e)
   (begin
     (display (alternate-case e))
     (newline)))
 '("aAbB" "AAbb" "AAAbbb" "aABb" "bBBAaa"))

