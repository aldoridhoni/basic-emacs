;;; init.el --- Emacs init.el
;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 '(custom-safe-themes
   (quote
    ("3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" default)))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-reveal-mode t)
 '(package-selected-packages
   (quote
    (php-mode rust-mode fish-mode restart-emacs use-package org-bullets typescript-mode company flycheck material-theme monokai-theme which-key web-mode helm-projectile helm-descbinds)))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 )

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; Replace HOME
(setq default-directory user-home-real-dir)
(setenv "HOME" user-home-real-dir)
