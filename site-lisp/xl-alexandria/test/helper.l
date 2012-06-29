; -*- mode: lisp; package: alexandria.test.helper; encoding: shift_jis -*-

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

(export '(deftest
          make-bit-vector
          ))

(defun user::runall-alexandria-test ()
  (interactive)
  (dolist (src (directory "." :wild "*.l" :recursive t))
    (load src))
  (let ((test-pkgs (remove-if #'(lambda (pkg)
                                  (or (not (string-match "^alexandria.test." (package-name pkg)))
                                      (string-match "^alexandria.test.helper" (package-name pkg))))
                              (list-all-packages))))
    (let ((*trace-output* (lisp-unit::%get-result-buffer-stream)))
      (dolist (pkg test-pkgs)
        (let ((pkg-name (package-name pkg)))
          (fresh-line *trace-output*)
          (format *trace-output* "~%=== ~A ===~%" pkg-name)
          (message pkg-name)
          (let ((*package* pkg))
            (lisp-unit:run-tests))
          )))))

(defmacro deftest (short-desc form &body expected-values)
  (let ((quoted-expected-values (mapcar #'(lambda (v)
                                            (if (numberp v)
                                                v
                                              `(quote ,v)))
                                        expected-values)))
    `(define-test ,short-desc
       (assert-equalp
           (values ,@quoted-expected-values)
           ,form))))
(setf (get 'deftest 'ed::lisp-indent-hook) 2)

(defun make-bit-vector (n)
  (make-vector 8 :element-type 'bit :initial-contents
               (loop for i from 7 downto 0
                     collect (logand #b1 (ash n (- i))))))


(provide "xl-alexandria/test/helper")

;;; End
