SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c  

MAKEFLAGS += --warn-undefined-variables
BREW := /usr/local/bin/brew
BREWFILE := ./Brewfile
OS_NAME := $(shell uname -s | tr A-Z a-z)

MODULES := emacs, macOS, shell, git, vim, tmux	

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# look for include files in each of the modules
# CFLAGS += $(patsubst %,-I%,$(MODULES))
# # extra libraries if required
# LIBS :=
# ###each module will add to this
# SRC :=
# # include the description for each module
# include $(patsubst %,%/module.mk,$(MODULES))
# #determine the object files
# OBJ := $(patsubst %.c,%.o, filter %.c,$(SRC))) \
# 	patsubst %.y,%.o, filter %.y,$(SRC)))
# ######link the program
# prog: $(OBJ)$(CC) -o $@ $(OBJ) $(LIBS)
# #######include the C include
# ########dependencies
# include $(OBJ:.o=.d)
# ########calculate C include	dependencies
# %.d: %.c
# 	depend.sh 'dirname $*.c' \
# 	$(CFLAGS) $*.c > $@


.PHONEY: brew
brew: | $(BREW) ## Update to latest Homebrew version
	brew update

$(BREW): ## Install Homebrew package manager
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


$(BREWFILE):  ## Generate Brewfile for machine
	@cat $^ >| $@	

.PHONY: brew_bundle
brew_bundle: $(BREWFILE) brew ## $(BREW) bundle --file $(BREWFILE)
	@echo "Begining bundle..."


.PHONY: help
help: # thx Jess https://github.com/jessfraz/dotfiles
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


