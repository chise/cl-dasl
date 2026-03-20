;;;; cl-dasl.asd

(asdf:defsystem #:cl-dasl
  :description "DASL encoder/decoder"
  :author "Mihai Bazon <mihai.bazon@gmail.com> and Tomohiko Morioka"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:trivial-utf-8
               #:ieee-floats
               #:local-time
               #:closer-mop
	       #:ironclad
	       #:cl-base32)
  :components ((:file "package")
               (:file "cl-dasl")
               (:file "errors")
               (:file "stringref")
               (:file "circular")
               (:file "memstream")
               (:file "cid")
               (:file "encode" :depends-on ("cid"))
               (:file "decode" :depends-on ("cid"))))
