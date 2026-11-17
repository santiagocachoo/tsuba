# Architecture Decision Records

Short records of the big decisions that shape Tsuba: what we decided, why, and what it costs us.
Only decisions that are expensive to reverse get an ADR. Smaller choices live in PR descriptions.

| # | Title | Status |
| --- | --- | --- |
| [0001](0001-write-safety.md) | Write safety: every write goes through WriteGuard | Accepted |
| [0002](0002-amp-is-source-of-truth.md) | The amp is the source of truth; the app keeps a mirror | Accepted |
| [0003](0003-license-split.md) | MIT code, CC-BY-SA-4.0 data in its own folder | Accepted |
| [0004](0004-midi-transport-abstraction.md) | MIDI behind a `MIDITransport` protocol | Accepted |

## Format

Each ADR has: **Status**, **Context**, **Decision**, **Consequences**.
To change a decision, add a new ADR that supersedes the old one and update the old one's status.
Don't rewrite history.
