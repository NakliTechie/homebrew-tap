# Homebrew formula for Continuum.
# Installs the prebuilt release archive from GitHub — no Go toolchain needed.
# Homebrew fetches with curl, so the binary is never quarantined on macOS.
class Continuum < Formula
  desc "One daemon per machine that owns your terminals and coding agents; the runtime under Menagerie"
  homepage "https://github.com/NakliTechie/continuum"
  version "0.1.0-alpha.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.2/continuum_0.1.0-alpha.2_darwin_arm64.tar.gz"
      sha256 "6bfe9316d702c28e540bda8250c29bdedbda3779a199c212cbfd3f2168953331"
    end
    on_intel do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.2/continuum_0.1.0-alpha.2_darwin_amd64.tar.gz"
      sha256 "c8e504a8c8cfcc9f9b3c199897e6bd2e75180fc56d2e1125d8acf42469e06159"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.2/continuum_0.1.0-alpha.2_linux_arm64.tar.gz"
      sha256 "3a793b08bf36dc3398b042eeda047bd0b9e0a8ddfafa52248e5f45a2ba992080"
    end
    on_intel do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.2/continuum_0.1.0-alpha.2_linux_amd64.tar.gz"
      sha256 "dfb76d2ff1d9a8edf5d836c68e4d7ac40f9d5e283fb5382330f727691b3b9e7b"
    end
  end

  def install
    # The archive also carries a byte-identical `menagerie-relay` copy; it is not
    # installed here because the menagerie-relay formula owns that name.
    # `continuum legacy serve` is the same entry point.
    bin.install "continuum"
  end

  test do
    assert_match "continuum 0.1.0-alpha.2", shell_output("#{bin}/continuum version")
  end
end
