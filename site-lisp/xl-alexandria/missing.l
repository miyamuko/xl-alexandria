; -*- mode: lisp; package: alexandria; encoding: shift_jis -*-

;;; xl-alexandria/missing.l
;;
;; Copyright (c) 2011 MIYAMUKO Katsuyuki.
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation files
;; (the "Software"), to deal in the Software without restriction,
;; including without limitation the rights to use, copy, modify, merge,
;; publish, distribute, sublicense, and/or sell copies of the Software,
;; and to permit persons to whom the Software is furnished to do so,
;; subject to the following conditions:
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Code:

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-alexandria/package")
  )

(in-package :alexandria)

(defmacro load-time-value (form &optional read-only-p)
  `(progn ,form))

(setf (symbol-function 'define-setf-expander)
      (symbol-function 'define-setf-method)
      (symbol-function 'get-setf-expansion)
      (symbol-function 'get-setf-method)
      )


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
