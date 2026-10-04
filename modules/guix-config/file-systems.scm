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
          (device (uuid "23F3-28E1" 'fat32))
          (type "vfat"))
        (file-system
          (mount-point "/")
          (device (uuid "556bf0dc-806f-4f0a-ad3b-744a6fd1db63"
                        'ext4))
          (type "ext4"))))

(define %swap-devices
  (list (swap-space
          (target (uuid "45cbc7b4-859b-4126-9dfb-e2be0292c655")))))
