; -*- mode: lisp; package: alexandria.test.conditions; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.conditions
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

(in-package :alexandria.test.conditions)

(remove-all-tests :alexandria.test.conditions)

(define-test conditions/required-argument
  ;; TODO
  (assert-equalp '() (required-argument))
  )

(define-test conditions/ignore-some-conditions
  ;; TODO
  (assert-equalp '() (ignore-some-conditions))
  )

(define-test conditions/simple-style-warning
  ;; TODO
  (assert-equalp '() (simple-style-warning))
  )

(define-test conditions/simple-reader-error
  ;; TODO
  (assert-equalp '() (simple-reader-error))
  )

(define-test conditions/simple-parse-error
  ;; TODO
  (assert-equalp '() (simple-parse-error))
  )

(define-test conditions/simple-program-error
  ;; TODO
  (assert-equalp '() (simple-program-error))
  )

