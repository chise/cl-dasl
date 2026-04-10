;;;; package.lisp

(defpackage #:cl-dasl
  (:nicknames :dasl :ipld)
  (:use #:cl)
  (:export #:generate-cid
           #:base32-cid-to-binary-cid
	   #:binary-cid-to-base32-cid
	   #:dCBOR42-decode
	   #:encode #:decode
           #:encode-object
           #:*jsown-semantics*
           #:*array-format*
           #:*dictionary-format*
           #:*symbol-to-string*
           #:*symbols-package*
           #:*string-to-symbol*
           #:*strict*
           #:*use-stringrefs*
           #:*use-sharedrefs*
           #:cbor-error
           #:cbor-encode-error
           #:cbor-decode-error
           #:error-text
           #:error-stream
           #:error-position
           #:*custom-tag-reader*
           #:memstream
           #:make-memstream
           #:with-ms-position
           #:ms-read-byte
           #:ms-peek-byte
           #:ms-write-byte
           #:ms-read-sequence
           #:ms-write-sequence
           #:ms-whole-data
	   #:plist-p
	   #:plist-to-alist))
