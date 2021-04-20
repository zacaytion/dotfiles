;;; init.el --- Summary -*- lexical-binding: t; -*-
;;; Commentary: This file controls what Doom modules are enabled and what order they load
;;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll fin d
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

;;; Code:
(doom! :input
       ;;chinese
       ;;japanese
       ;;layout

       :completion
       (company +childframe)
       ;;helm
       ;;ido
       (ivy +fuzzy
            +icons
            +prescient)

       :ui
       ;; deft
       doom
       doom-dashboard
       doom-quit
       (emoji +unicode)
       ;;fill-column
       hl-todo
       ;;hydra
       ;;indent-guides
       ;;ligatures
       ;;minimap
       (modeline +light) 
       nav-flash
       ;;neotree
       ophints
       (popup +defaults)
       ;;tabs
       ;;treemacs
       unicode
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces
       zen

       :editor
       (evil +everywhere)               ; come to the dark side, we have cookies
       file-templates                   ; auto-snippets for empty files
       fold                             ; (nigh) universal code folding
       (format +onsave)                 ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       ;; lispy                       ; vim for lisp, for people who don't like vim
       multiple-cursors            ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;;rotate-text       ; cycle region at point between text candidates
       snippets
       word-wrap

       :emacs
       (dired +ranger +icons)
       electric
       ibuffer
       undo
       vc

       :term
       eshell
       ;;shel
       ;;term
       vterm

       :checkers
       syntax
       (spell +enchant +everywhere)
       ;; grammar

       :tools
       ;; ansible
       (debugger +lsp)
       direnv
       docker
       editorconfig
       ;;ein
       (eval +overlay)
       ;; gist
       lookup
       lsp
       (magit +forge)
       make
       ;;pass
       pdf
       ;;prodigy
       rgb                ; creating color strings
       taskrunner
       terraform          ; infrastructure as code
       ;;tmux
       upload

       :os
       (:if IS-MAC macos)               ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       ;;agda              ; types of types of types of types...
       ;;cc                ; C/C++/Obj-C madness
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data                     ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp                       ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       ;;(go +lsp)         ; the hipster dialect
       ;;(haskell +dante)  ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       (json +lsp)          ; At least it ain't XML
       ;; (java +lsp)          ; the poster child for carpal tunnel syndrome
       (javascript +lsp)    ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean
       ;;factor
       ;;ledger            ; an accounting system in Emacs
       ;;lua               ; one-based indices? one-based indices
       (markdown +grip)  ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;; nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org +hugo                       ; organize your plain life in plain text
            +pandoc
            +pomodoro
            +dragndrop
            +roam)
       ;;php
       plantuml
       ;;purescript
       (python +lsp )
       ;;qt
       ;;racket
       ;;raku
       rest
       ;;rst
       ;;(ruby +rails)
       ;;rust
       ;;scala
       ;; scheme            ; a fully conniving family of lisps
       (sh +lsp)
       ;;sml
       ;;solidity
       ;;swift
       ;;terra
       web
       (yaml +lsp)

       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       calendar
       everywhere
       ;;irc
       ;; (rss +org)
       ;;twitter

       :config
       ;;literate
       (default +bindings +smartparens))
