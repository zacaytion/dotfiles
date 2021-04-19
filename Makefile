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

MODULES := emacs, macOS, shell, git, vim, tmux	

include env

STOWFLAGS := --dotfiles --no-folding -v 2

.PHONY: brew
brew: | $(BREW) ## Update to latest Homebrew version
	brew update

$(BREW): ## Install Homebrew package manager
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


$(BREWFILE):  ## Generate Brewfile for machine
	@cat $^ >| $@	

.PHONY: brew_bundle
brew_bundle: $(BREWFILE) brew ## $(BREW) bundle --file $(BREWFILE)
	@echo "Begining bundle..."

.PHONY: doom-install
doom-install: 
	git clone https://github.com/hlissner/doom-emacs ${EMACSDIR}
	${EMACSDIR}/bin/doom -dy install 

.PHONY: doom-sync
doom-sync: doom-install doom-stow
	${EMACSDIR}/bin/doom -yd sync 

.PHONY: doom-stow
doom-stow: 
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -S emacs

.PHONY: doom-restow
doom-restow: 
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -R emacs

.PHONY: doom-delete
doom-delete: 
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -D emacs

.PHONY: zsh-stow
zsh-stow:
	@ln -Fisv ${DOTDIR}/zsh/dot-zshenv ${HOME}/.zshenv
	@mkdir -p ${XDG_CONFIG_HOME}/zsh.d
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -S zsh

.PHONY: zsh-restow
zsh-restow:
	@ln -Fisv ${DOTDIR}/zsh/dot-zshenv ${HOME}/.zshenv
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -R zsh

.PHONY: zsh-delete
zsh-delete:
	@rm -f ${HOME}/.zshenv
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -D zsh

.PHONY: config-stow
config-stow:
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -S config

.PHONY: config-restow
config-restow:
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -R config

.PHONY: config-delete
config-delete:
	@stow $(STOWFLAGS) -t ${XDG_CONFIG_HOME} -D config

.PHONY: home-stow
home-stow:
	@stow $(STOWFLAGS) -S home

.PHONY: home-restow
home-restow:
	@stow $(STOWFLAGS) -R home

.PHONY: config-delete
config-delete:
	@stow $(STOWFLAGS) -D home


.PHONY: help
help: # thx Jess https://github.com/jessfraz/dotfiles
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
