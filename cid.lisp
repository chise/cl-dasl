(in-package :cl-dasl)

(defun bytes-to-base32-with-no-padding (some-bytes)
  "Like bytes-to-base32, but return base32 string without padding"
  (let* ((word-count (ceiling (* 8 (length some-bytes)) 5) )
         (base32-string (make-string word-count)))
    (dotimes (i word-count)
      (setf (aref base32-string i)
            (cl-base32::encode-word (cl-base32::read-word some-bytes i))))
    base32-string))

(defun decode-base32-cid (cid)
  (let* ((ret (cl-base32:base32-to-bytes (subseq cid 1)))
	 (len (aref ret 3)))
    (subseq ret 4 (+ len 4))))

(defun base32-cid-to-binary-cid (cid)
  (let ((ret (decode-base32-cid cid)))
    (concatenate '(vector (unsigned-byte 8))
		 #( #x00 ; raw binary
		    #x01 ; CIDv1
		    #x71 ; dag-cbor
		    #x12 ; sha2-256
		   )
		 `#(,(length ret))
		 ret)))

(defun binary-cid-to-base32-cid (binary-cid)
  (concatenate 'string "b"
	       (ipld::bytes-to-base32-with-no-padding
		(subseq binary-cid 1))))

(defun generate-block-cid (block)
  (let ((cds (ironclad:digest-sequence :sha256 block)))
    (concatenate 'string
		 "b"
		 (bytes-to-base32-with-no-padding
		  (concatenate 'vector
			       `#(1 #x71 #x12 ,(length cds))
			       cds)))))

(defun generate-cid (data)
  (generate-block-cid (encode data)))
