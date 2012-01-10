; -*- mode: lisp; package: alexandria.test.macros; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.macros
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

(in-package :alexandria.test.macros)

(remove-all-tests :alexandria.test.macros)

(define-test macros/parse-body/interactive
  (ansify:destructuring-bind (defun name lambda-list &body body)
      `(defun foo (a)
         "doc-string"
         (interactive "p")
         (bar a))
    (assert-equal (values '("doc-string" (interactive "p") (bar a)) nil nil nil)
        (parse-body body :documentation nil :interactive nil))
    (assert-equal (values '("doc-string" (interactive "p") (bar a)) nil nil nil)
        (parse-body body :documentation nil :interactive t))

    (assert-equal (values '((interactive "p") (bar a)) nil "doc-string" nil)
        (parse-body body :documentation t :interactive nil))
    (assert-equal (values '((bar a)) nil "doc-string" '(interactive "p"))
        (parse-body body :documentation t :interactive t))
    )

  (ansify:destructuring-bind (defun name lambda-list &body body)
      `(defun foo (a)
         (interactive)
         (bar a))
    (assert-equal (values '((interactive) (bar a)) nil nil nil)
        (parse-body body :documentation nil :interactive nil))
    (assert-equal (values '((bar a)) nil nil '(interactive))
        (parse-body body :documentation nil :interactive t))

    (assert-equal (values '((interactive) (bar a)) nil nil nil)
        (parse-body body :documentation t :interactive nil))
    (assert-equal (values '((bar a)) nil nil '(interactive))
        (parse-body body :documentation t :interactive t))
    )
  )

(define-test macros/parse-ordinary-lambda-list
  ;; TODO
  (assert-equalp '() (parse-ordinary-lambda-list))
  )

(define-test macros/destructuring-case
  ;; TODO
  (assert-equalp '() (destructuring-case))
  )

(define-test macros/destructuring-ccase
  ;; TODO
  (assert-equalp '() (destructuring-ccase))
  )

(define-test macros/destructuring-ecase
  ;; TODO
  (assert-equalp '() (destructuring-ecase))
  )

