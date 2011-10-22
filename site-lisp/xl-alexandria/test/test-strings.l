; -*- mode: lisp; package: alexandria.test.strings; encoding: shift_jis -*-

(require "ansify")
(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.strings
  (:use :lisp :editor
   :lisp-unit
   :alexandria
   )
  (:shadowing-import-from :ansify
   :typep
   )
  (:shadowing-import-from :alexandria
   ;; conflict with :lisp
   :copy-file
   :featurep
   ;; conflict with :lisp-unit
   :set-equal
   )
  )

(in-package :alexandria.test.strings)

(remove-all-tests :alexandria.test.strings)

(define-test strings/string-designator
  (assert-equal
      t
      (typep "hoge" 'string-designator))
  (assert-equal
      t
      (typep :hoge 'string-designator))
  (assert-equal
      t
      (typep 'hoge 'string-designator))
  (assert-equal
      t
      (typep #\a 'string-designator))

  ;; nil ‚Í 'nil ‚Æ‚¢‚¤ƒVƒ“ƒ{ƒ‹‚ð•Ô‚·
  (assert-equal
      t
      (typep nil 'string-designator))

  (assert-equal
      nil
      (typep (list #\a #\b) 'string-designator))
  (assert-equal
      nil
      (typep 1 'string-designator))
  (assert-equal
      nil
      (typep 1.1 'string-designator))
  )
