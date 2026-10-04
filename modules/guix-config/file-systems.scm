;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config file-systems)
  #:use-module (gnu system file-systems)
  #:export (%file-systems
            %swap-devices))

(define %file-systems
  (list (file-system
          (mount-point "/boot/efi")
          (device (uuid "FBB8-E465" 'fat32))
          (type "vfat"))
        (file-system
          (mount-point "/")
          (device (uuid "9386d409-d168-408f-80e9-b3dcd0e804f9"
                        'ext4))
          (type "ext4"))))

(define %swap-devices
  (list (swap-space
          (target (uuid "3c642bd7-471d-4a9c-9a40-44f85fa477f3")))))
