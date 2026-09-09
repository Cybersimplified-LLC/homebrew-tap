class Fst < Formula
  desc "Governed, network-isolated sandbox CLI for AI coding agents"
  homepage "https://github.com/Cybersimplified-LLC/homebrew-tap"
  # Proprietary: this tap ships packaging metadata only, not product source.
  url "https://github.com/Cybersimplified-LLC/homebrew-tap/releases/download/stable-v0.182.0/forseti-stable-v0.182.0-aarch64-apple-darwin.tar.gz"
  version "0.182.0"
  sha256 "50e15a66339587f947d69f5a662f03c9db9db57690b5c4d125708ecf47c1ba40"
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
      `brew upgrade fst`.
    EOS
  end

  test do
    assert_match "fst #{version}", shell_output("#{bin}/fst --version")
  end
end
