; -*- mode: lisp; package: alexandria; encoding: shift_jis -*-

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-alexandria/package")
  )

(in-package :alexandria)

(export '(xl-alexandria-version
          ))

(defconstant +xl-alexandria-version+ "0.0.2")

(defun xl-alexandria-version ()
  +xl-alexandria-version+)


(provide "xl-alexandria/version")

;;; End
