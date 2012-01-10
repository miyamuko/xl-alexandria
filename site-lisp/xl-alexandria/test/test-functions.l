; -*- mode: lisp; package: alexandria.test.functions; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.functions
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
  (:shadowing-import-from :ansify
   :fdefinition
   )
  )

(in-package :alexandria.test.functions)

(remove-all-tests :alexandria.test.functions)

(define-test functions/ensure-function
  (assert-equal #'car (ensure-function 'car))
  (assert-equal #'car (ensure-function #'car))
  (assert-equal (fdefinition '(setf last-elt)) (ensure-function '(setf last-elt)))
  )

(define-test functions/ensure-functionf
  (let ((a 'car))
    (ensure-functionf a)
    (assert-equal #'car a))
  (let ((a #'car))
    (ensure-functionf a)
    (assert-equal #'car a))
  (let ((a '(setf last-elt)))
    (ensure-functionf a)
    (assert-equal (fdefinition '(setf last-elt)) a))
  )

