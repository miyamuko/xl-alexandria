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
  (:shadowing-import-from :ansify
   :typep
   )
  )

(in-package :alexandria.test.types)

(remove-all-tests :alexandria.test.types)

(define-test types/array-length
  (assert-true (typep 0 'array-length))
  (assert-true (typep 1 'array-length))
  (assert-true (typep array-dimension-limit 'array-length))

  (assert-false (typep -1 'array-length))
  (assert-false (typep (+ array-dimension-limit 1) 'array-length))

  (assert-true (typep 10 '(array-length 10)))
  (assert-false (typep 11 '(array-length 10)))
  )

(define-test types/coercef
  (let ((a "abc"))
    (coercef a 'list)                ; 文字列を文字のリストに
    (assert-equal '(#\a #\b #\c) a))
  (let ((a #(1 2 3)))
    (coercef a 'list)                ; 配列をリストに
    (assert-equal '(1 2 3) a))
  (let ((a '(a b c)))
    (coercef a '(array t 1))         ; リストを配列に
    (assert-equalp #(a b c) a))
  (let ((a "abc"))
    (coercef a '(array t 1))         ; 文字列を文字の配列に
    (assert-equalp #(#\a #\b #\c) a))
  (let ((a '(#\a #\b #\c)))
    (coercef a '(array character 1)) ; 文字のリストを文字列に
    (assert-equal "abc" a))
  (let ((a "abc"))
    (coercef a '(array character 1)) ; 意味なし
    (assert-equal "abc" a))
  (let ((a "a"))
    (coercef a 'character)           ; 文字列を文字に
    (assert-equal #\a a))
  (let ((a 1))
    (coercef a 'float)
    (assert-equal 1.0 a))
  (let ((a 1))
    (coercef a 'double-float)
    (assert-equal 1.0d0 a))
  (let ((a 1.0))
    (coercef a 'complex)
    (assert-equal #C(1.0 0.0) a))
  (let ((a #C(1 2)))
    (coercef a '(complex float))     ; 単精度の複素数に
    (assert-equal #C(1.0 2.0) a))
  )
