;;; init.el --- Emacs init.el
;; (package-initialize)

(setq custom-file (make-temp-file "emacs-custom"))
(load custom-file)

;; Call python script to tangle this faster
;; next line not work because HOME is probably not real.
;; (add-to-list 'exec-path "~/bin")
(let ((config-file (expand-file-name "config.org" user-emacs-directory)))
  (let ((default-directory user-emacs-directory))
    (message "call process org-babel-tangle")
    (with-demoted-errors "%S"
      (with-output-to-string
        (with-current-buffer
            standard-output
          (call-process "org-babel-tangle" config-file t t)))))
  (org-babel-load-file config-file))

;; EXWM
(let ((config-exwm (expand-file-name "config-exwm.el" user-emacs-directory)))
  (when (file-exists-p config-exwm)
    (load config-exwm)))

;; Replace HOME
(setq default-directory user-home-real-dir)
(setenv "HOME" (directory-file-name user-home-real-dir))
