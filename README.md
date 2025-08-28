# Test Repository

This is a simple test repository with basic test functionality.

## Files

- `test`, `test2`, `test3` - Test files containing the word "test"
- `test_runner.sh` - Shell script that runs basic tests
- `Makefile` - Build automation for running tests
- `.github/workflows/` - GitHub Actions workflows for CI/CD

## Running Tests

### Using Make (recommended)
```bash
make test        # Run all tests
make help        # Show available commands
make clean       # Clean temporary files
```

### Direct execution
```bash
./test_runner.sh
```

## Test Suite

The test suite validates:

1. ✅ Test files exist (`test`, `test2`, `test3`)
2. ✅ Test files contain expected content ("test")
3. ✅ All test files have consistent content
4. ✅ GitHub workflows exist and are properly configured
5. ✅ CI workflow contains valid configuration

## GitHub Actions

- **Test Suite** (`test-suite.yaml`) - Runs the test suite on push/PR
- **CI** (`test.yaml`) - Monitors file changes and runs various checks
- **Secrets Scan** (`secrets-scan.yaml`) - Scans for exposed secrets using Trivy

All tests should pass with ✅ status.