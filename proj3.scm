(define performtask
  (lambda (n roster)
    (cond ((= n 0) (begin
                    (display "\n\tNow resetting roster!\n")
                    (menu '())
                    ))
          ((= n 1) (begin
                    (display "\n\tNow loading roster.\n")
                    (menu roster)
                    ))
          ((= n 2) (begin
                    (display "\n\tNow storing roster.\n")
                    (menu roster)
                    ))
          ((= n 3) (begin
                    (display "\n\tDisplaying Roster by ID.\n")
                    (menu roster)
                    ))
          ((= n 4) (begin
                    (display "\n\tPrinting list.\n")
                    (menu roster)
                    ))
          ((= n 5) (begin
                    (display "\n\tAdding a student to roster.\n")
                    (menu roster)
                    ))
          ((= n 6) (begin
                    (display "\n\tRemoving a student from the roster.\n")
                    (menu roster)
                    ))
          ((= n 7) (begin
                    (display "\n\tNow exiting!\n")
                    #t
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
