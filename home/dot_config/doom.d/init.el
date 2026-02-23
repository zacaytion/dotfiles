;;; init.el -*- lexical-binding: t; -*-

(doom! :input

       :completion
       (corfu +icons +orderless)
       (vertico +icons)

       :ui
       doom              
       doom-dashboard   
       doom-quit       
       (emoji +unicode +github)  
       hl-todo           
       indent-guides     
       ligatures         
       modeline          
       nav-flash         
       ophints           
       (popup +all +defaults)
       ;;smooth-scroll
       (treemacs +lsp)         
       ;;unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) 
       vi-tilde-fringe   
       (window-select +numbers)
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)
       file-templates    
       fold              
       (format +onsave +lsp)  
       multiple-cursors  
       rotate-text       
       snippets         
       (whitespace +guess +trim)
       word-wrap       

       :emacs
       (dired +dirvish +icons)
       electric       
       (ibuffer +icons)
       (undo +tree)
       vc         

       :term
       eshell            
       vterm            

       :checkers
       (syntax +icons)
       (spell +aspell +everywhere)
       grammar           

       :tools
       ;;ansible
       ;;biblio
       ;;collab
       (debugger +lsp)
       ;;direnv
       (docker +lsp)
       editorconfig      
       (eval +overlay)
       (lookup +dictionary +docsets +offline)
       (lsp +peek)
       (magit )
       make
       ;;pdf
       ;;(terraform +lsp)
       tmux              
       tree-sitter       
       ;;upload

       :os
       (:if (featurep :system 'macos) macos)
       tty

       :lang
       ;;(astro +lsp)
       ;;(cc +lsp +tree-sitter)
       ;;(clojure +lsp +tree-sitter)
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
       ;;fortran
       ;;fsharp
       ;;fstar
       ;;gdscript
       (go +lsp +tree-sitter)
       ;;(graphql +lsp)
       ;;graphviz
       ;;(haskell +lsp +tree-sitter)
       ;;hy
       ;;(idris +lsp)
       ;;(java +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (json +lsp +tree-sitter)
       ;;(julia +lsp +tree-sitter)
       ;;(kotlin +lsp)
       (latex +cdlatex +fold +lsp)
       ;;lean
       ;;ledger
       ;;(lua +lsp +tree-sitter)
       (markdown +grip)
       ;;nim
       ;;(nix +lsp +tree-sitter)
       ;;(ocaml +lsp +tree-sitter)
       (org +pandoc +pretty)
       ;;(php +lsp +tree-sitter)
       ;;plantuml
       ;;purescript
       (python +lsp +tree-sitter +uv)
       ;;qt
       ;;(racket +lsp)
       ;;raku
       (rest +jq)
       rst
       ;;(ruby +rails +lsp +tree-sitter)
       ;;(rust +lsp +tree-sitter)
       ;;(scala +lsp +tree-sitter)
       ;;(scheme +guile)
       (sh +fish +lsp +tree-sitter)
       ;;sml
       ;;solidity
       ;;(swift +lsp +tree-sitter)
       ;;terra
       (web +lsp +tree-sitter)
       (yaml +lsp +tree-sitter)
       ;;(zig +lsp +tree-sitter)

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere
       ;;irc
       ;;(rss +org)

       :config
       literate
       (default +bindings +smartparens))
