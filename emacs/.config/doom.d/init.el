;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;;bidi
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       company
       ;;helm
       ;;ido
       ;;(ivy +fuzzy
       ;;      +icons
       ;;      +prescient)
       (vertico +icons )

       :ui
       ;;deft
       doom
       doom-dashboard
       doom-quit
       (emoji +unicode +github)
       ;;fill-column
       hl-todo
       ;;hydra
       indent-guides
       ;;ligatures
       ;;minimap
       modeline
       nav-flash
       ;;neotree
       ophints
       (popup +all +defaults)
       ;;tabs
       (treemacs +lsp)
       ;;unicode
       (vc-gutter +diff-hl)
       vi-tilde-fringe
       (window-select +numbers)
       workspaces
       ;;zen

       :editor
       (evil +everywhere)               ; come to the dark side, we have cookies
       file-templates                   ; auto-snippets for empty files
       fold                             ; (nigh) universal code folding
       format                 ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       ;;lispy                       ; vim for lisp, for people who don't like vim
       multiple-cursors            ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets
       word-wrap

       :emacs
       (dired +ranger +icons)
       electric
       (ibuffer +icons)
       (undo +tree)
       vc

       :term
       eshell
       ;;shel
       ;;term
       vterm

       :checkers
       syntax
       (spell +aspell +everywhere)
       grammar

       :tools
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       (debugger +lsp)
       direnv
       (docker +lsp)
       editorconfig
       ;;ein
       (eval +overlay)
       gist
       (lookup +dictionary +docsets +offline)
       (lsp +peek)
       (magit +forge)
       make
       ;;pass
       pdf
       ;;prodigy
       rgb
       taskrunner
       terraform
       tmux
       tree-sitter
       upload

       :os
       (:if IS-MAC macos)
       tty               ; improve the terminal Emacs experience

       :lang
       ;;agda
       ;;beancount         ; mind the GAAP
       ;;(cc +lsp)         ; C > C++ == 1
       ;;clojure
       ;;common-lisp
       ;;coq
       ;;crystal
       ;;csharp
       data
       ;;(dart +flutter)
       ;;dhall
       (elixir +lsp +tree-sitter)
       ;;elm
       emacs-lisp
       ;;erlang
       ;;ess
       ;;factor
       ;;faust
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp
       ;;fstar
       ;;gdscript
       (go +lsp +tree-sitter)
       (graphql +lsp)    ; Give queries a REST
       ;;(haskell +dante)
       ;;hy
       ;;idris
       (json +lsp +tree-sitter)
       ;;(java +lsp +tree-sitter)
       (javascript +tree-sitter +lsp)
       (julia +lsp +tree-sitter)
       ;;kotlin
       (latex +latexmk
              +lsp
              +fold)
       ;;lean
       ;;ledger            ; be audit you can be
       ;;lua
       (markdown +grip)
       ;;nim
       ;;nix
       ;;ocaml
       (org +dragndrop
            +gnuplot
            +hugo
            +noter
            +pandoc
            +pomodoro
            +present
            +roam2)
       ;;php
       ;;plantuml
       ;;purescript
       (python +tree-sitter
               +pyright
               +poetry
               +lsp)
       ;;qt
       ;;racket
       ;;raku
       (rest +jq)
       ;;rst
       ;;(ruby +rails +lsp +tree-sitter)
       ;;(rust +lsp +tree-sitter)
       ;;scala
       (scheme +guile)   ; a fully conniving family of lisps
       (sh +lsp +tree-sitter)
       ;;sml
       ;;solidity
       ;;swift
       ;;terra
       (web +lsp +tree-sitter)
       (yaml +lsp)
       ;;zig               ; C, but simpler


       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       literate
       (default +bindings +smartparens))
