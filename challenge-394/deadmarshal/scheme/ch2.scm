(import (chicken base)
	(chicken sort)
	srfi-1
	srfi-13)

(define (vowel? c)
  (and (memv c '(#\a #\e #\i #\o #\u)) #t))

(define (tails l)
  (if (null? l)
      '()
      (cons l (tails (cdr l)))))

(define (run prev rest)
  (cond ((null? rest) '())
	((not (eq? (vowel? prev) (vowel? (car rest))))
	 (cons (car rest) (run (car rest) (cdr rest))))
	(else '())))

(define (alt-run l)
  (if (null? l)
      '()
      (cons (car l) (run (car l) (cdr l)))))

(define (prefixes l)
  (map (lambda (n) (take l n))
       (iota (length l) 1)))

(define (alternating-vowels-consonants strs)
  (let* ((lowered (map string-downcase strs))
         (sorted  (sort lowered
                        (lambda (a b)
                          (<= (string-length a) (string-length b)))))
         (src     (car sorted))
         (others  (cdr sorted))
         (candidates
          (append-map
           (lambda (t) (map list->string (prefixes (alt-run t))))
           (tails (string->list src))))
         (common
          (filter
           (lambda (p)
             (and (not (string=? p ""))
                  (every (lambda (o) (string-contains o p)) others)))
           candidates)))
    (if (null? common)
        '()
        (let ((mx (apply max (map string-length common))))
          (sort (delete-duplicates
                 (filter (lambda (p) (= (string-length p) mx)) common)
                 string=?)
                string<?)))))

(for-each (lambda (e)
	    (begin
	      (display (alternating-vowels-consonants e))
	      (newline)))
	  '(("relocate" "delocate" "allocate")
	    ("apple" "banana" "cherry")
	    ("navigate" "cavity" "gravity")
	    ("pedalgia" "pedalboard" "pedantic")
	    ("schoolmaster" "schoolhouse" "schooling")))

