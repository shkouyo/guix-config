;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(cons* (channel
        (inherit (car %default-channels))
        (url "https://mirror.sjtu.edu.cn/git/guix.git"))
       (channel
        (name 'guix-config)
        (url "https://git.0x0f.dev/~shkouyo/guix-config")
        (branch "main"))
       (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
       (cdr %default-channels))
