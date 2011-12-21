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
  ;; TODO
  (assert-equalp '() (reversef))
  )

(define-test lists/nreversef
  ;; TODO
  (assert-equalp '() (nreversef))
  )

(define-test lists/ensure-car
  ;; TODO
  (assert-equalp '() (ensure-car))
  )

(define-test lists/remove-from-plistf
  ;; TODO
  (assert-equalp '() (remove-from-plistf))
  )

(define-test lists/delete-from-plist
  ;; TODO
  (assert-equalp '() (delete-from-plist))
  )

(define-test lists/delete-from-plistf
  ;; TODO
  (assert-equalp '() (delete-from-plistf))
  )

