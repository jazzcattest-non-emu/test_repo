# Simple Makefile for test repository

.PHONY: test help clean

help: ## Show this help message
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ { printf "  %-10s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

test: ## Run all tests
	@echo "Running test suite..."
	@./test_runner.sh

clean: ## Clean temporary files
	@echo "Cleaning up..."
	@rm -f *.log *.tmp

# Default target
all: test