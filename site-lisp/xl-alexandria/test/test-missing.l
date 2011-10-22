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

(define-test missing/fdefinition
  (assert-equal
      #'car
      (alexandria::fdefinition 'car))
  (assert-equal
      #'cdr
      (alexandria::fdefinition 'cdr))
  (assert-equal
      #'car
      (alexandria::fdefinition '(setf car)))
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
