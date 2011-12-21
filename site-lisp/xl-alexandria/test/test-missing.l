; -*- mode: lisp; package: alexandria.test.missing; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.missing
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

(in-package :alexandria.test.missing)

(remove-all-tests :alexandria.test.missing)

(define-test missing/set-documentation
  (defun set-documentation-test ()
    "test-function"
    nil)
  (defvar set-documentation-test nil
    "test-variable")
  (assert-equal
      "test-function"
      (documentation 'set-documentation-test 'function))
  (assert-equal
      "test-variable"
      (documentation 'set-documentation-test 'variable))

  (setf (documentation 'set-documentation-test 'function) "test-function2")
  (setf (documentation 'set-documentation-test 'variable) "test-variable2")
  (assert-equal
      "test-function2"
      (documentation 'set-documentation-test 'function))
  (assert-equal
      "test-variable2"
      (documentation 'set-documentation-test 'variable))
  )

(define-test missing/bit
  (let ((bitvector (make-vector 8 'element-type 'bit :initial-element 0)))
    (assert-equal
        0
        (alexandria::bit bitvector 0))
    (setf (alexandria::bit bitvector 0) 1)
    (assert-equal
        1
        (alexandria::bit bitvector 0))
    ))

(define-test missing/reduce
  (assert-equal 0 (alexandria::reduce #'+ '()
                          :key #'length))
  (assert-equal 3 (alexandria::reduce #'+ '("foo")
                          :key #'length))
  (assert-equal 6 (alexandria::reduce #'+ '("foo" "bar")
                          :key #'length))

  (assert-equal 120 (alexandria::reduce #'* '(1 2 3 4 5)))
  (assert-equal '(i n i t 1 2) (alexandria::reduce #'append '((1) (2)) :initial-value '(i n i t)))
  (assert-equal '(1 2 i n i t)  (alexandria::reduce #'append '((1) (2)) :from-end t :initial-value '(i n i t)))
  (assert-equal -8 (alexandria::reduce #'- '(1 2 3 4)))
  (assert-equal -2 (alexandria::reduce #'- '(1 2 3 4) :from-end t))
  (assert-equal 0 (alexandria::reduce #'+ '()))
  (assert-equal 3 (alexandria::reduce #'+ '(3)))
  (assert-equal 'foo (alexandria::reduce #'+ '(foo)))
  (assert-equal '(((1 2) 3) 4) (alexandria::reduce #'list '(1 2 3 4)))
  (assert-equal '(1 (2 (3 4))) (alexandria::reduce #'list '(1 2 3 4) :from-end t))
  (assert-equal '((((foo 1) 2) 3) 4) (alexandria::reduce #'list '(1 2 3 4) :initial-value 'foo))
  (assert-equal '(1 (2 (3 (4 foo)))) (alexandria::reduce #'list '(1 2 3 4) :from-end t :initial-value 'foo))
  )
