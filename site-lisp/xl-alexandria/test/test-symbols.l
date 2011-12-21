; -*- mode: lisp; package: alexandria.test.symbols; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.symbols
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

(in-package :alexandria.test.symbols)

(remove-all-tests :alexandria.test.symbols)

(define-test symbols/make-gensym
  (assert-equalp '() (make-gensym))
  )

(define-test symbols/symbolicate
  ;; TODO
  (assert-equalp '() (symbolicate))
  )

