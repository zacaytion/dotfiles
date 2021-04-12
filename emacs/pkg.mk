export EMACSDIR=$XDG_CONFIG_HOME/emacs.d
export DOOMDIR=$XDG_CONFIG_HOME/doom.d
export DOOMLOCALDIR=$XDG_DATA_HOME/emacs.d

DOOM := $(EMACSDIR)/bin/doom

.PHONY: emacs
emacs: doom

.PHONY: doom-install
doom-install:
	git clone https://github.com/hlissner/doom-emacs $(EMACSDIR)
	$(DOOM) install

.PHONY: doom-sync
doom-sync:
	$(DOOM) sync

.PHONY: doom-env
doom-sync:
	$(DOOM) env

.PHONY: doom-upgrade
doom-sync:
	$(DOOM) upgrade
