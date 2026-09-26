# Homebrew formula for disktree-cli, NakliTechie's fork of tobi/disktree.
# Installs the prebuilt release archive from GitHub — no Rust toolchain needed.
# Homebrew fetches with curl, so the binary is never quarantined on macOS.
class DisktreeCli < Formula
  desc "Disktree without a window: scan to JSON, check and trash paths safely"
  homepage "https://github.com/NakliTechie/disktree"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/disktree/releases/download/cli-v0.10.1/disktree-cli_0.10.1_darwin_arm64.tar.gz"
      sha256 "183d211c5716b5b8cdd49d6c8e144f9b97f654ecb191690e3602a1aa76aad7ac"
    end
    on_intel do
      url "https://github.com/NakliTechie/disktree/releases/download/cli-v0.10.1/disktree-cli_0.10.1_darwin_amd64.tar.gz"
      sha256 "baf17afb80565ca9f985b307a176af77b487965d1cf65c1fa71b07801208d3fb"
    end
  end

  def install
    bin.install "disktree-cli"
  end

  test do
    assert_match "disktree without a window", shell_output("#{bin}/disktree-cli --help")
    (testpath/"proj/junk").mkpath
    output = shell_output("#{bin}/disktree-cli check --root #{testpath}/proj #{testpath}/proj")
    assert_match "the scanned root cannot be removed", output
  end
end
