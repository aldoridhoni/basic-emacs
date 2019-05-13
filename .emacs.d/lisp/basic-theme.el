;;; basic-theme.el --- Personal theme
(deftheme basic
;;; Commentary:
  "Created 2018-06-23. Based of Material Light & Espresso color
   Updated 2019-04-16: Change few faces based of BBEdit light color")
;;; Code:
(custom-theme-set-faces
 'basic
 '(default ((t (:foundry "fsdf" :width normal :weight normal :slant normal :underline nil
                         :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#131313"
                         :background "#F7F7F7" :stipple nil :inherit nil))))
 '(cursor ((t (:background "#FF5722"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan"))
                 (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(homoglyph ((((background dark)) (:foreground "cyan"))
              (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "#2196f3"))))
 '(highlight ((t (:inverse-video nil :background "#ECEFF1"))))
 '(region ((t (:background "#90A4AE"))))
 '(shadow ((t (:foreground "#607d8b"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#bf616a"))))
 '(trailing-whitespace ((t (:underline nil :inverse-video t :foreground "#B71C1C"))))
 ;; Font Lock
 '(font-lock-builtin-face ((t (:weight normal :foreground "#626fc9"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#607d8b"))))
 '(font-lock-comment-face ((t (:foreground "#7f7f7f"))))
 '(font-lock-constant-face ((t (:foreground "#007681"))))
 '(font-lock-doc-face ((t (:foreground "#c73a81"))))
 '(font-lock-function-name-face ((t (:foreground "#43279a"))))
 '(font-lock-keyword-face ((t (:weight normal :foreground "#374ef4"))))
 '(font-lock-negation-char-face ((t (:foreground "#2196f3"))))
 '(font-lock-preprocessor-face ((t (:foreground "#2637af"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#FFA000"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#4527A0"))))
 '(font-lock-string-face ((t (:foreground "#bd166a"))))
 '(font-lock-type-face ((t (:slant normal :foreground "#699d36"))))
 '(font-lock-variable-name-face ((t (:foreground "#187818"))))
 '(font-lock-warning-face ((t (:weight bold :slant italic :underline
                                       (:color foreground-color :style line) :foreground "#f93232"))))
 ;; Org
 '(org-level-1 ((t (:weight normal :foreground "#3a81c3" :background nil))))
 '(org-level-2 ((t (:weight normal :foreground "#43279a" :background nil))))
 '(org-level-3 ((t (:weight normal :foreground "#626fc9" :background nil))))
 '(org-code ((t (:background nil))))
 '(org-hide ((t (:foreground "#F7F7F7"))))
 '(org-block-background ((t (:background "#f4f4f4"))))
 '(org-block-begin-line ((t (:background "#eaeaef" :foreground "#7e7e7e" :box nil :slant italic))))
 '(org-block-end-line ((t (:background "#eaeaef" :foreground "#7e7e7e" :box nil :slant italic))))
 ;; Helm
 '(helm-ff-file ((t (:foreground "#4499ff" :background nil))))
 '(helm-ff-dotted-directory ((t (:foreground "#121212" :background nil))))
 '(helm-selection-line ((t (:background "#e8e8e8"))))
 '(helm-source-header ((t (:background "#e8e8e8"))))
 ;; Which Key
 '(which-key-local-map-description-face ((t (:foreground "dark orange"))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line)))))
 '(link-visited ((default (:inherit (link)))
                 (((class color) (background light)) (:foreground "magenta4"))
                 (((class color) (background dark)) (:foreground "violet"))))
 '(fringe ((t (:background "#ECEFF1"))))
 '(header-line ((t (:foreground "#4527A0" :inherit (mode-line)))))
 '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow"))
            (t (:inherit (variable-pitch)))))
 ;; Mode line
 '(mode-line ((t (:box nil :foreground "#212121" :background "#E8E8E8"))))
 '(mode-line-buffer-id ((t (:weight bold :foreground "#212121"))))
 '(mode-line-emphasis ((t (:slant italic :foreground "#212121"))))
 '(mode-line-highlight ((t (:box nil :foreground "#4527A0"))))
 '(mode-line-inactive ((t (:weight normal :box nil :foreground "#888888" :background "#EEEEEE" :inherit (mode-line)))))
 ;; Telephone Line
 '(telephone-line-accent-active ((t (:foreground "white" :background "grey11"))))
 '(telephone-line-accent-inactive ((t (:foreground "white" :background "grey33"))))
 '(telephone-line-projectile ((t :foreground "midnightblue" :bold t)))
 ;; Other
 '(isearch ((t (:foreground "#FAFAFA" :background "#558b2f"))))
 '(isearch-fail ((t (:inverse-video t :background "#FAFAFA" :inherit (font-lock-warning-face)))))
 '(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise"))
                   (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4"))
                   (((class color) (min-colors 16)) (:background "turquoise3"))
                   (((class color) (min-colors 8)) (:background "turquoise3"))
                   (t (:underline (:color foreground-color :style line)))))
 '(match ((t (:inverse-video nil :foreground "#FAFAFA" :background "#558b2f"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'basic)
;;; basic-theme.el ends here
