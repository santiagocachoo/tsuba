# 0002: The amp is the source of truth; the app keeps a mirror

- **Status:** Accepted
- **Date:** 2026-11-12

## Context

The amp's state can change without Tsuba: front-panel knobs, a GA-FC foot controller, a channel
switch, or a power cycle. If the app treated its own model as authoritative, the UI and the actual
sound would drift apart, and saving could write values the user never heard.

## Decision

The amp is the source of truth. TsubaKit's `AmpSession` actor keeps a **mirror** of the amp's memory.

- On connect, read all 9 channels plus the current tone into the mirror.
- Edits are sent to the amp's temporary buffer; the mirror is updated from what the amp accepts.
- Amp-side changes (knobs, foot controller) update the mirror and the UI. Whether this needs an
  "editor mode" command is answered in the M1 spike.
- Knob drags are coalesced (about 30 messages/s, latest value wins) so we don't flood the amp.
- Edits stay in the temporary buffer with an "Edited" badge until the user chooses "Save to channel".
  Tsuba asks before discarding unsaved edits and offers to keep them in the library.
- Undo/redo is app-side, implemented as new writes to the temporary buffer.

The same code path drives the real amp and the `SimulatedAmp` used for demo mode and tests.

## Consequences

- The mirror needs request/reply matching, timeouts and retries, which lives in `AmpSession`.
- Reading 9 channels on connect costs a little startup time; it's worth it for a correct sidebar.
- The simulator has to behave like the amp (answer RQ1 with DT1, emit amp-side changes), checked
  against recorded real-amp traffic.
