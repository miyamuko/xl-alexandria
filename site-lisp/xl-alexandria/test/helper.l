; -*- mode: lisp; package: alexandria.test.helper; encoding: shift_jis -*-

;;; xl-alexandria/test/helper.l
;;
;; Copyright (c) 2011 MIYAMUKO Katsuyuki.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;;   * Redistributions of source code must retain the above copyright
;;     notice, this list of conditions and the following disclaimer.
;;
;;   * Redistributions in binary form must reproduce the above
;;     copyright notice, this list of conditions and the following
;;     disclaimer in the documentation and/or other materials
;;     provided with the distribution.
;;
;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;;; Code:

(require "lisp-unit")
(require "ansi-loop")

(defpackage :alexandria.test.helper
  (:use :lisp :editor :lisp-unit
   )
  (:shadowing-import-from :ansi-loop
   :loop
   :loop-finish
   )
  )

(in-package :alexandria.test.helper)

(export '(locally
          constantly
          deftest
          make-bit-vector
          ))

(defmacro locally (&body forms)
  `(progn ,@forms))

(defun constantly (v)
  #'(lambda (&rest args)
      v))

(defmacro deftest (short-desc form &body expected-values)
  `(define-test ,short-desc
     (assert-equalp
         (values ,@(mapcar #'(lambda (v)
                               (cond ((and (atom v)
                                           (not (symbolp v)))
                                      v)
                                     ((and (consp v)
                                           (symbolp (car v))
                                           (fboundp (car v)))
                                      v)
                                     (t
                                      `(quote ,v))))
                           expected-values))
         ,form)))
(setf (get 'deftest 'ed::lisp-indent-hook) 2)

(defun make-bit-vector (n)
  (make-vector 8 :element-type 'bit :initial-contents
               (loop for i from 7 downto 0
                     collect (logand #b1 (ash n (- i))))))


(provide "xl-alexandria/test/helper")

;;; End
