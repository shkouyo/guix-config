;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config home kitty)
  #:use-module (gnu home services)
  #:use-module (gnu packages terminals)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:export (kitty-packages
            kitty-config-files))

(define kitty-packages
  (list kitty))

(define kitty-config-files
  (simple-service 'kitty-config-files
                  home-xdg-configuration-files-service-type
                  (list (list "kitty/kitty.conf"
                              (local-file "../../../files/dotfiles/kitty/kitty.conf")))))
