(remove-hook 'org-mode-hook #'+literate-enable-recompile-h)

(setq user-full-name "Zach Harris"
      user-mail-address "z@zharr.is")

(setenv "LANG" "en_US")

(setq undo-limit 80000000
      evil-want-fine-undo t)

(setq  auto-save-default t)

(setq  load-prefer-newer t)

(setq doom-theme 'modus-vivendi)

(setq doom-font (font-spec :family "Iosevka Comfy" :size 18)
      doom-big-font (font-spec :family "Iosevka Comfy Wide Duo")
      doom-serif-font (font-spec :family "Iosevka Comfy Motion" :size 18)
      doom-variable-pitch-font (font-spec :family "Iosevka Comfy Motion Duo" :size 16))

(setq all-the-icons-scale-factor 1.1)

(setq display-line-numbers t
      truncate-string-ellipsis "…")
(setq-default tab-width 2
              indent-tabs-mode nil)

(setq search-highlight t)

(after! vertico
      (setq which-key-use-C-h-commands t))

(after! dap-mode
  (require 'dap-dlv-go) ;; Golang debuggin
  (require 'dap-chrome) ;; Chrome JS Debugging
  (require 'dap-node) ;; Node JS Debugging

  ;; A workaround to correctly show breakpoints
  ;; from: https://github.com/emacs-lsp/dap-mode/issues/374#issuecomment-1140399819
  (add-hook! +dap-running-session-mode
    (set-window-buffer nil (current-buffer))))

(after! spell-fu
  (setq ispell-dictionary "en-custom")
  (setq ispell-personal-dictionary (expand-file-name ".ispell_personal" doom-private-dir)))

(setq org-directory "~/org/"
      org-archive-location "~/org/archive/")
(after! org
  (setq org-use-property-inheritance t
        org-enforce-todo-dependencies t
        org-enforce-todo-checkbox-dependencies t
        org-log-done 'time
        org-log-into-drawer t
        org-list-allow-alphabetical t
        org-export-in-background t
        org-catch-invisible-edits 'smart
        org-journal-dir "~/org/journal/"
        org-journal-date-format "%A, %d %B %Y"
        org-journal-file-type 'weekly)
        org-ellipsis " ▾ "
        org-hide-leading-stars t
        org-priority-highest ?A
        org-priority-lowest ?E)

(use-package! org-modern
:hook (org-mode . org-modern-mode)
:config
(setq
org-modern-star '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
org-modern-table-vertical 1
org-modern-table-horizontal 0.2
org-modern-list '((43 . "•")
                    (45 . "–")
                    (42 . "∘"))
;; Edit settings
org-auto-align-tags nil
org-tags-column 0
org-catch-invisible-edits 'show-and-error
org-special-ctrl-a/e t
org-insert-heading-respect-content t
;; Appearance
org-modern-todo nil
org-modern-tag nil
org-modern-timestamp t
org-modern-statistics nil
org-modern-progress nil
org-modern-priority nil
org-modern-horizontal-rule (make-string 36 ?─)
org-modern-keyword "‣"
))

(after! spell-fu
(cl-pushnew 'org-modern-tag (alist-get 'org-mode +spell-excluded-faces-alist)))

(use-package! org-appear
  :hook
  (org-mode . org-appear-mode)
  :config
  (setq org-hide-emphasis-markers t))

(setq  org-agenda-files '("~/org/cal"))
(after! org-agenda
  (org-super-agenda-mode)
  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          ;; Indent todo items by level to show nesting
          (todo . " %i %-12:c%l")
          (tags . " %i %-12:c")
          (search . " %i %-12:c")))
  (setq org-agenda-include-diary t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        org-agenda-block-separator nil
        org-agenda-tags-column 100
        org-agenda-compact-blocks t))

(use-package! org-super-agenda
  :commands (org-super-agenda-mode))

(defvar +org-capture-someday-file "~/org/someday.org")
(defvar +org-capture-personal-file "~/org/personal.org")
(defvar +org-capture-work-file "~/org/work.org")
(defvar +org-capture-bucket-file "~/org/bucket.org")

(setq org-roam-directory "~/org/roam"
      org-agenda-files '("~/org/cal"))

(use-package! mermaid-mode
  :commands mermaid-mode
  :mode "\\.mmd\\'")

(use-package! ob-mermaid
  :after org
  :init
  (after! org
    (add-to-list 'org-babel-load-languages '(mermaid . t))))
