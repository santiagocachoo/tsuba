# 0003: MIT code, CC-BY-SA-4.0 data in its own folder

- **Status:** Accepted
- **Date:** 2026-11-12

## Context

Tsuba wants a permissive license so the code is easy to reuse. But some of the best community knowledge
about the Katana comes with conditions:

- [katana-dev](https://github.com/katana-dev) publishes parameter maps under **CC-BY-SA-4.0**
  (share-alike, attribution required).
- **FxFloorBoard** is **GPL-2.0**. Copying its code would make Tsuba a derivative work under the GPL.
- BOSS software (Tone Studio, Katana Tone Control) is proprietary.

## Decision

- **Code is MIT.**
- **Data derived from katana-dev stays CC-BY-SA-4.0**, in its own folder with its own license file
  and attribution. Generated Swift that embeds such data is treated the same way and noted in the folder.
- **No FxFloorBoard code is ever copied.** It may be used to cross-check behavior only.
- **No BOSS internals or assets.** We don't inspect Katana Tone Control's bundle or copy BOSS assets.
  Tone Studio may be used through its normal UI (names, ranges, exporting `.tsl` files).
- Our own parameter knowledge comes from our own `.tsl` files, Tone Studio's UI, and the read-only
  `tsuba-probe` tool diffing amp memory.

These rules are stated in `CONTRIBUTING.md`.

## Consequences

- Contributors need to know where data came from. The parameter spec records each entry's source.
- Some parameters take longer to map because we verify them ourselves instead of copying.
- Anyone can reuse Tsuba's code under MIT; the CC-BY-SA data keeps its share-alike terms.
