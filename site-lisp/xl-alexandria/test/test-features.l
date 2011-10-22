; -*- mode: lisp; package: alexandria.test.features; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.features
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

(in-package :alexandria.test.features)

(remove-all-tests :alexandria.test.features)

(define-test features/featurep
  (let ((*features* '(:foo :bar :baz)))
    (assert-equal t (alexandria::featurep :foo))
    (assert-equal t (alexandria::featurep :bar))
    (assert-equal t (alexandria::featurep :baz))

    (assert-equal t (alexandria::featurep '(or :foo)))
    (assert-equal t (alexandria::featurep '(or :foo :hoge)))
    (assert-equal t (alexandria::featurep '(or :hoge :bar)))
    (assert-equal t (alexandria::featurep '(or :hoge :fuga :baz)))

    (assert-equal t (alexandria::featurep '(and :foo)))
    (assert-equal t (alexandria::featurep '(and :foo :bar)))
    (assert-equal t (alexandria::featurep '(and :foo :bar :baz)))


    (assert-equal nil (alexandria::featurep :foo2))
    (assert-equal nil (alexandria::featurep :bar2))
    (assert-equal nil (alexandria::featurep :baz2))

    (assert-equal nil (alexandria::featurep '(or :foo2)))
    (assert-equal nil (alexandria::featurep '(or :foo2 :hoge)))
    (assert-equal nil (alexandria::featurep '(or :hoge :bar2)))
    (assert-equal nil (alexandria::featurep '(or :hoge :fuga :baz2)))

    (assert-equal nil (alexandria::featurep '(and :foo2)))
    (assert-equal nil (alexandria::featurep '(and :foo2 :bar)))
    (assert-equal nil (alexandria::featurep '(and :foo2 :bar :baz)))
    ))
