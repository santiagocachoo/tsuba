# Roadmap

Tsuba is built in small milestones. Each one leaves `main` working. Dates aren't promised; quality comes first.
Progress is tracked in [GitHub Milestones](https://github.com/santiagocachoo/tsuba/milestones).

## M0: Foundations

Public repo, README/LICENSE/CONTRIBUTING, TsubaKit package skeleton with a first test, the Xcode app project
with an empty window, CI on every PR, ADRs for the big decisions, this roadmap.

## M1: USB spike

A read-only `tsuba-probe` CLI that lists MIDI endpoints, reads the amp's identity (model + firmware) and a patch name.
A full read-only backup of all 9 channels comes first, then the first command write (editor mode).
Raw replies are committed as test fixtures. `docs/spike-results.md` answers:

- Is editor mode needed?
- Does the amp report its own knob changes?
- How does save-to-channel work?
- What's the maximum read size, and how are replies chunked?
- How much pacing do messages need?

## M2: Protocol core

SysEx codec (RQ1/DT1), checksum, 7-bit address math, `MIDITransport`, `AmpSession` with a hex traffic log,
`WriteGuard` ([ADR 0001](adr/0001-write-safety.md)), and a slim `SimulatedAmp` with fault injection.
The same code reads the real amp and the simulator, and the simulator matches real fixtures byte for byte.

## M2.5: One-knob slice

An app window with a connection picker (real amp / demo) and one Gain knob that works live in both directions.

## M3: Parameter map + patch model

A human-readable parameter spec with UI metadata and a per-parameter `verified` status, a code generator,
and a probe "diff" mode. A typed `Patch` model including G/R/Y variations. Every test `.tsl` file survives
decode → encode.

## M4: Editor MVP

Sidebar, pedalboard view, data-driven block editors, live editing with amp-side sync, Edited badge,
undo/redo, Save to channel B4 with backup and read-back, `.tsl` import/export. Demo mode with example tones.
Done when a real tone built only with Tsuba survives a power cycle and saving is proven. Only then is the
write allowlist widened, by a reviewed PR and ADR.

## M5: Library

Keep and organize tones on the Mac. Storage format is decided by ADR at the start.

## M6: Design identity + polish

Design system, custom knob (drag, scroll, double-click to type), app icon, light/dark mode, VoiceOver,
error states, Compare A/B.

## Later

In order: signal-chain reorder → setlists → global settings and whole-amp backup/restore → MCP server →
iPad/iPhone via BLE-MIDI.

## Maybe

Preview sound: a dry guitar clip through rough AVAudioEngine effects in demo mode. Only if the core is solid.
