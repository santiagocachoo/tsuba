# 0004: MIDI behind a `MIDITransport` protocol

- **Status:** Accepted
- **Date:** 2026-11-12

## Context

TsubaKit holds all the protocol logic (codec, `AmpSession`, `WriteGuard`, patch model) and should be
testable on Linux CI without any MIDI stack. We also want the option to swap MIDI libraries later
(e.g. to raw CoreMIDI) and to reach iPad/iPhone via BLE-MIDI without rewriting the core.

## Decision

- TsubaKit defines a small `MIDITransport` protocol (send bytes, receive a stream of bytes, endpoint info).
- TsubaKit imports **Foundation only**: no MIDIKit, CoreMIDI, AppKit, UIKit or SwiftUI.
- The real transport, `MIDIKitTransport`, lives in a separate `TsubaMIDI` target and uses only
  **MIDIKitIO** from [MIDIKit](https://github.com/orchetect/MIDIKit).
- `SimulatedAmp` (in `TsubaSimulator`) also conforms, so demo mode and tests use the same session code.

## Consequences

- TsubaKit tests run on Linux in CI and need no hardware.
- Swapping MIDIKit for CoreMIDI touches one target.
- A thin protocol means we may need to grow it later (e.g. endpoint change notifications); that's
  a cheap change in one place.
