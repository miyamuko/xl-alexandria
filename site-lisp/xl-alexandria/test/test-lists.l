; -*- mode: lisp; package: alexandria.test.lists; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.lists
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

(in-package :alexandria.test.lists)

(remove-all-tests :alexandria.test.lists)

(define-test lists/reversef
  (let* ((a (list 1 2 3 4))
         (b a)
         (c nil))
    (reversef a)
    (assert-equal '(4 3 2 1) a)
    (assert-equal '(1 2 3 4) b)

    (reversef c)
    (assert-equal nil c)
    )
  )

(define-test lists/nreversef
  (let ((a (list 1 2 3 4))
        (c nil))
    (reversef a)
    (assert-equal '(4 3 2 1) a)

    (reversef c)
    (assert-equal nil c)
    )
  )

(define-test lists/ensure-car
  (assert-equal '(nil) (ensure-cons nil))
  (assert-equal (cons 1 2) (ensure-cons (cons 1 2)))
  (assert-equal '("foo") (ensure-cons "foo"))
  )

(define-test lists/remove-from-plistf
  (let* ((a (list :foo 1 :bar 2 :baz 3))
         (b a)
         (c nil))
    (remove-from-plistf a :foo :bar)
    (assert-equal '(:baz 3) a)
    (assert-equal '(:foo 1 :bar 2 :baz 3) b)

    (remove-from-plistf c)
    (assert-equal nil c)
    )
  )

(define-test lists/delete-from-plist
  (let* ((a (list :foo 1 :bar 2 :baz 3))
         (c nil))
    (assert-equal '(:baz 3)
        (delete-from-plist a :foo :bar))
    (assert-equal '(:foo 1 :bar 2 :baz 3) a)

    (assert-equal nil (delete-from-plist c :foo :bar))
    (assert-equal nil c)
    )
  )

(define-test lists/delete-from-plistf
  (let* ((a (list :foo 1 :bar 2 :baz 3))
         (c nil))
    (delete-from-plistf a :foo :bar)
    (assert-equal '(:baz 3) a)

    (delete-from-plist c :foo :bar)
    (assert-equal nil c)
    )
  )
