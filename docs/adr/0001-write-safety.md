# 0001: Write safety: every write goes through WriteGuard

- **Status:** Accepted
- **Date:** 2026-11-14

## Context

Tsuba talks to the Katana MkII with Roland SysEx: RQ1 messages read memory and DT1 messages write it.
A DT1 to the wrong address can overwrite a saved channel, change global/system settings, or leave the
amp in a state that's hard to recover without BOSS software. The address map is only partly documented
(community data from katana-dev is MkI-era) and we're learning it as we go.

A bug in the UI, the patch model or the parameter map should never be able to damage the user's amp.

## Decision

Every outgoing write, both data (DT1) and commands, passes through a single `WriteGuard` in TsubaKit.
Nothing else in the codebase can send a write to the transport.

`WriteGuard` enforces three rules:

1. **Address allowlist for data writes.** Only the temporary (edit) buffer and channel B4 are allowed.
   Everything else is refused, including system/global settings and the other eight channels.
2. **Named, validated command writes.** A short list of commands (e.g. editor mode, write-to-channel)
   is allowed, and each payload is validated (write-to-channel must target B4). The exact addresses
   are confirmed in the M1 USB spike.
3. **Identity gate.** No writes at all unless the connected device identifies as a known Katana MkII
   model and firmware.

Refusals are unit-tested, region by region.

Around the guard:

- Before the very first write experiment, make a full read-only backup of all channels.
- Before every channel save, back up that channel (last 20 per channel, in a `.tsl`-compatible form so
  another editor can restore it).
- After every save, read the channel back and byte-compare.

Widening the allowlist (e.g. allowing saves to every channel) is a **reviewed code change with a new ADR**,
never a user setting. It happens only after "saving proven": 20 consecutive verified B4 saves across varied
amp/FX types, a `.tsl` export→import→save→read-back round trip that's byte-identical, and B4 surviving an
amp power cycle.

## Consequences

- Users can only save to B4 at first. That's a real limitation, and it's deliberate.
- Backups can't be restored to other channels by Tsuba itself until the allowlist widens, which is why
  they're `.tsl`-compatible.
- One choke point makes the traffic log, tests and code review simple: there's exactly one place to look.
- The simulator applies the same guard, so tests exercise the real safety path.
