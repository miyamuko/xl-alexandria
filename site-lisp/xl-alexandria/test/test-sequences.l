; -*- mode: lisp; package: alexandria.test.sequences; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.sequences
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

(in-package :alexandria.test.sequences)

(remove-all-tests :alexandria.test.sequences)

(define-test sequences/ends-with-subseq
  ;; TODO
  (assert-equalp '() (ends-with-subseq))
  )

(define-test sequences/map-combinations
  ;; TODO
  (assert-equalp '() (map-combinations))
  )

(define-test sequences/map-derangements
  ;; TODO
  (assert-equalp '() (map-derangements))
  )

(define-test sequences/starts-with-subseq
  ;; TODO
  (assert-equalp '() (starts-with-subseq))
  )

