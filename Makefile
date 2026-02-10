SHELL := /bin/bash

DATA_DIR := data
DATA_ARCHIVE := $(DATA_DIR)/zenodo_record.zip
DATA_EXTRACT_DIR := $(DATA_DIR)/record

ZENODO_URL ?= https://zenodo.org/records/18519059/files/sepsis_datasets.zip?download=1

.PHONY: data clean-data


data: | $(DATA_DIR)/.dir

$(DATA_DIR):
	@mkdir -p $(DATA_DIR)

# Download and unzip the Zenodo record archive.
# Usage: make data
# Or:    make data ZENODO_URL="https://zenodo.org/records/XXXX?download=1"
data: $(DATA_DIR)
	@if [[ -z "$(ZENODO_URL)" ]]; then \
		echo "ZENODO_URL is required. Example:"; \
		echo "  make data ZENODO_URL=\"https://zenodo.org/records/XXXX?download=1\""; \
		exit 1; \
	fi
	@echo "Downloading from Zenodo..."
	@curl -L --fail --retry 3 --retry-delay 2 -o "$(DATA_ARCHIVE)" "$(ZENODO_URL)"
	@file "$(DATA_ARCHIVE)" | grep -qi zip || (echo "ERROR: Downloaded file is not a ZIP. Check ZENODO_URL."; exit 2)
	@echo "Saved: $(DATA_ARCHIVE)"
	@echo "Extracting..."
	@mkdir -p "$(DATA_EXTRACT_DIR)"
	@unzip -o "$(DATA_ARCHIVE)" -d "$(DATA_EXTRACT_DIR)" >/dev/null
	@echo "Extracted to: $(DATA_EXTRACT_DIR)"


$(DATA_DIR)/.dir:
	@mkdir -p "$(DATA_DIR)"
	@touch "$(DATA_DIR)/.dir"
=======


clean-data:
	@rm -rf "$(DATA_DIR)"

