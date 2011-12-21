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

(defun bit (bitvector n)
  (aref bitvector n))

(defun set-bit (bitvector n v)
  (setf (aref bitvector n) v))
(defsetf bit set-bit)


(define-condition simple-type-error (type-error)
  (format-control format-arguments)
  (:report (lambda (c s)
             (format s "不正なデータ型です: ~S: ~S~%~A"
                     (simple-type-error-datum c)
                     (simple-type-error-expected-type c)
                     (apply #'format nil (simple-type-error-format-control c)
                            (simple-type-error-format-arguments c))))))

;; xyzzy の reduce は key 引数が足りない
(shadow 'reduce)
(defun reduce (function sequence
                        &key key from-end (start 0) end
                        (initial-value nil sv))
  (let ((keys `(:from-end ,from-end
                :start ,start
                :end ,end)))
    (when sv
      (setf keys (append keys `(:initial-value ,initial-value))))
    (apply #'lisp:reduce function
           (if key
               (mapcar key sequence)
             sequence)
           keys)))


(provide "xl-alexandria/missing")

;;; End
