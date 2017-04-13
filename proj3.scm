(define read3items
  (lambda (n l)
    (cond ((= n 0) (begin
                    (display "\nInput ID: ")
                    (read3items 1 (list (read-line)))
                    ))
          ((= n 1) (begin
                    (display "\nInput Name: ")
                    (read3items 2 (list (car l) (read-line)))
                    ))
          ((= n 2) (begin
                    (display "\nInput Grade: ")
                    (list (car l) (car(cdr l)) (read-line))
                    ))
    )
  )
)

(define smallest
  (lambda (roster min)
    (cond
      ((equal? roster '()) min)
      ((< (string->number (car (car roster))) (string->number (car min)))
        (smallest (cdr roster) (car roster)))
      (else
        (smallest (cdr roster) min))
    )
  )
)

(define sortRemove
  (lambda (roster victim)
    (cond ((null? roster) '())
      ((equal? (car (car roster)) (car victim)) (cdr roster))
      (else (cons (car roster) (sortRemove (cdr roster) victim)))
    )
  )
)

(define selectSort
  (lambda (roster)
    (begin
      (cond ((null? roster) '())
            (else (cons (smallest roster (car roster))
                (selectSort (sortRemove roster (smallest roster (car roster)))))
            )
      )
    )
  )
)

(define loadFromFile
  (lambda (roster)
    (begin
      (define in (open-input-file "my_data.txt"))
      (define my_new_roster (read in))
      (close-input-port in)
      my_new_roster
    )
  )
)


(define saveToFile
  (lambda (roster)
    (begin
      (define out (open-output-file "my_data.txt"))
      (write roster out)
      (close-output-port out)
      roster
    )
  )
)


(define removeElement
  (lambda (h tail)
    (begin
      (display "\nWhich student do you want to remove from the")
      (display "roster?\n>>")
      (removeElementInner (read-line) h tail)
    )
  )
)

;Not working for now.
(define removeElementInner
  (lambda (s h tail)
    (begin
      (display s)
      (if (null tail) (begin
                              (display "ERR: name doesn't exist.\n")
                              ('())))
      (if (equal? s (car (cdr h))) tail (removeElementInner s (car tail) (cdr tail)))
    )
  )
)

(define performtask
  (lambda (n roster)
    (cond ((= n 0) (begin
                    (display "\n\tNow resetting roster!\n")
                    (menu '())
                    ))
          ((= n 1) (begin
                    (display "\n\tNow loading roster.\n")
                    (menu (loadFromFile roster))
                    ))
          ((= n 2) (begin
                    (display "\n\tNow storing roster.\n")
                    (menu (saveToFile roster))
                    ))
          ((= n 3) (begin
                    (display "\n\tDisplaying Roster by ID.\n")
                    (display (selectSort roster))
                    (newline)
                    (menu roster)
                    ))
          ((= n 4) (begin
                    (display "\n\tPrinting list.\n")
                    (display roster)
                    (newline)
                    (menu roster)
                    ))
          ((= n 5) (begin
                    (display "\n\tAdding a student to roster.\n")
                    (menu (cons (read3items 0 '()) roster))
                    ))
          ((= n 6) (begin
                    (menu (removeElement (car roster) (cdr roster)))
                    ))
          ((= n 7) (begin
                    (display "\n\tNow exiting!\n")
                    #t
                    ))
          (else    (begin
                    (display "\n\tInvalid input. Your input, ")
                    (display n)
                    (display ", does not exist for this menu.\n")
                    (menu roster)
                    ))
    )
  )
)


(define menu
  (lambda (roster)
    (begin
      (display "\t========\n")
      (display "\t  MENU\n")
      (display "\t========\n")
      (display "\t0. Reset roster\n")
      (display "\t1. Load roster from file\n")
      (display "\t2. Store roster to file\n")
      (display "\t3. Display roster sorted by ID\n")
      (display "\t4. Display student info\n")
      (display "\t5. Add a student to roster\n")
      (display "\t6. Remove a student from roster\n")
      (display "\t7. Exit")
      (display "\n>> ")
      (performtask (read) roster)
    )
  )
)
