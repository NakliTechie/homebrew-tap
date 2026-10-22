class Verdict < Formula
  desc "Sovereign typed decisions on your Mac — on-device Apple Foundation Models, Jev-compatible"
  homepage "https://github.com/NakliTechie/verdict"
  url "https://github.com/NakliTechie/verdict/releases/download/v0.1.1/verdict-0.1.1-arm64-apple-darwin.tar.gz"
  version "0.1.1"
  sha256 "ba51b30e1b0d08182510b6f0c8fe6e00036827abac8b9c8ef8394e34bf87cd68"
  license "MIT"

  # verdict runs the on-device Apple Foundation Model: Apple Silicon + macOS 26 (Tahoe) only.
  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "verdict"
    bin.install "verdictd"
  end

  def caveats
    <<~EOS
      verdict needs Apple Intelligence enabled (System Settings → Apple Intelligence & Siri).
      Check readiness:   verdict status
      Run the server:    verdictd install   # per-user launchd agent, no sudo
    EOS
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/verdict --version")
  end
end
