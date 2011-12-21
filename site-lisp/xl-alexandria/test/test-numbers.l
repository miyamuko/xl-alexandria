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
  ;; TODO
  (assert-equalp '() (factorial))
  )

(define-test numbers/subfactorial
  ;; TODO
  (assert-equalp '() (subfactorial))
  )

