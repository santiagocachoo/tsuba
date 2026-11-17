# Devlog

Notes on building Tsuba, newest last.

## 2026-11-12: Kickoff

Planned the whole project before writing code: architecture, milestones, and the write-safety rules
(see [ADR 0001](adr/0001-write-safety.md)). The core idea: the amp is the source of truth, and Tsuba
only ever writes where it's provably safe.

## 2026-11-17: Foundations

Public repo, MIT license, TsubaKit package with its first Swift Testing test, the Xcode app project
linked to TsubaKit, and CI: Linux for the core package, a macOS 27 preview runner for the app.
`main` is protected, so everything lands through a PR. Wrote the first four ADRs and the roadmap.
