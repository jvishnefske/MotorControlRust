# Motor Control Rust

Embedded Rust motor control firmware for STM32F407ZE using the Embassy async framework. Provides real-time motor control with async task scheduling, GPIO management, and diagnostic output via RTT.

## Quick Start

```bash
# Build firmware
make build

# Run tests
make test

# Flash to hardware (requires probe-rs)
cargo run --release
```

## Requirements

- Rust toolchain with `thumbv7em-none-eabi` target
- probe-rs for flashing/debugging
- STM32F407ZE target board

## Features

- Async task execution via Embassy
- GPIO-based LED control (PE0, PE1)
- RTT-based defmt logging
- Cortex-M optimized runtime
