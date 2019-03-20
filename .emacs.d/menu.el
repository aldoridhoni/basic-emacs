;;; menu.el --- Create new menu entry
;;; Commentary:

;;; Code:
;;; Menu pane baru

(easy-menu-define words-menu global-map
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
(easy-menu-define macro-menu global-map
  "Macro"
  '("Macro"
    ["Record" kmacro-start-macro]
    ["Stop" kmacro-end-macro]
    ["Play last" kmacro-call-macro
     :active (or last-kbd-macro)]
    ["Name last" kmacro-name-last-macro]
    ["Keybind last" kmacro-bind-to-key]))

(easy-menu-define basic-menu global-map
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
     ["Butterfly" butterfly t])))

;; sudo edit
(define-key
  global-map
  [menu-bar edit sudo]
  '("Sudo Edit" . sudo-edit))

;;; To remove this menu
;;; (global-unset-key [menu-bar Basic\ Config])
;;; (global-unset-key [menu-bar Navigation])
(provide 'menu)
;;; menu.el ends here
