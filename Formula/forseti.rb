# Homebrew tap formula — the SINGLE SOURCE OF TRUTH (#470).
#
# This file, versioned with the product, is what the stable-release workflow
# (#370, .github/workflows/stable-release.yml) renders and pushes to the tap
# (Cybersimplified-LLC/homebrew-tap `Formula/forseti.rb`) on every release. The
# release step rewrites ONLY the three release-pinned fields below — the url,
# version, and sha256 placeholder lines — from the freshly built binary;
# everything else (desc, depends_on, install, caveats, test) is authored here and
# ships verbatim. Do NOT hand-edit the tap's copy: it is overwritten from this
# template each release, so any drift there is lost.
#
# Named `Forseti`/`forseti.rb`, not `fst`, to avoid the homebrew-core `fst`
# formula (BurntSushi's transducer tool). The command this installs is `fst`
# (see `bin.install` below); only the formula/tap name differs.
class Forseti < Formula
  desc "Governed, network-isolated sandbox CLI for AI coding agents"
  homepage "https://github.com/Cybersimplified-LLC/homebrew-tap"
  # Proprietary: this tap ships packaging metadata only, not product source.
  # The release workflow rewrites these three lines; the placeholders make an
  # un-rendered template fail the release's own guards rather than ship silently.
  url "https://github.com/Cybersimplified-LLC/homebrew-tap/releases/download/stable-v0.274.0/forseti-stable-v0.274.0-aarch64-apple-darwin.tar.gz"
  version "0.274.0"
  sha256 "c1704db1ad432fb191f29d9ae7013c93e262cfeb4a10d96000b4d4d0ed5a2d50"
  license :cannot_represent

  # The release binary is aarch64-apple-darwin, Developer ID signed + notarized.
  depends_on arch: :arm64
  depends_on :macos
  # Community images are pulled from public GHCR and cosign-verified on first run
  # (ADR 0052); the verify step execs `cosign`, so it must be present or the first
  # `fst up`/`fst run` fails closed until the adopter installs it by hand (#470).
  depends_on "cosign"

  def install
    bin.install "fst"
  end

  def caveats
    <<~EOS
      fst runs coding agents inside a sandbox backed by Apple's container runtime.
      Run `fst doctor` to check prerequisites (including starting the container
      daemon with `container system start`).

      This Homebrew install is managed by `brew`; the built-in `fst update`
      self-updater is disabled on the community build and points back at
      `brew upgrade forseti`.
    EOS
  end

  test do
    assert_match "fst #{version}", shell_output("#{bin}/fst --version")
  end
end
