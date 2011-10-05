; -*- mode: lisp; package: alexandria; encoding: shift_jis -*-

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-alexandria/package")
  (require "xl-alexandria/missing")
  )

(in-package :alexandria)

(deftype string-designator ()
  "A string designator type. A string designator is either a string, a symbol,
or a character."
  `(or symbol string character))


(provide "xl-alexandria/strings")

;;; End
