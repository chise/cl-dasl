# CL-DASL
A Common Lisp based implementation of [DASL](https://dasl.ing/).
DASL (Data-Addressed Structures & Links) is a subset of IPLD,
the data model layer of IPFS
(InterPlanetary File System), which is a protocol, hypermedia (like
web) and global file system based on distributed hash table and
content-addressable global namespace.

This package is based on CBOR encoder/decoder for Common Lisp ([cbor.lisp](https://github.com/mishoo/cbor.lisp)) by
_Mihai Bazon <mihai.bazon@gmail.com>_.


## Installation

1. Clone this repository in a ql:*local-project-directories*

```
* ql:*local-project-directories*
(#P"/home/me/quicklisp/local-projects/")
* (quit)

% cd ~/quicklisp/local-projects/

% git clone git@gitlab.nijl.ac.jp:CHISE/cl-dasl.git
```

2. Register it

```
% sbcl

* (ql:register-local-projects)
NIL
* (quit)
```

3. Load it

```
% sbcl

* (ql:quickload :cl-dasl)
```


## Usage

Currently, this package only provides CID generator, CID converter and
dCROR42 decoder.
```
(dasl:generate-cid '(("Hello" . "world")))
-> "bafyreienby2jplt24irbffyiswxk2lhnpczmszpy3d2oi7niyaqltexipe"
```

```
(dasl:base32-cid-to-binary-cid "bafyreienby2jplt24irbffyiswxk2lhnpczmszpy3d2oi7niyaqltexipe")
-> #(0 1 113 18 32 141 14 52 151 174 122 226 34 18 151 8 149 174 173 44 237 120
     178 201 101 248 216 244 228 125 168 192 32 185 146 232 121)
```

```
(dasl:binary-cid-to-base32-cid
 #(0 1 113 18 32 141 14 52 151 174 122 226 34 18 151 8 149 174 173 44 237 120
   178 201 101 248 216 244 228 125 168 192 32 185 146 232 121))
-> "bafyreienby2jplt24irbffyiswxk2lhnpczmszpy3d2oi7niyaqltexipe"
```

This package uses cbor.lisp to encode as dCBOR42, so please use
cbor:encode as dCROR42 encoder.
```
(cbor:encode '(("Hello" . "world")))
-> #(161 101 72 101 108 108 111 101 119 111 114 108 100)
```

```
(ql:quickload :cl-ipfs-api2)
(dasl:dCBOR42-decode
  (map '(vector (unsigned-byte 8)) #'char-code
       (cl-ipfs-api2:block-get
	"bafyreihf24trtqtltseiuujai2esremtihbcfjvqpn3jt2xhz6xpo3iio4")))
-> ((:spec ("/" . "bafyreicy7j6egl35piw752ms2lnbwdnckc2dw53laiemlwioelmodtgnta"))
    (:granularity . "abstract-glyph"))
```


## License

MIT
