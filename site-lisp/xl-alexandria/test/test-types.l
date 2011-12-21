; -*- mode: lisp; package: alexandria.test.types; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.types
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

(in-package :alexandria.test.types)

(remove-all-tests :alexandria.test.types)

(define-test types/array-length
  ;; TODO
  (assert-equalp '() (array-length))
  )

(define-test types/coercef
  ;; TODO
  (assert-equalp '() (coercef))
  )

