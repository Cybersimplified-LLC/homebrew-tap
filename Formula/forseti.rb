# Named `Forseti`/`forseti.rb`, not `fst`, to avoid the homebrew-core `fst`
# formula (BurntSushi's transducer tool). The command this installs is `fst`
# (see `bin.install` below); only the formula/tap name differs.
class Forseti < Formula
  desc "Governed, network-isolated sandbox CLI for AI coding agents"
  homepage "https://github.com/Cybersimplified-LLC/homebrew-tap"
  # Proprietary: this tap ships packaging metadata only, not product source.
  url "https://github.com/Cybersimplified-LLC/homebrew-tap/releases/download/stable-v0.186.0/forseti-stable-v0.186.0-aarch64-apple-darwin.tar.gz"
  version "0.186.0"
  sha256 "8c09c679b1fe09cb9b70d17090437f49443c1b9cd6e75cd8b12d6ccded7040be"
  license :cannot_represent

  # The release binary is aarch64-apple-darwin, Developer ID signed + notarized.
  depends_on arch: :arm64
  depends_on :macos

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
