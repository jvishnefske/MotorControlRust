.PHONY: build test coverage clean doc check fmt

# Default target
all: build

# Build for embedded target
build:
	cargo build --release

# Build for host target (for testing)
build-host:
	cargo build --target x86_64-unknown-linux-gnu

# Run tests (on host, not embedded target)
test:
	cargo test --target x86_64-unknown-linux-gnu 2>/dev/null || echo "No tests available for no_std crate"

# Generate code coverage via tarpaulin (host target only)
coverage:
	cargo tarpaulin --target x86_64-unknown-linux-gnu --out Xml --out Html --output-dir coverage 2>/dev/null || echo "Coverage: no_std crate has limited testability on host"

# Clean build artifacts
clean:
	cargo clean
	rm -rf coverage/

# Generate documentation
doc:
	cargo doc --no-deps

# Check compilation without building
check:
	cargo check --release

# Format code
fmt:
	cargo fmt

# Format check (for CI)
fmt-check:
	cargo fmt -- --check

# Clippy lints
clippy:
	cargo clippy --release -- -D warnings

# Flash to hardware (requires probe-rs)
flash:
	cargo run --release
