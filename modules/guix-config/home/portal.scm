;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config home portal)
  #:use-module (gnu home services)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages polkit)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:export (portal-packages
            portal-config-files))

(define portal-packages
  (list xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        gnome-keyring
        polkit-gnome))

(define portal-config-files
  (simple-service 'portal-config-files
                  home-xdg-configuration-files-service-type
                  (list (list "xdg-desktop-portal/niri-portals.conf"
                              (local-file "../../../files/dotfiles/xdg-desktop-portal/niri-portals.conf")))))
