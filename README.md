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

​```sh
brew install cybersimplified-llc/tap/fst
​```

That taps this repository and installs the latest release. To tap explicitly
first:

​```sh
brew tap cybersimplified-llc/tap
brew install fst
​```

## Upgrade

​```sh
brew upgrade fst
​```

`fst` installed from Homebrew is **managed by Homebrew** — the built-in
`fst update` self-updater is disabled on this build and will point you back at
`brew upgrade`.

## Uninstall

​```sh
brew uninstall fst
brew untap cybersimplified-llc/tap
​```

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

​```sh
# Checksum — compare against the release's SHA256SUMS
shasum -a 256 "$(brew --cache --formula fst)"

# Code signature — should show the Developer ID Application authority
codesign --verify --verbose "$(brew --prefix)/bin/fst"
codesign -dv --verbose=4 "$(brew --prefix)/bin/fst" 2>&1 | grep Authority
​```

## Support

Issues with `fst` itself are tracked privately by Cybersimplified, LLC. This tap
repository is for packaging only.
