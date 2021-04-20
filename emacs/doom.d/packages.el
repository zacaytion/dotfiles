;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

(package! magit-delta
  :recipe (:host github :repo "dandavison/magit-delta"))

(package! info-colors)

(package! vlf
  :recipe (:host github :repo "m00natic/vlfi" :files ("*.el")))

(package! doct
  :recipe (:host github :repo "progfolio/doct"))

(package! org-ref)
(package! org-roam-bibtex)
;; (package! beacon
;;   :recipe (:host github :repo "Malabarba/beacon" :files ("*.el")))
