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
  (assert-error 'simple-error
      (required-argument "foo"))
  )

(define-test conditions/ignore-some-conditions
  (assert-equal nil
      (handler-case
          (ignore-some-conditions (simple-error)
            (error (make-condition 'simple-error)))
        (error (c)
          c)))
  (assert-equal nil
      (handler-case
          (ignore-some-conditions (error)
            (error (make-condition 'simple-error)))
        (error (c)
          c)))
  (assert-error 'error
      (ignore-some-conditions (simple-error)
        (error (make-condition 'error))))
  )

(define-test conditions/simple-style-warning
  (assert-error 'simple-style-warning
      (simple-style-warning "message"))
  )

(define-test conditions/simple-reader-error
  (assert-error 'simple-reader-error
      (simple-reader-error (make-string-input-stream "") "message"))
  )

(define-test conditions/simple-parse-error
  (assert-error 'simple-parse-error
      (simple-parse-error "message"))
  )

(define-test conditions/simple-program-error
  (assert-error 'simple-program-error
      (simple-program-error "message"))
  )

