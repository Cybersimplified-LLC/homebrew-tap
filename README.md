# Homebrew tap for `fst`

Install and upgrade the **`fst`** CLI on macOS via Homebrew.

`fst` runs coding agents inside a governed, network-isolated sandbox on macOS —
so an agent's file, process, and network access is mediated and attributable
rather than run loose on your machine.

> **Packaging only — not the product source.** This repository contains the
> Homebrew formula and install docs for `fst`. It holds **no product source**;
> `fst` is proprietary software. Installing from this tap downloads a signed,
> notarized release binary published by Cybersimplified, LLC.

## Install

```sh
brew tap cybersimplified-llc/tap
brew trust cybersimplified-llc/tap
brew install forseti
```

The Homebrew formula is named **`forseti`**; the command it installs is **`fst`**.
The short name `fst` is already taken in homebrew-core by an unrelated tool
(BurntSushi's finite-state-transducer utility), so this tap uses `forseti` to keep
`brew install forseti` unambiguous — do **not** run `brew install fst`, which
resolves to that unrelated core formula.

The `brew trust` step is **required once**. Homebrew treats third-party taps as
untrusted by default (since Homebrew 6.0.0) and refuses to load their formulae
until you trust them (a third-party formula is unsandboxed Ruby that runs on your
machine). You only do it once per machine; official Homebrew taps are trusted
already. Without it, `brew install` fails with `Refusing to load formula … from
untrusted tap`.

After trusting, `brew install cybersimplified-llc/tap/forseti` works directly too.

## Upgrade

```sh
brew upgrade forseti
```

`fst` installed from Homebrew is **managed by Homebrew** — the built-in
`fst update` self-updater is disabled on this build and will point you back at
`brew upgrade`.

## Uninstall

```sh
brew uninstall forseti
brew untap cybersimplified-llc/tap
```

## Requirements

- **macOS on Apple Silicon** (arm64). The release binary is
  `aarch64-apple-darwin`.
- Apple's container runtime is a prerequisite for running sandboxes. After
  installing, run `fst doctor` — it checks your machine and tells you what (if
  anything) is missing, including how to start the container daemon.

## What you get

The formula pins each release to a specific download URL and SHA-256 checksum.
The binary is **Developer ID signed and notarized by Apple**, and every release
publishes a `SHA256SUMS` file alongside the artifacts.

## Verifying a download (optional)

Homebrew already verifies the SHA-256 the formula pins on every install. To check
by hand:

```sh
# Checksum — compare against the release's SHA256SUMS
shasum -a 256 "$(brew --cache --formula forseti)"

# Code signature — should show the Developer ID Application authority
codesign --verify --verbose "$(brew --prefix)/bin/fst"
codesign -dv --verbose=4 "$(brew --prefix)/bin/fst" 2>&1 | grep Authority
```

## Support

Issues with `fst` itself are tracked privately by Cybersimplified, LLC. This tap
repository is for packaging only.
