#!/usr/bin/env bash

### WIP ###

source_url="https://github.com/zacaytion/dotfiles.git"
one_password_url="https://app-updates.agilebits.com/download/OPM7"
# https://stackoverflow.com/a/53183593
# cwd="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
os_type="$(uname)"

abort() {
	printf "%s\n" "$@"
	exit 1
}

if [ -z "${BASH_VERSION:-}" ]; then
	abort "Bash is required to interpret this script."
fi
# Wrap the script in a function to protect against connecting dying mid-download
# see http://blog.existentialize.com/dont-pipe-to-your-shell.html
bootstrap() {
	set -euo pipefail

	# string formatters
	if [[ -t 1 ]]; then
		tty_escape() { printf "\033[%sm" "$1"; }
	else
		tty_escape() { :; }
	fi
	tty_mkbold() { tty_escape "1;$1"; }
	tty_blue="$(tty_mkbold 34)"
	tty_red="$(tty_mkbold 31)"
	tty_bold="$(tty_mkbold 39)"
	tty_reset="$(tty_escape 0)"

	shell_join() {
		local arg
		printf "%s" "$1"
		shift
		for arg in "$@"; do
			printf " "
			printf "%s" "${arg// /\ }"
		done
	}

	chomp() {
		printf "%s" "${1/"$'\n'"/}"
	}

	puts() {
		printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
	}

	warn() {
		printf "${tty_red}Warning${tty_reset}: %s\n" "$(chomp "$1")"
	}

	install_osx_cli_tools() {
		local osx_vers
		osx_vers=$(sw_vers -productVersion | awk -F "." '{print $2}')

		puts "Checking OSX Version"
		## FIXME
		if [ "$osx_vers" -lt 9 ]; then
			abort "Error: OSX ${osx_vers} not supported."
		fi
		#
		# github.com/timsutton/osx-vm-templates/blob/dc2d3b29a12cfecb40d5ca6b839bd4c9c48f70bc/scripts/xcode-cli-tools.sh
		# Only run if the tools are not installed yet
		if ! [ "$(xcode-select -p)" ]; then
			puts "Installing CLI Tools..."
			# create the placeholder file that's checked by CLI updates' .dist code
			# in Apple's SUS catalog
			touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
			# find the CLI Tools update
			cli_tools_vers=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
			# install it
			softwareupdate -i "$cli_tools_vers" --verbose
			rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
		fi

	}

	# not going to trust homebrew with 1pw
	install_one_password() {
		puts "Please download and setup one password"
		open $one_password_url
		read -p "Is one password installed (y/N)" -n 1 answer
		echo
		if [ "${answer}" != "y" ]; then
			exit 1
		fi
	}

	macos() {
		puts "Initializing for macOS"
		install_osx_cli_tools
		install_one_password
	}

	init() {
		puts "Beginning Bootstrap..."
		## TODO: handle linux
		if [[ "$os_type" != "Darwin" ]]; then
			abort "Only macOS supported currently."
		fi

		macos
	}

	clone() {
		puts "Cloning repository: ${source_url}"
		git clone $source_url /usr/local/dotfiles
	}

	build() {
		puts "Starting Make build"
		make -C /usr/local/dotfiles bootstrap
	}

	# Execute steps in order
	init
	clone
	build
}

# run script now that the whole file is downloaded
bootstrap
