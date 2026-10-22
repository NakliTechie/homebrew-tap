# Homebrew formula for disktree-cli, NakliTechie's fork of tobi/disktree.
# Installs the prebuilt release archive from GitHub — no Rust toolchain needed.
# Homebrew fetches with curl, so the binary is never quarantined on macOS.
class DisktreeCli < Formula
  desc "Disktree without a window: scan to JSON, check and trash paths safely"
  homepage "https://github.com/NakliTechie/disktree"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/disktree/releases/download/cli-v0.10.2/disktree-cli_0.10.2_darwin_arm64.tar.gz"
      sha256 "8c8b81f2c5c2352c75693e96d881ae88999f7027963cf4503f70f2fb8a3bdbec"
    end
    on_intel do
      url "https://github.com/NakliTechie/disktree/releases/download/cli-v0.10.2/disktree-cli_0.10.2_darwin_amd64.tar.gz"
      sha256 "3f71d27564c23a305759d69855bcfc50ec8253cf11a2dec38930cd65fbbc5c8e"
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
