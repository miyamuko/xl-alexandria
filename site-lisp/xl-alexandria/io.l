; -*- mode: lisp; package: alexandria; encoding: shift_jis -*-

;; Copyright (c) 2002-2006, Edward Marco Baringer
;; All rights reserved.

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-alexandria/package")
  (require "xl-alexandria/missing")
  (require "xl-alexandria/macros")
  (require "xl-alexandria/lists")
  (require "xl-alexandria/types")
  )

(in-package :alexandria)

(defmacro with-open-file* ((stream filespec &key direction element-type
                                   if-exists if-does-not-exist external-format
                                   #+xyzzy encoding
                                   #+xyzzy share)
                           &body body)
  "Just like WITH-OPEN-FILE, but NIL values in the keyword arguments mean to use
the default value specified for OPEN."
  (once-only (direction element-type if-exists if-does-not-exist external-format
                        #+xyzzy encoding
                        #+xyzzy share)
    `(with-open-stream
         (,stream (apply #'open ,filespec
                         (append
                          (when ,direction
                            (list :direction ,direction))
                          #-xyzzy
                          (when ,element-type
                            (list :element-type ,element-type))
                          #+xyzzy
                          (when (or ,encoding (and (consp ,element-type)
                                                   (string= (car ,element-type) 'unsigned-byte)))
                            (list :encoding (or ,encoding :binary)))
                          #+xyzzy
                          (when ,share
                            (list :share ,share))
                          (when ,if-exists
                            (list :if-exists ,if-exists))
                          (when ,if-does-not-exist
                            (list :if-does-not-exist ,if-does-not-exist))
                          (when ,external-format
                            (list :external-format ,external-format)))))
       ,@body)))

(defmacro with-input-from-file ((stream-name file-name &rest args
                                             &key (direction nil direction-p)
                                             &allow-other-keys)
                                &body body)
  "Evaluate BODY with STREAM-NAME to an input stream on the file
FILE-NAME. ARGS is sent as is to the call to OPEN except EXTERNAL-FORMAT,
which is only sent to WITH-OPEN-FILE when it's not NIL."
  #-xyzzy(declare (ignore direction))
  (when direction-p
    (error "Can't specifiy :DIRECTION for WITH-INPUT-FROM-FILE."))
  `(with-open-file* (,stream-name ,file-name :direction :input ,@args)
     ,@body))

(defmacro with-output-to-file ((stream-name file-name &rest args
                                            &key (direction nil direction-p)
                                            &allow-other-keys)
			       &body body)
  "Evaluate BODY with STREAM-NAME to an output stream on the file
FILE-NAME. ARGS is sent as is to the call to OPEN except EXTERNAL-FORMAT,
which is only sent to WITH-OPEN-FILE when it's not NIL."
  #-xyzzy(declare (ignore direction))
  (when direction-p
    (error "Can't specifiy :DIRECTION for WITH-OUTPUT-TO-FILE."))
  `(with-open-file* (,stream-name ,file-name :direction :output ,@args)
     ,@body))

(defun read-file-into-string (pathname &key (buffer-size 4096) external-format)
  "Return the contents of the file denoted by PATHNAME as a fresh string.

The EXTERNAL-FORMAT parameter will be passed directly to WITH-OPEN-FILE
unless it's NIL, which means the system default."
  #+xyzzy
  ;; バッファを使ってファイル読み込みを高速化
  ;; https://gist.github.com/540143
  (with-set-buffer
    (let ((pathname (normalize-pathname pathname))
          (org (selected-buffer))
          (buf (get-buffer-create " *alexandria*")))
      (set-buffer buf)
      (unwind-protect
          (progn
            (erase-buffer buf)
            (insert-file-contents pathname nil)
            (buffer-substring (point-min) (point-max)))
        (if (and org (bufferp org) (not (deleted-buffer-p org)))
            (set-buffer org)
          (other-buffer buf))
        (erase-buffer buf)
        )))
  #-xyzzy
  (with-input-from-file
      (file-stream pathname :external-format external-format)
    (let ((*print-pretty* nil))
      (with-output-to-string (datum)
        (let ((buffer (make-array buffer-size :element-type 'character)))
	  (loop
	     :for bytes-read = (read-sequence buffer file-stream)
	     :do (write-sequence buffer datum :start 0 :end bytes-read)
	     :while (= bytes-read buffer-size)))))))

(defun write-string-into-file (string pathname &key (if-exists :error)
                                                    if-does-not-exist
                                                    external-format)
  "Write STRING to PATHNAME.

The EXTERNAL-FORMAT parameter will be passed directly to WITH-OPEN-FILE
unless it's NIL, which means the system default."
  (with-output-to-file (file-stream pathname :if-exists if-exists
                                    :if-does-not-exist if-does-not-exist
                                    :external-format external-format)
    #+xyzzy
    (format file-stream "~A" string)
    #-xyzzy
    (write-sequence string file-stream)))

(defun read-file-into-byte-vector (pathname)
  "Read PATHNAME into a freshly allocated (unsigned-byte 8) vector."
  (with-input-from-file (stream pathname :element-type '(unsigned-byte 8))
    (let ((length (file-length stream)))
      (assert length)
      #+xyzzy
      (let ((result (make-array length :element-type 'character :fill-pointer 0)))
        (read-into result stream)
        (map 'vector #'char-code result))
      #-xyzzy
      (let ((result (make-array length :element-type '(unsigned-byte 8))))
        (read-sequence result stream)
        result))))

(defun write-byte-vector-into-file (bytes pathname &key (if-exists :error)
                                                       if-does-not-exist)
  "Write BYTES to PATHNAME."
  (check-type bytes (vector (unsigned-byte 8)))
  (with-output-to-file (stream pathname :if-exists if-exists
                               :if-does-not-exist if-does-not-exist
                               :element-type '(unsigned-byte 8))
    #+xyzzy
    (format stream "~A" (map 'string #'code-char bytes))
    #-xyzzy
    (write-sequence bytes stream)))

(defun copy-file (from to &key (if-to-exists :supersede)
			       (element-type '(unsigned-byte 8)) finish-output)
  #+xyzzy
  ;; lisp:copy-file を使って高速化
  (unless (eq if-to-exists :append)
    (setf from (normalize-pathname from))
    ;; lisp:copy-file は supersede などを指定できない。
    ;; Fopen の処理を見るかぎり overwrite と同じ意味だと思うので overwite を指定。
    (when (member if-to-exists '(:supersede :rename :rename-and-delete :new-version))
      (setf if-to-exists :overwrite))
    (return-from copy-file
      (and (lisp:copy-file from to :if-exists if-to-exists)
           (file-length to))))
  (with-input-from-file (input from :element-type element-type)
    (with-output-to-file (output to :element-type element-type
				    :if-exists if-to-exists)
      (copy-stream input output
                   :element-type element-type
                   :finish-output finish-output))))

(defun copy-stream (input output &key
                          #-xyzzy (element-type (stream-element-type input))
                          #+xyzzy element-type
                          (buffer-size 4096)
                          #-xyzzy (buffer (make-array buffer-size :element-type element-type))
                          #+xyzzy (buffer (make-vector buffer-size :element-type 'character :fill-pointer 0))
                          (start 0) end
                          finish-output)
  "Reads data from INPUT and writes it to OUTPUT. Both INPUT and OUTPUT must
be streams, they will be passed to READ-SEQUENCE and WRITE-SEQUENCE and must have
compatible element-types."
  (check-type start non-negative-integer)
  (check-type end (or null non-negative-integer))
  (check-type buffer-size positive-integer)
  (when (and start end (< end start))
    (error "END is smaller than START in ~S" 'copy-stream))
  #+xyzzy
  (let ((output-position 0)
        (input-position 0))
    (when (and start (not (zerop start)))
      (while (let ((n (min buffer-size
                           (- start input-position))))
               (and (< 0 n)
                    (read-into buffer input nil nil n)))
        (incf input-position (length buffer)))
      (unless (= input-position start)
        (error "Could not read enough bytes from the input to fulfill the START requirement in ~S" 'copy-stream)))
    (while (and (or (null end)
                    (< input-position end))
                (let ((n (when end
                           (min buffer-size
                                (- end input-position)))))
                  (and (or (null n)
                           (< 0 n))
                       (read-into buffer input nil nil n))))
      (format output "~A" buffer)
      (let ((n (length buffer)))
        (incf input-position n)
        (incf output-position n)))
    (when (and end (/= input-position end))
      (error "Could not read enough bytes from the input to fulfill the END requirement in ~S" 'copy-stream))
    (when finish-output
      (finish-output output))
    output-position)
  #-xyzzy
  (let ((output-position 0)
        (input-position 0))
    (unless (zerop start)
      ;; FIXME add platform specific optimization to skip seekable streams
      (loop
        :while (< input-position start)
        :for bytes-read = (read-sequence buffer input
                                         :end (min (length buffer)
                                                   (- start input-position)))
        :do (progn
              (when (zerop bytes-read)
                (error "Could not read enough bytes from the input to fulfill the START requirement in ~S" 'copy-stream))
              (incf input-position bytes-read))))
    (assert (= input-position start))
    (loop
      :while (or (null end)
                 (< input-position end))
      :for bytes-read = (read-sequence buffer input
                                       :end (when end
                                              (min (length buffer)
                                                   (- end input-position))))
      :do (progn
            (when (zerop bytes-read)
              (if end
                  (error "Could not read enough bytes from the input to fulfill the END requirement in ~S" 'copy-stream)
                  (return)))
            (incf input-position bytes-read)
            (write-sequence buffer output :end bytes-read)
            (incf output-position bytes-read)))
    (when finish-output
      (finish-output output))
    output-position))

#+xyzzy
(defun normalize-pathname (pathname)
  (when (or (not pathname)
            (string= pathname ""))
    (error "ファイル名が空です: ~S" pathname))
  (setf pathname (namestring pathname))
  (when (file-exist-p pathname)
    (setf pathname (truename pathname)))
  (when (special-file-p pathname)
    (error "~Aはデバイスファイルです" pathname))
  (when (file-directory-p pathname)
    (error "~Aはディレクトリです" pathname))
  (unless (valid-path-p pathname)
    (error "~A\nファイルまたはディレクトリが見つかりません" pathname))
  pathname)


(provide "xl-alexandria/io")

;;; End
