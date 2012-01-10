; -*- mode: lisp; package: alexandria.test.numbers; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.numbers
  (:use :lisp :editor
   :lisp-unit
   :alexandria
   )
  (:shadowing-import-from :alexandria
   ;; conflict with :lisp
   :copy-file
   :featurep
   ;; conflict with :lisp-unit
   :set-equal
   )
  )

(in-package :alexandria.test.numbers)

(remove-all-tests :alexandria.test.numbers)

(define-test numbers/factorial
  (assert-equal '(1 1 2 6 24 120 720 5040 40320 362880)
      (mapcar #'factorial (iota 10)))
  )

(define-test numbers/subfactorial
  (assert-equal '(1 0 1 2 9 44 265 1854 14833 133496)
      (mapcar #'subfactorial (iota 10)))
  (assert-equal 148349
      (apply #'+ (mapcar #'subfactorial '(1 4 8 3 4 9))))
  )

