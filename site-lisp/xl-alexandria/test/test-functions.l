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
  )

(in-package :alexandria.test.functions)

(remove-all-tests :alexandria.test.functions)

(define-test functions/ensure-function
  ;; TODO
  (assert-equalp '() (ensure-function))
  )

(define-test functions/ensure-functionf
  ;; TODO
  (assert-equalp '() (ensure-functionf))
  )

