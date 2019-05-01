;;; basic-menu.el --- Create new menu entry
;;; Commentary:

;;; Code:
;;; Menu pane baru

(easy-menu-define nav-menu nil
  "Menu for word navigation commands."
  '("Navigation"
    ("Character"
     ["Forward" forward-char]
     ["Backward" backward-char])
    ("Word"
     ["Forward" forward-word]
     ["Backward" backward-word])
    ("Line"
     ["Beginning" beginning-of-line]
     ["First indent" back-to-indentation]
     ["End" end-of-line]
     ["Next" next-line]
     ["Prev" previous-line])
    ("Sentences"
     ["Forward" forward-sentence]
     ["Backward" backward-sentence])
    ("Sexp"
     ["Forward" forward-sexp]
     ["Backward" backward-sexp])
    ("Bracket/List"
     ["Into" down-list]
     ["Out" up-list]
     ["Forward" forward-list]
     ["Backward" backward-list])
    ("Paragraph"
     ["Forward" forward-paragraph]
     ["Backaward" backward-paragraph])
    ("Page"
     ["Forward" forward-page]
     ["Backward" backward-page])
    ("Buffer"
     ["Beginning" beginning-of-buffer]
     ["End" end-of-buffer])))

;; Keyboard macro
(easy-menu-define macro-menu nil
  "Macro"
  '("Macro"
    ["Record" kmacro-start-macro]
    ["Stop" kmacro-end-macro]
    ["Play last" kmacro-call-macro
     :active (or last-kbd-macro)]
    ["Name last" kmacro-name-last-macro]
    ["Keybind last" kmacro-bind-to-key]))

(easy-menu-define basic-menu nil
  "Menu for my configuration."
  '("Basic Config"
    ["Config File" aldo/edit-config-file t]
    "--"
    ["NeoTree Toggle" neotree-toggle
     :style toggle
     :selected (neo-global--window-exists-p)]
    ("NeoTree"
     :visible (neo-global--window-exists-p)
     ["New File" neotree-create-node]
     ["Copy" neotree-copy-node]
     ["Delete" neotree-delete-node])
    "--"
    ("Minor Modes"
     ["Glasses Mode" glasses-mode]
     ["Whitespace Mode" whitespace-mode]
     ["CamelCase" subword-mode]
     ["snake_case" superword-mode])
    ("Other"
     ["Butterfly" butterfly t]
     ["Birthday" animate-birthday-present])))

;; Put to menu-bar
(define-key-after (lookup-key global-map [menu-bar])
  [basic-menu-entry]
  (cons "Basic-Config" basic-menu) 'tools)

(define-key-after (lookup-key global-map [menu-bar])
  [nav-menu-entry]
  (cons "Navigation" nav-menu) 'tools)

(define-key-after (lookup-key global-map [menu-bar])
  [macro-menu-entry]
  (cons "Macro" macro-menu) 'tools)

;; sudo edit
(define-key
  global-map
  [menu-bar edit sudo]
  '("Sudo Edit" . sudo-edit))

;;; To remove this menu
;;; (global-unset-key [menu-bar Basic\ Config])
;;; (global-unset-key [menu-bar Navigation])
(provide 'basic-menu)
;;; aldo-menu.el ends here
