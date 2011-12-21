; -*- mode: lisp; package: alexandria.test.macros; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.macros
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

(in-package :alexandria.test.macros)

(remove-all-tests :alexandria.test.macros)

(define-test macros/parse-ordinary-lambda-list
  ;; TODO
  (assert-equalp '() (parse-ordinary-lambda-list))
  )

(define-test macros/destructuring-case
  ;; TODO
  (assert-equalp '() (destructuring-case))
  )

(define-test macros/destructuring-ccase
  ;; TODO
  (assert-equalp '() (destructuring-ccase))
  )

(define-test macros/destructuring-ecase
  ;; TODO
  (assert-equalp '() (destructuring-ecase))
  )

