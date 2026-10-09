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
                              (local-file "../../../files/dotfiles/kitty/kitty.conf"))
                        (list "kitty/fonts.conf"
                              (local-file "../../../files/dotfiles/kitty/fonts.conf"))
                        (list "kitty/cursor.conf"
                              (local-file "../../../files/dotfiles/kitty/cursor.conf"))
                        (list "kitty/scrollback.conf"
                              (local-file "../../../files/dotfiles/kitty/scrollback.conf"))
                        (list "kitty/mouse.conf"
                              (local-file "../../../files/dotfiles/kitty/mouse.conf"))
                        (list "kitty/performance.conf"
                              (local-file "../../../files/dotfiles/kitty/performance.conf"))
                        (list "kitty/bell.conf"
                              (local-file "../../../files/dotfiles/kitty/bell.conf"))
                        (list "kitty/window.conf"
                              (local-file "../../../files/dotfiles/kitty/window.conf"))
                        (list "kitty/tab-bar.conf"
                              (local-file "../../../files/dotfiles/kitty/tab-bar.conf"))
                        (list "kitty/colors.conf"
                              (local-file "../../../files/dotfiles/kitty/colors.conf"))
                        (list "kitty/advanced.conf"
                              (local-file "../../../files/dotfiles/kitty/advanced.conf"))
                        (list "kitty/os.conf"
                              (local-file "../../../files/dotfiles/kitty/os.conf"))
                        (list "kitty/keys.conf"
                              (local-file "../../../files/dotfiles/kitty/keys.conf")))))
