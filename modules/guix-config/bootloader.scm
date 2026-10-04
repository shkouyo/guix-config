;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config bootloader)
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
  #:use-module (guix-config keyboard)
  #:export (%bootloader-configuration))

(define %bootloader-configuration
  (bootloader-configuration
   (bootloader grub-efi-bootloader)
   (targets (list "/boot/efi"))
   (keyboard-layout %keyboard-layout)
   (timeout 1)
   (theme (grub-theme
           (image #f)))))
