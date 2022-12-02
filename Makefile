DOTDIR := ${HOME}/dotfiles
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
# MAKEFLAGS += --no-builtin-rules
BREW := /usr/local/bin/brew
BREWFILE := ./Brewfile
OS_NAME := $(shell uname -s | tr A-Z a-z)

include env

STOWFLAGS := --dotfiles --no-folding -v 2

$(BREW): ## Install Homebrew package manager
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: brew
brew: | $(BREW) ## Update to latest Homebrew version
	brew update

$(BREWFILE):  ## Generate Brewfile for machine
	@cat $^ >| $@	

.PHONY: brew_bundle
brew_bundle: $(BREWFILE) brew ## $(BREW) bundle --file $(BREWFILE)
	@echo "Begining bundle..."

.PHONY: install-doom
install-doom:
	git clone https://github.com/hlissner/doom-emacs ${EMACSDIR}
	${EMACSDIR}/bin/doom -dy install 

.PHONY: stow-config
stow-config:
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -S config

.PHONY: restow-config
restow-config:
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -R config

.PHONY: delete-config
delete-config:
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -D config

.PHONY: stow-home
stow-home:
	@stow $(STOWFLAGS) -S home

.PHONY: home-restow
restow-home:
	@stow $(STOWFLAGS) -R home

.PHONY: home-delete
delete-home:
	@stow $(STOWFLAGS) -D home

.PHONY: help
help: # thx Jess https://github.com/jessfraz/dotfiles
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
