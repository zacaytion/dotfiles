BREW := /usr/local/bin/brew

.PHONEY: brew
brew: | $(BREW) ## Update to latest Homebrew version
	brew update

$(BREW): ## Install Homebrew package manager
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
