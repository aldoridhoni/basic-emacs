;;; init.el --- Emacs init.el
;; (package-initialize)

;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file (make-temp-file "emacs-custom"))
(load custom-file)

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; Replace HOME
(setq default-directory user-home-real-dir)
(setenv "HOME" (directory-file-name user-home-real-dir))
