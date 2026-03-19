(asdf:defsystem #:cl-dasl-tests
  :description "DASL encoder/decoder (test suite)"
  :author "Mihai Bazon <mihai.bazon@gmail.com> and Tomohiko Morioka"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-dasl #:parachute #:yason #:equals #:local-time #:alexandria)
  :components ((:file "test/package")
               (:file "test/utils")
               (:file "test/core")
               (:file "test/clext")))
