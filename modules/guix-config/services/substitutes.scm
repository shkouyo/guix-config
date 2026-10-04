;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services substitutes)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (guix gexp)
  #:export (%substitute-services))

(define %nonguix-signing-key
  (plain-file "nonguix.pub"
              "(public-key (ecc (curve Ed25519) (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)))"))

(define %substitute-services
  ;; guix-service-type folds extensions in reverse order; the list is ordered
  ;; so that SJTU mirrors are queried first, then guix.moe, then nonguix.
  (list (simple-service 'nonguix-substitutes guix-service-type
                        (guix-extension
                         (substitute-urls '("https://substitutes.nonguix.org"))
                         (authorized-keys (list %nonguix-signing-key))))
        (simple-service 'guix-moe guix-service-type
                        (guix-extension
                         (substitute-urls '("https://cache-sg.guix.moe"
                                            "https://cache-fi.guix.moe"
                                            "https://cache-us-lax.guix.moe"))))
        (simple-service 'sjtu-mirrors guix-service-type
                        (guix-extension
                         (substitute-urls '("https://mirror.sjtu.edu.cn/guix"
                                            "https://mirror.sjtu.edu.cn/guix-bordeaux"))))))
