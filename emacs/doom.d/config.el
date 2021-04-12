;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zach Harris"
      user-mail-address "z@zharr.is")
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Operator Mono" :size 14 :weight 'light )
      doom-big-font (font-spec :family "Operator Mono" :size 26 :weight 'light)
      doom-serif-font (font-spec :family "Space Mono" :size 14 :weight 'light)
      doom-unicode-font (font-spec :family "Noto Sans" :size 14 )
      doom-variable-pitch-font (font-spec :family "Source Code Variable" :size 14 :weight 'light))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(menu-bar-mode 0)
(beacon-mode 1)
(setq frame-resize-pixelwise t)

;; Set the body text width
(setq olivetti-body-width 100)
;; Enable Olivetti for text-related mode such as Org Mode
(add-hook! 'text-mode-hook 'olivetti-mode)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setenv "LANG" "en_US")

(after! org
  (setq org-archive-location "~/org/archive/"
        org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED"))
        org-use-property-inheritance t ; it's convenient to have properties inherited
        org-enforce-todo-dependencies t
        org-enforce-todo-checkbox-dependencies t
        org-log-done 'time         ; having the time a item is done sounds convininet
        org-list-allow-alphabetical t        ; have a. A. a) A) list bullets
        org-catch-invisible-edits 'smart))
 ; try not to accidently do weird stuff in invisible regions

(after! org-agenda)

(after! org-roam
  (setq org-roam-directory "~/org/roam")
  (add-hook 'after-init-hook 'org-roam-mode))

(after! org-ref
  ;; Set up bibliography
  (setq org-ref-default-bibliography '("~/nextcloud/bibliography/myBibliography.bib"))
  (setq bibtex-completion-bibliography "~/nextcloud/bibliography/myBibliography.bib")
  (global-set-key (kbd "<f6>") #'org-ref-helm-insert-cite-link)

  (after! org-roam-bibtext
    (add-hook 'after-init-hook #'org-roam-bibtex-mode)
    (define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)))

;; Via https://tecosaur.github.io/emacs-config/config.html
(setq-default tab-width 2                          ; Set width for tabs
              x-stretch-cursor t                   ; Stretch cursor to the glyph width
              which-key-idle-delay 0.5        
              delete-by-moving-to-trash t          ; Delete files to trash
              uniquify-buffer-name-style 'forward  ; Uniquify buffer names
              window-combination-resize t)         ; take new window space from all other windows (not just current)

(setq undo-limit 80000000                          ; Raise undo-limit to 80Mb
      auto-save-default t                          ; Nobody likes to loose work, I certainly don't
      inhibit-compacting-font-caches t             ; When there are lots of glyphs, keep them in memory
      truncate-string-ellipsis "…")                ; Unicode ellispis are nicer than "...", and also save

(after! evil (setq evil-want-fine-undo t))           ; By default while in insert all changes are one big blob. Be more granular

(delete-selection-mode 1)                          ; Replace selection when inserting text
(display-time-mode 1)                              ; Enable time in the mode-line
(global-subword-mode 1)                            ; Iterate through CamelCase words

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook! 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Don't add package repos to projectile
(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

(use-package! vlf-setup
  :defer-incrementally vlf-tune vlf-base vlf-write vlf-search vlf-occur vlf-follow vlf-ediff vlf)

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

(use-package! info-colors
  :commands (info-colors-fontify-node))
(add-hook! 'Info-selection-hook 'info-colors-fontify-node)
(add-hook! 'Info-mode-hook #'mixed-pitch-mode)


;; Increase visibility of ace-window letters
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5 :box (:line-width 10 :color "red")))

(use-package! doct
  :commands (doct))

(setq org-capture-templates
        (doct `(("Personal todo" :keys "t"
                :file "~/org/inbox.org"
                :prepend t
                :headline "Tasks"
                :type entry
                :template ("* TODO %?"
                        "%i %a")
                )
                ("Personal note" :keys "n"
                :file "~/org/inbox.org"
                :prepend t
                :headline "Notes"
                :type entry
                :template ("* %?"
                        "%i %a")
                )
                ("Probable Futures" :keys "p"
                :file "~/Projects/ProbableFutures/__NOTES.org"
                :prepend t
                :headline "Inbox"
                :type entry
                :template ("* TODO %?"
                        "%i %a")
                )
                ;; ("Interesting" :keys "i"
                ;;  :icon ("eye" :set "faicon" :color "lcyan")
                ;;  :file +org-capture-todo-file
                ;;  :prepend t
                ;;  :headline "Interesting"
                ;;  :type entry
                ;;  :template ("* [ ] %{desc}%? :%{i-type}:"
                ;;             "%i %a")
                ;;  :children (("Webpage" :keys "w"
                ;;              :icon ("globe" :set "faicon" :color "green")
                ;;              :desc "%(org-cliplink-capture) "
                ;;              :i-type "read:web"
                ;;              )
                ;;             ("Article" :keys "a"
                ;;              :icon ("file-text" :set "octicon" :color "yellow")
                ;;              :desc ""
                ;;              :i-type "read:reaserch"
                ;;              )
                ;;             ("\tRecipie" :keys "r"
                ;;              :icon ("spoon" :set "faicon" :color "dorange")
                ;;              :file +org-capture-recipies
                ;;              :headline "Unsorted"
                ;;              :template "%(org-chef-get-recipe-from-url)"
                ;;              )
                ;;             ("Information" :keys "i"
                ;;              :icon ("info-circle" :set "faicon" :color "blue")
                ;;              :desc ""
                ;;              :i-type "read:info"
                ;;              )
                ;;             ("Idea" :keys "I"
                ;;              :icon ("bubble_chart" :set "material" :color "silver")
                ;;              :desc ""
                ;;              :i-type "idea"
                ;;              )))

                )))
