;;; init.el --- Emacs init.el
;; (package-initialize)

;;; Commentary:
;; Initialize

;;; Code:
;; Load before-init.el
(when (file-exists-p (concat user-emacs-directory "before-init.el"))
  (load (concat user-emacs-directory "before-init.el")))

(setq custom-file (make-temp-file "emacs-custom"))
(load custom-file)

;; Supress cl is deprecated warning
(setq byte-compile-warnings '(cl-functions))

;; Call python script to tangle this faster
;; next line not work because HOME is probably not real.
;; (add-to-list 'exec-path "~/bin")
(let ((config-file (expand-file-name "config.org" user-emacs-directory))
      (config-lisp (expand-file-name "config.el" user-emacs-directory)))
  (when (not (file-exists-p config-lisp))
    (org-babel-load-file config-file))
  (if (file-newer-than-file-p config-file config-lisp)
      (progn
        (let ((default-directory user-emacs-directory))
          (message "call process org-babel-tangle")
          (with-demoted-errors "%S"
            (with-output-to-string
              (with-current-buffer
                  standard-output
                (call-process "org-babel-tangle" config-file t t)))))
        (org-babel-load-file config-file))
    (load config-lisp)))

;; Private per machine config.el
(let ((local-config (expand-file-name "config.el"
                                      (concat user-emacs-directory config-private-directory))))
  (when (file-exists-p local-config)
    (load local-config)))

;; EXWM
(let ((config-exwm (expand-file-name "config-exwm.el" user-emacs-directory)))
  (when (file-exists-p config-exwm)
    (load config-exwm)))

(redisplay)

;; Replace HOME
(setq default-directory user-home-real-dir)
(setenv "HOME" (directory-file-name user-home-real-dir))
