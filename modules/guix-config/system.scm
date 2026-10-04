;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config system)
  #:use-module (gnu)
  #:use-module (guix-config bootloader)
  #:use-module (guix-config file-systems)
  #:use-module (guix-config keyboard)
  #:use-module (guix-config services base)
  #:use-module (guix-config services firewall)
  #:use-module (guix-config services network)
  #:use-module (guix-config services ntp)
  #:use-module (guix-config services ssh)
  #:use-module (guix-config services substitutes)
  #:export (system))

(define system
  (operating-system
    (locale "C.utf8")
    (timezone "Etc/GMT-8")
    (keyboard-layout %keyboard-layout)
    (host-name "px7ry0")
    (users (cons* (user-account
                    (name "shkouyo")
                    (comment "ShinKouyo")
                    (group "users")
                    (home-directory "/home/shkouyo")
                    (supplementary-groups '("wheel" "netdev" "audio" "video")))
                  %base-user-accounts))
    (services
     (append (list ssh-service ntp-service firewall-service)
             %network-services
             %substitute-services
             %base-services*))
    (bootloader %bootloader-configuration)
    (swap-devices %swap-devices)
    (file-systems (append %file-systems %base-file-systems))))
