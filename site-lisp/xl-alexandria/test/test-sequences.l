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

(define-test sequences/map-combinations
  (let ((seen nil)
        (ok t))
    (flet ((test (s)
             (when (member s seen :test 'equal)
               (setf ok nil))
             (push s seen)))
      ;; 6C6 = 1 ’Ê‚è
      (map-combinations #'test '(1 2 3 4 5 6))
      (assert-equal (values t 1) (values ok (length seen)))

      ;; 6C4 = 15 ’Ê‚è
      (setf seen nil ok t)
      (map-combinations #'test '(1 2 3 4 5 6) :length 4)
      (assert-equal (values t 15) (values ok (length seen)))
      ))
  )

(define-test sequences/map-derangements
  (let ((seen nil)
        (ok t))
    (flet ((test (s)
             (when (member s seen :test 'equal)
               (setf ok nil))
             (push s seen)))

      ;; http://oeis.org/A000166
      ;; n=1
      (map-derangements #'test '(1))
      (assert-equal (values t 0) (values ok (length seen)))

      ;; n=2
      (setf seen nil ok t)
      (map-derangements #'test '(1 2))
      (assert-equal (values t 1) (values ok (length seen)))

      ;; n=5
      (setf seen nil ok t)
      (map-derangements #'test '(1 2 3 4 5))
      (assert-equal (values t 44) (values ok (length seen)))
      ))
  )

(define-test sequences/starts-with-subseq
  (assert-equal (values t nil)
      (starts-with-subseq "" ""))
  (assert-equal (values nil nil)
      (starts-with-subseq "abc" "ab"))
  (assert-equal (values t nil)
      (starts-with-subseq "abc" "abc"))
  (assert-equal (values t nil)
      (starts-with-subseq "abc" "abcdef"))

  (assert-equal (values t "")
      (starts-with-subseq "" "" :return-suffix t))
  (assert-equal (values nil nil)
      (starts-with-subseq "abc" "ab" :return-suffix t))
  (assert-equal (values t "")
      (starts-with-subseq "abc" "abc" :return-suffix t))
  (assert-equal (values t "def")
      (starts-with-subseq "abc" "abcdef" :return-suffix t))

  (assert-equalp (values t #())
      (starts-with-subseq #() #() :return-suffix t))
  (assert-equalp (values t #(d e f))
      (starts-with-subseq #(a b c) #(a b c d e f) :return-suffix t))

  (assert-false (starts-with-subseq "ABC" "abcdef" :test #'string=))
  (assert-true (starts-with-subseq "ABC" "abcdef" :test #'string-equal))

  (assert-false (starts-with-subseq #(#\A #\B #\C) #(#\a #\b #\c #\d #\e #\f) :test #'char=))
  (assert-true (starts-with-subseq #(#\A #\B #\C) #(#\a #\b #\c #\d #\e #\f) :test #'char-equal))
  )

(define-test sequences/ends-with-subseq
  (assert-true (ends-with-subseq "" ""))
  (assert-false (ends-with-subseq "abc" "ab"))
  (assert-true (ends-with-subseq "abc" "abc"))
  (assert-true (ends-with-subseq "def" "abcdef"))

  (assert-true (ends-with-subseq #() #()))
  (assert-true (ends-with-subseq #(d e f) #(a b c d e f)))

  (assert-false (ends-with-subseq "DEF" "abcdef" :test #'string=))
  (assert-true (ends-with-subseq "DEF" "abcdef" :test #'string-equal))

  (assert-false (ends-with-subseq #(#\D #\E #\F) #(#\a #\b #\c #\d #\e #\f) :test #'char=))
  (assert-true (ends-with-subseq #(#\D #\E #\F) #(#\a #\b #\c #\d #\e #\f) :test #'char-equal))
  )

