;;; config-exwm.el --- EXWM config file
;;; Commentary:
;;; run with xinit -- vt01
;;; Code:
(use-package exwm
  ;; Call function `exwm-init'
  :defer t
  :init
  (progn
    ;; Turn on debugging
    (setq exwm-debug-on t)
    (setq debug-on-error t))
  :config
  (progn
    (message "Loading exwm")
    (require 'exwm-config)

    (defvar config-exwm--timer-lock nil
      "TIMER item. Use `cancel-timer' to remove.")

    (defvar config-exwm--lock-screen-exec '("slock")
      "Executable to lock screen in X.")

    (defvar config-exwm--screenshot-exec '("scrot"
                                           "%Y-%m-%d-%H:%M:%S_$wx$h.png"
                                           "-e" "mv $f ~/Pictures/")
      "Executable for taking screenshot.")

    (defvar config-exwm--increase-volume-exec '("amixer" "set" "Master" "10%+")
      "Increase volume using amixer")

    (defvar config-exwm--decrease-volume-exec '("amixer" "set" "Master" "10%-")
      "Decrease volume using amixer")

    (defun config-exwm--setup-randr ()
      "Auto setup randr"
      )

    (defun config-exwm--update-buffer-name ()
      "Update buffer name with title."
      (interactive)
      (exwm-workspace-rename-buffer
       (concat exwm-class-name " [" exwm-title "]"))
      )

    (defun config-exwm--lock-screen ()
      "Lock the screen using 'slock'"
      (interactive)
      (apply #'start-process "" nil config-exwm--lock-screen-exec))

    (defun config-exwm--take-screenshot ()
      "Take screenshot using 'scrot'"
      (interactive)
      (apply #'start-process "" nil config-exwm--screenshot-exec))

    (defun config-exwm--set-lock-screen-timer (secs)
      "Set lock screen TIMER in seconds."
      (interactive "nSeconds: ")
      (and config-exwm--timer-lock (cancel-timer config-exwm--timer-lock))
      (setq config-exwm--timer-lock nil)
      (setq config-exwm--timer-lock
            (run-with-idle-timer (* 1 secs) t 'config-exwm--lock-screen)))

    (defun config-exwm--next-exmw-buffer ()
      "Simple EXWM window switcher."
      (interactive)
      (next-buffer)
      (while
          (not (eq major-mode 'exwm-mode))
        (next-buffer)))

    (defun config-exwm--increase-volume ()
      "Increasing volume."
      (interactive)
      (apply #'start-process "" nil config-exwm--increase-volume-exec))

    (defun config-exwm--decrease-volume ()
      "Decreasing volume."
      (interactive)
      (apply #'start-process "" nil config-exwm--decrease-volume-exec))

    ;; Set the initial workspace number.
    (setq exwm-workspace-number 2)

    ;; Minibuffer location bottom fixed
    (setq exwm-workspace-minibuffer-position 'nil)

    ;; Hooks to hide mode line in exwm buffer
    (add-hook 'exwm-manage-finish-hook #'exwm-layout-hide-mode-line)

    ;; Make class name the buffer name
    (add-hook 'exwm-update-class-hook
              (lambda ()
                (exwm-workspace-rename-buffer exwm-class-name)))

    ;; Hacks to make buffer truly fullscreen
    (add-hook 'exwm-init-hook
              (lambda ()
                ;; (exwm-workspace--set-active (selected-frame) t)
                (exwm-workspace--set-fullscreen (selected-frame))
                ))

    ;; Keys
    (setq exwm-input-global-keys
          `(,`(,(kbd "s-r") . exwm-reset)
            ,`(,(kbd "s-w") . exwm-workspace-switch)
            ,`(,(kbd "s-<tab>") . config-exwm--next-exmw-buffer)
            ,`(,(kbd "<XF86Forward>") . next-buffer)
            ,`(,(kbd "<XF86Back>") . previous-buffer)
            ,`(,(kbd "<XF86AudioRaiseVolume>") . config-exwm--increase-volume)
            ,`(,(kbd "<XF86AudioLowerVolume>") . config-exwm--decrease-volume)
            ,`(,(kbd "<XF86Display>") . config-exwm--setup-randr)
            ,`(,(kbd "s-l") . config-exwm--lock-screen)
            ,`(,(kbd "s-&") .
               (lambda (command)
                 (interactive (list (read-shell-command "&? ")))
                 (start-process-shell-command command nil command)))
            ,`(,(kbd "<print>") . config-exwm--take-screenshot)
            ))

    ;; 's-N': Switch to certain workspace
    (dotimes (i 10)
      (exwm-input-set-key (kbd (format "s-%d" i))
                          `(lambda ()
                             (interactive)
                             (exwm-workspace-switch-create ,i))))

    ;; Line-editing shortcuts
    (setq exwm-input-simulation-keys
          '(([?\C-b] . [left])
            ([?\C-f] . [right])
            ([?\C-p] . [up])
            ([?\C-n] . [down])
            ([?\C-a] . [home])
            ([?\C-e] . [end])
            ([?\M-v] . [prior])
            ([?\C-v] . [next])
            ([?\C-d] . [delete])
            ([?\C-k] . [S-end delete])))

    ;; window navigation change to <super>
    (windmove-default-keybindings 's)

    ;; Configure Ido
    (exwm-config-ido)
    (exwm-config-misc)

    ;; display batt & time
    (display-time-mode)
    (display-battery-mode)
    )
  )

;;; config-exwm.el ends here
