;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! org-modern)
(package! mermaid-mode)
(package! ob-mermaid
  :recipe (:host github
           :repo "arnm/ob-mermaid"))
(package! astro-ts-mode)

(package! treesit-auto)

(package! difftastic)
