DOCKER_NAME := droid
CARGO_INCREMENTAL ?= 1
RUSTC_BOOTSTRAP ?= 0
BUILD_IMAGE_NAME ?= ghcr.io/trashcat-robotics/devtools/esp32-cmake
BUILD_IMAGE_TAG ?= latest

docker_run = docker run \
	--name=$(DOCKER_NAME)-$@ \
	--rm \
	-v "$(PWD):/usr/local/app" \
	-w /usr/local/app \
	$(2) \
	$(BUILD_IMAGE_NAME):$(BUILD_IMAGE_TAG) \
	$(1)

# Style templates for console output.
GREEN  := $(shell echo -e `tput setaf 2`)
YELLOW := $(shell echo -e `tput setaf 3`)
CYAN   := $(shell echo -e `tput setaf 6`)
NC     := $(shell echo -e `tput setaf 9`)
BOLD   := $(shell echo -e `tput bold`)
SMUL   := $(shell echo -e `tput smul`)
SGR0   := $(shell echo -e `tput sgr0`)

idf_run = $(call docker_run,idf.py $(1),$(2))

.PHONY: clean fullclean build flash

interactive:
	@$(call docker_run,,--interactive)

hooks:
	pre-commit install

build: hooks
	@$(call idf_run,build)

clean:
	@$(call idf_run,clean)

fullclean:
	@$(call idf_run,fullclean)

flash:
	@$(call idf_run,flash -p $(port),--device=$(port))

# Tests
editorconfig-test:
	@echo "$(YELLOW)Checking if the codebase is compliant with the .editorconfig file...$(NC)"
	@docker run \
		--name=$(DOCKER_NAME)-$@ \
		--rm \
		--user `id -u`:`id -g` \
		-w "/usr/src/app" \
		-v "$(PWD):/usr/src/app" \
		-t mstruebing/editorconfig-checker

style-test: editorconfig-test
