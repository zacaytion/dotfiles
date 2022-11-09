;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Zach Harris"
      user-mail-address "z@zharr.is"
      doom-theme 'modus-vivendi
      doom-font (font-spec :family "JuliaMono" :size 18 :weight 'light )
      doom-serif-font (font-spec :family "Input Serif Narrow" :weight 'light)
      doom-variable-pitch-font (font-spec :family "Source Code Variable" :size 26)
      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil
      load-prefer-newer t
      search-highlight t
      gc-cons-threshold 100000000
      lsp-idle-delay 0.6)

;; ; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setenv "LANG" "en_US")
;;; ORG MODE

(setq org-directory "~/org/"
      org-roam-directory "~/org/roam"
      org-archive-location "~/org/archive/"
      org-agenda-files '("~/org/")
      org-ref-default-bibliography '("~/Nextcloud/bibliography/myBibliography.bib")
      bibtex-completion-bibliography "~/Nextcloud/bibliography/myBibliography.bib")

(after! org
  (setq org-use-property-inheritance t ; it's convenient to have properties inherited
        org-enforce-todo-dependencies t
        org-enforce-todo-checkbox-dependencies t
        org-log-done 'time      ; having the time a item is done sounds convininet
        org-log-into-drawer t
        org-list-allow-alphabetical t     ; have a. A. a) A) list bullets
        org-export-in-background t              ; run export processes in external emacs process
        org-catch-invisible-edits 'smart
        org-journal-dir "~/org/journal/"
        org-journal-date-format "%A, %d %B %Y"
        org-journal-file-type 'weekly))

(after! org-superstar
  (setq org-superstar-headline-bullets-list '("§" "❡" "◊" "※" "○" "⟠" "⦾" "⧫" "⁂" "✧" "⦿" "✦" "⌑")
        org-superstar-prettify-item-bullets t ))

(setq org-ellipsis " ▾ "
      org-hide-leading-stars t
      org-priority-highest ?A
      org-priority-lowest ?E
      )

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
        org-agenda-tags-column 100 ;; from testing this seems to be a good value
        org-agenda-compact-blocks t
        ))

(use-package! org-super-agenda
  :commands (org-super-agenda-mode))


(defvar +org-capture-someday-file "~/org/someday.org")
(defvar +org-capture-personal-file "~/org/personal.org")
(defvar +org-capture-work-file "~/org/postlight.org")
(defvar +org-capture-bucket-file "~/org/bucket.org")


