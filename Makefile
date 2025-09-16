GITHUB_USER := lyraphase
REPO_NAME := homebrew-right2repair
REPO := $(GITHUB_USER)/$(REPO_NAME)
FILTER_OUT_FORMULAS := ansible-builder
CASK_NAMES := $(patsubst %.rb,%,$(patsubst Casks/%,%,$(wildcard Casks/*.rb)))
FORMULA_NAMES := $(filter-out $(FILTER_OUT_FORMULAS),$(patsubst %.rb,%,$(patsubst Formula/%,%,$(wildcard Formula/*.rb))))
PKG_ID :=
HOMEBREW_LIBRARY_TAPS := $(shell brew --repo)/Library/Taps
TAP_DIR := $(HOMEBREW_LIBRARY_TAPS)/$(GITHUB_USER)

DEFAULT_GOAL: help ## no-help

.PHONY: help install test

help: ## Shows this generated help info for Makefile targets
	@grep -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | awk '{ c=split($$0,resultArr,/:+/) ; if ( !(resultArr[c-1] in targets) ) { if ( /:.*##/ ) { if ( ! /no-help/ ) { sub(/^.*## ?/," ",resultArr[c]); targets[resultArr[c-1]] = resultArr[c]; } } else { targets[resultArr[c-1]] = "" } } } END { for (target in targets) { printf "\033[36m%-30s\033[0m %s\n", target, targets[target] } }' | sort

$(TAP_DIR): ## no-help
	mkdir -p $(TAP_DIR)

$(TAP_DIR)/$(REPO_NAME):
	ln -s $(PWD) $(TAP_DIR)/$(REPO_NAME)

install: $(TAP_DIR) $(TAP_DIR)/$(REPO_NAME) ## Install Tap via git checkout symlink (development mode)
	brew tap --repair
	brew tap

test: #install ## Run tests
	brew audit --cask $(CASK_NAMES)
	brew install --cask --verbose $(CASK_NAMES)
	brew install --verbose $(addprefix $(GITHUB_USER)/$(REPO_NAME)/,$(FORMULA_NAMES))
#	pkgutil --pkgs=$(PKG_ID)

test-clean: ## Teardown / Cleanup after test
	brew uninstall --cask --force --zap --verbose $(CASK_NAMES)
	brew uninstall --force --zap --verbose $(addprefix $(GITHUB_USER)/$(REPO_NAME)/,$(FORMULA_NAMES))

clean:: ## Remove temporary/build files.
	rm -rf $(TAP_DIR)/$(REPO_NAME)
