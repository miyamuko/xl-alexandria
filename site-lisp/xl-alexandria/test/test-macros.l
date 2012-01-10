; -*- mode: lisp; package: alexandria.test.macros; encoding: shift_jis -*-

(require "lisp-unit")
(require "ansify")
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
  (:shadowing-import-from :ansify
   :&allow-other-keys
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
  (assert-equal (values nil nil nil nil nil nil)
      (parse-ordinary-lambda-list '()))

  (assert-equal (values '(r1 r2 r3) nil nil nil nil nil)
      (parse-ordinary-lambda-list '(r1 r2 r3)))

  (assert-equal (values nil '((o1 nil nil) (o2 2 nil) (o3 3 o3p)) nil nil nil nil)
      (parse-ordinary-lambda-list '(&optional o1 (o2 2) (o3 3 o3p))))

  (assert-equal (values nil nil nil '(((:k1 k1) nil nil) ((:k2 k2) 2 nil) ((:k3 k3) 3 k3p)) nil nil)
      (parse-ordinary-lambda-list '(&key k1 (k2 2) (k3 3 k3p))))

  (assert-equal (values nil nil 'args nil nil nil)
      (parse-ordinary-lambda-list '(&rest args)))

  (assert-equal (values nil nil nil nil nil '((a1 nil) (a2 2)))
      (parse-ordinary-lambda-list '(&aux a1 (a2 2))))

  (assert-equal (values nil nil nil '(((:k1 k1) nil nil) ((:k2 k2) nil nil)) t nil)
      (parse-ordinary-lambda-list '(&key k1 k2 ansify:&allow-other-keys)))

  (assert-equal (values '(r1 r2) '((o1 nil nil) (o2 2 o2p)) 'args
                        '(((:k1 k1) nil nil) ((:k2 k2) 2 k2p)) t '((a1 1) (a2 2)))
      (parse-ordinary-lambda-list '(r1 r2 &optional o1 (o2 2 o2p) &rest args &key k1 (k2 2 k2p)
                                    ansify:&allow-other-keys &aux (a1 1) (a2 2))))
  )

(define-test macros/parse-ordinary-lambda-list/no-normalize
  (assert-equal (values nil nil nil nil nil nil)
      (parse-ordinary-lambda-list '()
                                  :normalize nil))

  (assert-equal (values '(r1 r2 r3) nil nil nil nil nil)
      (parse-ordinary-lambda-list '(r1 r2 r3)
                                  :normalize nil))

  (assert-equal (values nil '((o1) (o2 2) (o3 3 o3p)) nil nil nil nil)
      (parse-ordinary-lambda-list '(&optional o1 (o2 2) (o3 3 o3p))
                                  :normalize nil))

  (assert-equal (values nil nil nil '(k1 (k2 2) (k3 3 k3p)) nil nil)
      (parse-ordinary-lambda-list '(&key k1 (k2 2) (k3 3 k3p))
                                  :normalize nil))

  (assert-equal (values nil nil 'args nil nil nil)
      (parse-ordinary-lambda-list '(&rest args)
                                  :normalize nil))

  (assert-equal (values nil nil nil nil nil '((a1) (a2 2)))
      (parse-ordinary-lambda-list '(&aux a1 (a2 2))
                                  :normalize nil))

  (assert-equal (values nil nil nil '(k1 k2) t nil)
      (parse-ordinary-lambda-list '(&key k1 k2 ansify:&allow-other-keys)
                                  :normalize nil))

  (assert-equal (values '(r1 r2) '((o1) (o2 2 o2p)) 'args
                        '(k1 (k2 2 k2p)) t '((a1 1) (a2 2)))
      (parse-ordinary-lambda-list '(r1 r2 &optional o1 (o2 2 o2p) &rest args &key k1 (k2 2 k2p)
                                    &allow-other-keys &aux (a1 1) (a2 2))
                                  :normalize nil))
  )

(define-test macros/destructuring-case
  (flet ((calc (&rest exps)
           (destructuring-case exps
             ((:add &rest args) (apply #'+ args))
             ((:sub &rest args) (apply #'- args))
             ((:mul &rest args) (apply #'* args))
             ((:div &rest args) (apply #'/ args)))))
    (assert-equal 6 (calc :add 1 2 3))
    (assert-equal -8 (calc :sub 1 2 3 4))
    (assert-equal 120 (calc :mul 1 2 3 4 5))
    (assert-equal 5 (calc :div 20 2 2))
    (assert-equal nil (calc :noop 20 2 2))
    )
  )

(define-test macros/destructuring-ccase
  (flet ((calc (&rest exps)
           (destructuring-ccase exps
             ((:add &rest args) (apply #'+ args))
             ((:sub &rest args) (apply #'- args))
             ((:mul &rest args) (apply #'* args))
             ((:div &rest args) (apply #'/ args)))))
    (assert-equal 6 (calc :add 1 2 3))
    (assert-equal -8 (calc :sub 1 2 3 4))
    (assert-equal 120 (calc :mul 1 2 3 4 5))
    (assert-equal 5 (calc :div 20 2 2))
    (assert-error 'type-error
        (calc :noop 20 2 2)))
  )

(define-test macros/destructuring-ecase
  (flet ((calc (&rest exps)
           (destructuring-ecase exps
             ((:add &rest args) (apply #'+ args))
             ((:sub &rest args) (apply #'- args))
             ((:mul &rest args) (apply #'* args))
             ((:div &rest args) (apply #'/ args)))))
    (assert-equal 6 (calc :add 1 2 3))
    (assert-equal -8 (calc :sub 1 2 3 4))
    (assert-equal 120 (calc :mul 1 2 3 4 5))
    (assert-equal 5 (calc :div 20 2 2))
    (assert-error 'type-error
        (calc :noop 20 2 2)))
  )
