# Tsuba

An open-source, native Swift editor and librarian for the **BOSS Katana MkII** amplifier. macOS first.

> **Status:** early development. Nothing usable yet. See [docs/ROADMAP.md](docs/ROADMAP.md).

## Goals

- Edit tones live over USB: amp, booster, mod, FX, delay, reverb, EQ and more, including G/R/Y variations.
- Keep a library of tones and import/export `.tsl` files.
- Write safely. Tsuba only writes to the amp's temporary buffer and one chosen channel. It backs up before every save and reads the data back afterwards to check it.
- Offer a demo mode with a simulated amp, so you can try the app without hardware.

## Requirements

- macOS 27 or later
- A BOSS Katana MkII connected over USB, with the BOSS USB MIDI driver installed (not needed for demo mode)
- Close BOSS Tone Studio and other editors while using Tsuba, because two editors fight over the amp's replies.

## Building

You need Xcode 27 or later.

```sh
git clone https://github.com/santiagocachoo/tsuba.git
cd tsuba
swift test --package-path TsubaKit   # run the core tests
open Tsuba/Tsuba.xcodeproj           # build and run the app
```

## Project layout

| Path | What it is |
| --- | --- |
| `Tsuba/` | The SwiftUI app (kept small; logic lives in TsubaKit) |
| `TsubaKit/` | Swift package: protocol, amp session, parameter map, patch model, simulator |
| `Tools/` | Developer tools (parameter map code generator) |
| `docs/` | Roadmap, protocol notes, architecture decisions, devlog |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Code is released under the [MIT License](LICENSE). Some data files are derived from CC-BY-SA-4.0 sources. Those files live in their own folder with their own license and attribution; see [CONTRIBUTING.md](CONTRIBUTING.md#licensing).

## Disclaimer

Tsuba is an independent project. It is not affiliated with, endorsed by, or supported by Roland Corporation or BOSS. "BOSS", "Katana" and "Tone Studio" are trademarks of Roland Corporation. Using third-party software to write to your amp is at your own risk.
