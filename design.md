# Motor Control Rust - Design Document

## MVP Functional Requirements

### Hardware Abstraction
- [ ] FR-001: Initialize STM32F407ZE peripherals via Embassy
- [ ] FR-002: Configure GPIO pins PE0 and PE1 as outputs for LED control
- [ ] FR-003: Support configurable GPIO output speed settings

### LED Control
- [ ] FR-010: Toggle LED1 (PE0) between high and low states
- [ ] FR-011: Toggle LED2 (PE1) between high and low states
- [ ] FR-012: Alternate LED states with 300ms timing interval

### Async Runtime
- [ ] FR-020: Execute main loop as async Embassy task
- [ ] FR-021: Use async timer for non-blocking delays
- [ ] FR-022: Support task spawning via Embassy executor

### Diagnostics
- [ ] FR-030: Output diagnostic messages via defmt RTT
- [ ] FR-031: Log state transitions (high/low) to RTT console
- [ ] FR-032: Display startup "Hello World" message

### Build System
- [x] FR-040: Cross-compile for thumbv7em-none-eabi target
- [x] FR-041: Support probe-rs runner for flash and debug
- [x] FR-042: Configure linker scripts via build.rs

## Architectural Constraints

1. **No Standard Library**: `#![no_std]` environment for embedded target
2. **No Main**: `#![no_main]` with Embassy runtime entry point
3. **Immutable-by-default**: State transitions via new instances where possible
4. **Result-based Error Handling**: All fallible operations return `Result<T, E>`
5. **No Unsafe**: Avoid `unsafe` blocks; rely on Embassy abstractions
6. **Linear Ownership**: Tree-like ownership without `Arc`/`Mutex` complexity

## Traceability Matrix

| Requirement | Source File | Test |
|-------------|-------------|------|
| FR-001 | src/main.rs:12 | Hardware integration |
| FR-002 | src/main.rs:15-16 | Hardware integration |
| FR-010 | src/main.rs:20,25 | Hardware integration |
| FR-011 | src/main.rs:21,27 | Hardware integration |
| FR-012 | src/main.rs:22,28 | Hardware integration |
| FR-020 | src/main.rs:11 | Compilation |
| FR-021 | src/main.rs:22,28 | Compilation |
| FR-030 | src/main.rs:4,13,19,24 | RTT output |
| FR-040 | .cargo/config.toml:6 | Build success |
| FR-041 | .cargo/config.toml:3 | Flash success |
| FR-042 | build.rs:1-5 | Build success |
