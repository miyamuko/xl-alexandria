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
  (assert-equal "G1" (symbol-name (alexandria:make-gensym 1)))
  (assert-equal "G2" (symbol-name (alexandria:make-gensym 2)))
  (assert-equal "G100" (symbol-name (alexandria:make-gensym 100)))

  (let ((*gensym-counter* 0))
    (assert-equal "foo0" (symbol-name (alexandria:make-gensym "foo")))
    (assert-equal "bar1" (symbol-name (alexandria:make-gensym :bar)))
    (assert-equal "baz2" (symbol-name (alexandria:make-gensym 'baz)))
    )
  )

(define-test symbols/symbolicate
  (assert-equal '|| (symbolicate))
  (assert-equal '|| (symbolicate ""))
  (assert-equal 'f (symbolicate "f"))
  (assert-equal 'foobar (symbolicate "foo" "bar"))
  (assert-equal 'foo1 (symbolicate "foo" "1"))
  (assert-equal 'foo_bar123 (symbolicate 'foo "_" 'bar "123"))
  )

