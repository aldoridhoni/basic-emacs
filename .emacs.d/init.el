;;; init.el --- Emacs init.el
;; (package-initialize)

(setq custom-file (make-temp-file "emacs-custom"))
(load custom-file)

(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; EXWM
(let ((config-exwm (expand-file-name "config-exwm.el" user-emacs-directory)))
  (when (file-exists-p config-exwm)
    (load config-exwm)))

;; Replace HOME
(setq default-directory user-home-real-dir)
(setenv "HOME" (directory-file-name user-home-real-dir))
