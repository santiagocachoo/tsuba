# Contributing to Tsuba

Thanks for your interest! Tsuba is in early development, so expect things to move around.

## Workflow

- `main` always builds and passes its tests.
- Work happens on short-lived branches: `feat/…`, `fix/…`, `docs/…`, `spike/…`.
- One focused change per pull request. PRs are squash-merged.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/), e.g. `feat(kit): add DT1 checksum`.
- Planning lives in GitHub Issues and Milestones.

## Code conventions

- Swift 6 language mode with strict concurrency.
- `TsubaKit` (the core) imports **Foundation only**: no AppKit, UIKit, SwiftUI or MIDIKit. MIDI goes through the `MIDITransport` protocol, and the real implementation lives in a separate module.
- UI state uses `@Observable`.
- Tests use Swift Testing.
- Format with `swift format` using the committed configuration.
- `ParameterMap.generated.swift` is generated, so never edit it by hand. Change the spec file and run the generator. CI checks that the generated file is up to date.

## Write safety

Every write to the amp goes through `WriteGuard`. It only allows the temporary buffer, one target channel, and a short list of validated commands. Widening what Tsuba is allowed to write requires a reviewed code change and an architecture decision record in `docs/adr/`. It is never a user setting.

## Licensing

- **Code** is MIT licensed (see [LICENSE](LICENSE)). By contributing, you agree your contributions are released under the same license.
- **Data derived from [katana-dev](https://github.com/katana-dev)** (CC-BY-SA-4.0) lives in its own folder under CC-BY-SA-4.0, with attribution. Don't mix it into MIT-licensed files.
- **Never copy code from FxFloorBoard** or other GPL-licensed editors. They may be used to cross-check behavior, but not as a source of code.
- Don't inspect or copy assets from BOSS software (Tone Studio, Katana Tone Control).

## Test fixtures

- `TsubaKit/Tests/Fixtures/` only holds patches and amp dumps you created yourself and are happy to publish.
- Third-party patches (e.g. from BOSS Tone Exchange) go in `LocalFixtures/`, which is gitignored and never committed.

## Working with the amp

- Close BOSS Tone Studio / Katana Tone Control while developing; two editors confuse the amp's replies.
- Before any experiment that writes, make a full read-only backup of all channels.
