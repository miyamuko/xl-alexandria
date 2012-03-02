; -*- mode: lisp; package: alexandria.test.io; encoding: shift_jis -*-

(require "lisp-unit")
(require "xl-alexandria")
(require "xl-alexandria/test/helper")

(defpackage :alexandria.test.io
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

(in-package :alexandria.test.io)

(remove-all-tests :alexandria.test.io)

(define-test io/with-input-from-file
  (with-input-from-file (s "test-file-crlf-sjis.bin")
    (assert-equal #\x (read-char s))
    (assert-equal #\y (read-char s))
    (assert-equal #\z (read-char s))
    (assert-equal #\z (read-char s))
    (assert-equal #\y (read-char s))
    (assert-equal #\LFD (read-char s))
    (assert-equal "XYZZY" (read-line s))
    (assert-equal "ｘｙｚｚｙ" (read-line s))
    (assert-equal "臭い爺" (read-line s)))
  )

(define-test io/with-input-from-file/direction
  (assert-error 'simple-error
      (with-input-from-file (s "test-file-crlf-sjis.bin" :direction :input)
        ))
  (assert-error 'simple-error
      (with-input-from-file (s "test-file-crlf-sjis.bin" :direction :output)
        ))
  )

(define-test io/with-input-from-file/if-does-not-exist
  (assert-error 'file-not-found
      (with-input-from-file (s "test-file-no-such-file.txt")
        ))
  (unwind-protect
      (with-input-from-file (s "test-file-no-such-file.txt" :if-does-not-exist :create)
        (assert-equal :eof (read s nil :eof))
        (assert-true (file-exist-p "test-file-no-such-file.txt")))
    (delete-file "test-file-no-such-file.txt"))
  )

(define-test io/with-input-from-file/element-type
  (with-input-from-file (s "test-file-crlf-sjis.bin" :element-type '(unsigned-byte 8))
    (assert-equal :binary (stream-encoding s))
    (assert-equal "xyzzy\x0d" (read-line s)))
  (with-input-from-file (s "test-file-crlf-sjis.bin" :element-type '(unsigned-byte 32))
    (assert-equal :binary (stream-encoding s))
    (assert-equal "xyzzy\x0d" (read-line s)))
  (with-input-from-file (s "test-file-crlf-sjis.bin" :element-type 'unsigned-byte)
    (assert-equal :canonical (stream-encoding s))
    (assert-equal "xyzzy" (read-line s)))

  (with-input-from-file (s "test-file-crlf-sjis.bin" :element-type 'unsigned-byte :encoding :binary)
    (assert-equal :binary (stream-encoding s))
    (assert-equal "xyzzy\x0d" (read-line s)))
  (with-input-from-file (s "test-file-crlf-sjis.bin" :element-type '(unsigned-byte 8) :encoding :canonical)
    (assert-equal :canonical (stream-encoding s))
    (assert-equal "xyzzy" (read-line s)))
  )

(define-test io/with-input-from-file/encoding
  (with-input-from-file (s "test-file-crlf-sjis.bin")
    (assert-equal :canonical (stream-encoding s))
    (assert-equal "xyzzy" (read-line s)))

  (with-input-from-file (s "test-file-crlf-sjis.bin" :encoding :text)
    (assert-equal :canonical (stream-encoding s))
    (assert-equal "xyzzy" (read-line s)))

  (with-input-from-file (s "test-file-crlf-sjis.bin" :encoding :canonical)
    (assert-equal :canonical (stream-encoding s))
    (assert-equal "xyzzy" (read-line s)))

  (with-input-from-file (s "test-file-crlf-sjis.bin" :encoding :raw)
    (assert-equal :raw (stream-encoding s))
    (assert-equal "xyzzy\x0d" (read-line s)))

  (with-input-from-file (s "test-file-crlf-sjis.bin" :encoding :binary)
    (assert-equal :binary (stream-encoding s))
    (assert-equal "xyzzy\x0d" (read-line s)))
  )

(define-test io/with-input-from-file/share
  (assert-error 'sharing-violation
      (with-input-from-file (s "test-file-crlf-sjis.bin" :share :write)
        (with-input-from-file (s "test-file-crlf-sjis.bin" :share :write)
          )))
  (assert-error 'sharing-violation
      (with-input-from-file (s "test-file-crlf-sjis.bin" :share :write)
        (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read)
          )))
  (assert-error 'sharing-violation
      (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read)
        (with-input-from-file (s "test-file-crlf-sjis.bin" :share :write)
          )))
  (assert-error 'sharing-violation
      (with-input-from-file (s "test-file-crlf-sjis.bin" :share :write)
        (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read-write)
          )))
  (assert-error 'sharing-violation
      (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read-write)
        (with-input-from-file (s "test-file-crlf-sjis.bin" :share :write)
          )))

  (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read)
    (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read)
      ))
  (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read)
    (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read-write)
      ))
  (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read-write)
    (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read)
      ))
  (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read-write)
    (with-input-from-file (s "test-file-crlf-sjis.bin" :share :read-write)
      ))
  )

(define-test io/with-output-to-file
  (unwind-protect
      (progn
        (with-output-to-file (s "test-output.txt")
          (write-char #\x s)
          (write-char #\y s)
          (write-char #\z s)
          (write-char #\z s)
          (write-char #\y s)
          (write-char #\LFD s)
          (format s "xyzzy~%"))
        (with-input-from-file (s "test-output.txt")
          (assert-equal "xyzzy" (read-line s))
          (assert-equal "xyzzy" (read-line s))
          (assert-equal :eof (read s nil :eof))))
    (delete-file "test-output.txt")))

(define-test io/with-output-to-file/direction
  (assert-error 'simple-error
      (with-output-to-file (s "test-output.txt" :direction :input)
        ))
  (assert-error 'simple-error
      (with-output-to-file (s "test-output.txt" :direction :output)
        ))
  )

(define-test io/with-output-to-file/if-exists
  (unwind-protect
      (progn
        (assert-false (file-exist-p "test-output.txt"))
        (with-output-to-file (s "test-output.txt")
          (format s "xyzzy~%"))
        (assert-true (file-exist-p "test-output.txt"))
        (assert-equal 7 (file-length "test-output.txt"))

        (with-output-to-file (s "test-output.txt")
          (format s "xyzzy~%"))
        (assert-true (file-exist-p "test-output.txt"))
        (assert-equal 7 (file-length "test-output.txt"))

        (assert-error 'file-exists
            (with-output-to-file (s "test-output.txt" :if-exists :error)
              ))
        (assert-true (file-exist-p "test-output.txt"))
        (assert-equal 7 (file-length "test-output.txt"))

        (with-output-to-file (s "test-output.txt" :if-exists :append)
          (format s "xyzzy~%"))
        (assert-equal (+ 7 7) (file-length "test-output.txt"))

        (with-output-to-file (s "test-output.txt" :if-exists :overwrite)
          (format s "XYZZY~%"))
        (assert-equal 7 (file-length "test-output.txt"))

        (with-output-to-file (s "test-output.txt" :if-exists :new-version)
          (format s "XYZZY~%"))
        (assert-equal 7 (file-length "test-output.txt"))
        )
    (delete-file "test-output.txt")))

(define-test io/read-file-into-string/text-file
  (assert-equalp
      "xyzzy\nXYZZY\nｘｙｚｚｙ\n臭い爺\n"
      (read-file-into-string "test-file-crlf-sjis.bin"))

  ;; ファイル読み込みの高速化のためバッファを利用している。
  ;; outline-tree2 がちらつかないようにバッファは削除していない。
  (assert-true (find-buffer " *alexandria*"))
  (assert-eql 0 (buffer-size (find-buffer " *alexandria*")))

  (assert-error 'file-not-found
      (read-file-into-string "test-file-no-such-file.txt"))
  )

(define-test io/read-file-into-string/text-file-utf8
  ;; 読み込み時に sjis に変換される
  (assert-equalp
      "xyzzy\nXYZZY\nｘｙｚｚｙ\n臭い爺\n"
      (read-file-into-string "test-file-lf-utf8.bin"))
  )

;; ミニバッファにプロンプトがある状態で read-file-into-string が
;; よばれても問題ないか
(define-test io/read-file-into-string/minibuffer
  (let ((file (namestring "test-file-crlf-sjis.bin")))
    (flet ((test (&rest args)
             (assert-true (minibuffer-window-p (selected-window)))
             (assert-equal
                 "xyzzy\nXYZZY\nｘｙｚｚｙ\n臭い爺\n"
                 (read-file-into-string file))
             (assert-true (minibuffer-window-p (selected-window)))))
      (let ((buf (selected-buffer))
            (*exit-minibuffer-hook* (list #'test)))
        (read-string "ミニバッファ周りのテスト中です。このまま Enter を押してください。")
        (assert-equalp buf (selected-buffer))))
    ))

(define-test io/write-string-into-file/text-file
  (unwind-protect
      (progn
        (assert-false (file-exist-p "test-output.txt"))
        (write-string-into-file "xyzzy" "test-output.txt")
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql 5 (file-length "test-output.txt"))
        (assert-equal "xyzzy" (read-file-into-string "test-output.txt"))

        (assert-error 'file-exists
            (write-string-into-file "xyzzy" "test-output.txt"))

        (write-string-into-file "XYZZY" "test-output.txt" :if-exists :append)
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql (+ 5 5) (file-length "test-output.txt"))
        (assert-equal "xyzzyXYZZY" (read-file-into-string "test-output.txt"))

        (write-string-into-file "XYZZY" "test-output.txt" :if-exists :overwrite)
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql 5 (file-length "test-output.txt"))
        (assert-equal "XYZZY" (read-file-into-string "test-output.txt"))

        (delete-file "test-output.txt")
        (assert-error 'file-error
            (write-string-into-file "XYZZY" "test-output.txt" :if-does-not-exist :error))
        (assert-false (file-exist-p "test-output.txt"))

        (write-string-into-file "XYZZY" "test-output.txt" :if-does-not-exist :create)
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql 5 (file-length "test-output.txt"))
        )
    (delete-file "test-output.txt")))

(define-test io/write-string-into-file/eol-code
  (unwind-protect
      (progn
        (assert-false (file-exist-p "test-output.txt"))
        (write-string-into-file (format nil "~C" (code-char #x0d)) "test-output.txt")
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql 1 (file-length "test-output.txt"))
        (assert-equalp #(#x0d) (read-file-into-byte-vector "test-output.txt"))
    (delete-file "test-output.txt")))
  (unwind-protect
      (progn
        (assert-false (file-exist-p "test-output.txt"))
        (write-string-into-file (format nil "~C" (code-char #x0a)) "test-output.txt")
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql 2 (file-length "test-output.txt"))
        (assert-equalp #(#x0d #x0a) (read-file-into-byte-vector "test-output.txt"))
    (delete-file "test-output.txt")))
  (unwind-protect
      (progn
        (assert-false (file-exist-p "test-output.txt"))
        (write-string-into-file (format nil "~C~C" (code-char #x0d) (code-char #x0A)) "test-output.txt")
        (assert-true (file-exist-p "test-output.txt"))
        (assert-eql 3 (file-length "test-output.txt"))
        (assert-equalp #(#x0d #x0d #x0a) (read-file-into-byte-vector "test-output.txt"))
        )
    (delete-file "test-output.txt")))

(define-test io/read-file-into-byte-vector/binary-file
  (let ((bytes (read-file-into-byte-vector "test-file.zip")))
    (assert-true (typep bytes 'simple-array))
    (assert-equalp
        #(#x50 #x4b #x03 #x04 #x0a #x00 #x00 #x00 #x00 #x00 #x2d #x61 #x5d #x3f #x1d #x55)
        (subseq bytes 0 16)))

  (assert-error 'file-not-found
      (read-file-into-byte-vector "test-file-no-such-file.zip"))
  )

(define-test io/read-file-into-byte-vector/text-file
  (let ((bytes (read-file-into-byte-vector "test-file-crlf-sjis.bin")))
    (assert-true (typep bytes 'simple-array))
    (assert-equalp
        #(#x78 #x79 #x7a #x7a #x79 #x0d #x0a #x58 #x59 #x5a #x5a #x59 #x0d #x0a #x82 #x98
          #x82 #x99 #x82 #x9a #x82 #x9a #x82 #x99 #x0d #x0a #x8f #x4c #x82 #xa2 #x96 #xea
          #x0d #x0a)
        bytes))
  (let ((bytes (read-file-into-byte-vector "test-file-lf-utf8.bin")))
    (assert-true (typep bytes 'simple-array))
    (assert-equalp
        #(#x78 #x79 #x7a #x7a #x79 #x0a #x58 #x59 #x5a #x5a #x59 #x0a #xef #xbd #x98 #xef
          #xbd #x99 #xef #xbd #x9a #xef #xbd #x9a #xef #xbd #x99 #x0a #xe8 #x87 #xad #xe3
          #x81 #x84 #xe7 #x88 #xba #x0a)
        bytes))
  )

(define-test io/write-byte-vector-into-file
  (unwind-protect
      (let* ((bytes #(#x0 #x1 #x3 #x7f))
             (len (length bytes)))
        (assert-false (file-exist-p "test-output.bin"))
        (write-byte-vector-into-file bytes "test-output.bin")
        (assert-true (file-exist-p "test-output.bin"))
        (assert-eql len (file-length "test-output.bin"))
        (assert-equalp bytes (read-file-into-byte-vector "test-output.bin"))

        (assert-error 'file-exists
            (write-byte-vector-into-file bytes "test-output.bin"))

        (write-byte-vector-into-file bytes "test-output.bin" :if-exists :append)
        (assert-true (file-exist-p "test-output.bin"))
        (assert-eql (+ len len) (file-length "test-output.bin"))
        (assert-equalp (concatenate 'vector bytes bytes) (read-file-into-byte-vector "test-output.bin"))

        (write-byte-vector-into-file bytes "test-output.bin" :if-exists :overwrite)
        (assert-true (file-exist-p "test-output.bin"))
        (assert-eql len (file-length "test-output.bin"))
        (assert-equalp bytes (read-file-into-byte-vector "test-output.bin"))

        (delete-file "test-output.bin")
        (assert-error 'file-error
            (write-byte-vector-into-file bytes "test-output.bin" :if-does-not-exist :error))
        (assert-false (file-exist-p "test-output.bin"))

        (write-byte-vector-into-file bytes "test-output.bin" :if-does-not-exist :create)
        (assert-true (file-exist-p "test-output.bin"))
        (assert-eql len (file-length "test-output.bin"))
        )
    (delete-file "test-output.bin")))

(define-test io/copy-file
  (assert-equal
      "alexandria.0.dev"
      (package-name (symbol-package 'copy-file)))
  (unwind-protect
      (progn
        (dolist (from '("test-file.zip" "test-file-crlf-sjis.bin"))
          (let ((to (format nil "~A.out" from)))
            (assert-eql
                (file-length from)
                (copy-file from to))
            (assert-true (compare-file from to))))

        (dolist (from '("test-file.zip" "test-file-crlf-sjis.bin"))
          (let ((to (format nil "~A.out" from)))
            (assert-error 'file-exists
                (copy-file from to :if-to-exists :error))))

        (dolist (from '("test-file.zip" "test-file-crlf-sjis.bin"))
          (let ((to (format nil "~A.out" from)))
            (assert-eql
                (file-length from)
                (copy-file from to :if-to-exists :append))
            (assert-false (compare-file from to))
            (assert-eql (* 2 (file-length from)) (file-length to))
            (assert-equalp
                (let ((from-bytes (read-file-into-byte-vector from)))
                  (concatenate 'vector from-bytes from-bytes))
                (read-file-into-byte-vector to))
            )))
    (delete-file "test-file.zip.out")
    (delete-file "test-file-crlf-sjis.bin.out")))

(define-test io/copy-stream/string
  (assert-equal "xyzzy"
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output))))

  (assert-equal "xyzzyXYZZY"
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output)
          (format output "XYZZY"))))
  )

(define-test io/copy-stream/text-file
  (unwind-protect
      (progn
        (assert-false (file-exist-p "test-output.txt"))

        (with-input-from-string (input "xyzzy")
          (with-open-file (output "test-output.txt" :direction :output :if-does-not-exist :create)
            (copy-stream input output)))
        (assert-equal "xyzzy" (read-file-into-string "test-output.txt"))

        (delete-file "test-output.txt")
        (with-input-from-string (input "xyzzy")
          (with-open-file (output "test-output.txt" :direction :output :if-does-not-exist :create)
            (copy-stream input output)
            (format output "XYZZY")))
        (assert-equal "xyzzyXYZZY" (read-file-into-string "test-output.txt"))
        )
    (delete-file "test-output.txt"))
  )

(define-test io/copy-stream/binary-file
  (unwind-protect
      (let* ((from "test-file.zip")
             (to (format nil "~A.out" from)))
        (with-open-file (input from :direction :input :encoding :binary)
          (with-open-file (output to :direction :output :encoding :binary)
            (copy-stream input output)))
        (assert-true (compare-file from to))
        )
    (delete-file "test-file.zip.out"))
  )

(define-test io/copy-stream/buffer
  (let ((from (get-buffer-create "*alexandria.test.io:from*"))
        (to (get-buffer-create "*alexandria.test.io:to*")))
    (unwind-protect
        (progn
          (with-output-to-buffer (from)
            (format t "xyzzy"))
          (with-input-from-buffer (from)
            (with-output-to-buffer (to)
              (copy-stream *standard-input* *standard-output*)))
          (assert-equal "xyzzy"
              (with-input-from-buffer (to)
                (read-line *standard-input*)))
        )
      (delete-buffer from)
      (delete-buffer to)))
  )

(define-test io/copy-stream/start-end
  (assert-equal "zy"
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :start 3))))

  (assert-equal "xyz"
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :end 3))))

  (assert-equal ""
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :start 3 :end 3))))

  (assert-equal "z"
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :start 3 :end 4))))

  (assert-equal "zy"
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :start 3 :end 5))))

  (assert-equal "ｚｙ"
      (with-input-from-string (input "ｘｙｚｚｙ")
        (with-output-to-string (output)
          (copy-stream input output :start 3 :end 5))))

  (assert-error 'error
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :start 6))))

  (assert-error 'error
      (with-input-from-string (input "xyzzy")
        (with-output-to-string (output)
          (copy-stream input output :end 6))))
  )