(after! org
  (use-package! doct
    :config
    (setq org-capture-templates
          (doct `(("Personal todo" :keys "t"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %?"
                              "%i %a")
                   )
                  ("Personal note" :keys "n"
                   :file +org-capture-personal-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* %?"
                              "%i %a"))
                  ("Bucket" :keys "b"
                   :file +org-capture-bucket-file
                   :prepend t
                   :headline "Bucket"
                   :type entry
                   :template ("* [ ] %{desc}%? :%{i-type}:"
                              "%i %a")
                   :children (("Webpage" :keys "w"
                               :desc "%(org-cliplink-capture) "
                               :i-type "read:web"
                               )
                              ("Article" :keys "a"
                               :desc ""
                               :i-type "read:reaserch"
                               )
                              ("Information" :keys "i"
                               :desc ""
                               :i-type "read:info"
                               )
                              ("Idea" :keys "I"
                               :desc ""
                               :i-type "idea"
                               )))
                  ("Work" :keys "p"
                   :file +org-capture-work-file
                   :prepend t
                   :headline "Tasks"
                   :type entry
                   :template ("* TODO %? %^G%{extra}"
                              "%i %a")
                   :children (("General Task" :keys "k"
                               :extra ""
                               )
                              ("Task with deadline" :keys "d"
                               :extra "\nDEADLINE: %^{Deadline:}t"
                               )
                              ("Scheduled Task" :keys "s"
                               :extra "\nSCHEDULED: %^{Start time:}t"
                               )
                              ))
                  ("Project" :keys "p"
                   :prepend t
                   :type entry
                   :headline "Inbox"
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :file ""
                   :custom (:time-or-todo "")
                   :children (("Project-local todo" :keys "t"
                               :time-or-todo "TODO"
                               :file +org-capture-project-todo-file)
                              ("Project-local note" :keys "n"
                               :time-or-todo "%U"
                               :file +org-capture-project-notes-file)))
                  ("\tCentralised project templates"
                   :keys "o"
                   :type entry
                   :prepend t
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :children (("Project todo"
                               :keys "t"
                               :prepend nil
                               :time-or-todo "TODO"
                               :heading "Tasks"
                               :file +org-capture-central-project-todo-file)
                              ("Project note"
                               :keys "n"
                               :time-or-todo "%U"
                               :heading "Notes"
                               :file +org-capture-central-project-notes-file))))))))



(global-set-key (kbd "<f6>") #'org-ref-helm-insert-cite-link)


;; Helper function to open file with hotfkey
(defun z/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))

(z/add-file-keybinding "C-c z w" "~/org/postlight.org" "postlight.org")
(z/add-file-keybinding "C-c z p" "~/org/personal.org" "personal.org")
(z/add-file-keybinding "C-c z s" "~/org/someday.org" "someday.org")

;; Org-roam-bibtex
;; (require `org-roam-bibtex)
;; (add-hook 'after-init-hook #'org-roam-bibtex-mode)
;; (define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)


(menu-bar-mode 0) ;menu bar is explicitly turned on for beginners. Change the value to 0.

;; (setq

;; Via https://tecosaur.github.io/emacs-config/config.html
(setq-default tab-width 2                          ; Set width for tabs
              indent-tabs-mode nil
              x-stretch-cursor t                   ; Stretch cursor to the glyph width
              which-key-idle-delay 0.5
              delete-by-moving-to-trash t          ; Delete files to trash
              uniquify-buffer-name-style 'forward  ; Uniquify buffer names
              window-combination-resize t)         ; take new window space from all other windows (not just current)

(setq undo-limit 80000000                          ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                        ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                          ; Nobody likes to loose work, I certainly don't
      inhibit-compacting-font-caches t             ; When there are lots of glyphs, keep them in memory
      truncate-string-ellipsis "…")                ; Unicode ellispis are nicer than "...", and also save

(delete-selection-mode 1)                          ; Replace selection when inserting text
(display-time-mode 1)                              ; Enable time in the mode-line
(global-subword-mode 1)                            ; Iterate through CamelCase words

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Don't add package repos to projectile
(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

(use-package! vlf-setup
  :defer-incrementally vlf-tune vlf-base vlf-write vlf-search vlf-occur vlf-follow vlf-ediff vlf)

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

(use-package! info-colors
  :commands (info-colors-fontify-node))
(add-hook 'Info-selection-hook 'info-colors-fontify-node)
(add-hook 'Info-mode-hook #'mixed-pitch-mode)

(setq ispell-dictionary "en_US-custom")
(setq ispell-program-name "hunspell")
(ispell-check-version)
(setq ispell-personal-dictionary (expand-file-name ".ispell_personal" doom-private-dir))

(after! spell-fu
  (setq spell-fu-idle-delay 0.5))

(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

(setq-hook! 'typescript-mode-hook +format-with-lsp :none )
(setq-hook! 'rjsx-mode-hook +format-with-lsp :none )

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


(setq flycheck-textlint-config "~/.config/textlint/textlintrc.json")

(after! lsp-mode
  (setq ;; If an LSP server isn't present when I start a prog-mode buffer, you
        ;; don't need to tell me. I know. On some machines I don't care to have
        ;; a whole development environment for some ecosystems.
        lsp-enable-suggest-server-download nil))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))
