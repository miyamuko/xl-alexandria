; -*- mode: lisp; package: alexandria; encoding: shift_jis -*-

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-alexandria/package")
  )

(in-package :alexandria)

(defmacro load-time-value (form &optional read-only-p)
  `(progn ,form))

(defun set-documentation (symbol doc-type newvalue)
  (if (and (consp symbol)
           (eq (car symbol) 'setf)
           (eq doc-type 'function))
      (si:*putprop (cadr symbol) newvalue 'lisp::setf-documentation)
    (si:*putprop symbol newvalue (get doc-type 'lisp::documentation-type))))
(defsetf documentation set-documentation)

(defun fdefinition (function-name)
  (symbol-function (if (consp function-name)
                       (car (last function-name))
                     function-name)))

(defun bit (bitvector n)
  (aref bitvector n))

(defun set-bit (bitvector n v)
  (setf (aref bitvector n) v))
(defsetf bit set-bit)


(provide "xl-alexandria/missing")

;;; End
