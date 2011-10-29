; -*- mode: lisp; package: alexandria; encoding: shift_jis -*-

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-alexandria/package")
  )

(in-package :alexandria)

(let ((indent-hooks '(;; binding.l
                      (if-let . 2)
                      (when-let . 1)
                      (when-let* . 1)
                      ;; conditions.l
                      (ignore-some-conditions . 1)
                      (unwind-protect-case . 2)
                      ;; control-flow.l
                      (switch . 1)
                      (eswitch . 1)
                      (cswitch . 1)
                      ; (whichever . 1)
                      ; (xor . 1)
                      ; (nth-value-or . 1)
                      (multiple-value-prog2 . 2)
                      ;; definitions.l
                      (define-constant . 1)
                      ;; functions.l
                      ; (ensure-functionf . 1)
                      (named-lambda . 1)
                      ;; io.l
                      (with-open-file* . 1)
                      (with-input-from-file . 1)
                      (with-output-to-file . 1)
                      ;; lists.l
                      (doplist . 1)
                      ;; macros.l
                      (with-gensyms . 1)
                      (with-unique-names . 1)
                      (once-only . 1)
                      ; (cons1 . 1)
                      (destructuring-case . 1)
                      (destructuring-ccase . 1)
                      (destructuring-ecase . 1))))
  (dolist (e indent-hooks)
    (setf  (get (car e) 'ed::lisp-indent-hook) (cdr e))))


(provide "xl-alexandria/indent-hook")

;;; End
