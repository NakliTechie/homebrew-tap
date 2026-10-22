# Homebrew formula for Continuum.
# Installs the prebuilt release archive from GitHub — no Go toolchain needed.
# Homebrew fetches with curl, so the binary is never quarantined on macOS.
class Continuum < Formula
  desc "One daemon per machine that owns your terminals and coding agents; the runtime under Menagerie"
  homepage "https://github.com/NakliTechie/continuum"
  version "0.1.0-alpha.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.3/continuum_0.1.0-alpha.3_darwin_arm64.tar.gz"
      sha256 "1e74f1fb1a4d3f9153c8125de0c91923cf06e30153856502550c8c5d3bb6c75c"
    end
    on_intel do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.3/continuum_0.1.0-alpha.3_darwin_amd64.tar.gz"
      sha256 "960695e7433870bb446f8ddc87e5af83d56b48809052ddf259df457a78864d53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.3/continuum_0.1.0-alpha.3_linux_arm64.tar.gz"
      sha256 "059c13fba3f6ebe3b18814274617b9760087a71b87d87d2158045d58a2f98ee6"
    end
    on_intel do
      url "https://github.com/NakliTechie/continuum/releases/download/v0.1.0-alpha.3/continuum_0.1.0-alpha.3_linux_amd64.tar.gz"
      sha256 "22a9c1e093f58d084acd1641484b17376ec32dc195366c8c4682f91a445062e8"
    end
  end

  def install
    # The archive also carries a byte-identical `menagerie-relay` copy; it is not
    # installed here because the menagerie-relay formula owns that name.
    # `continuum legacy serve` is the same entry point.
    bin.install "continuum"
  end

  test do
    assert_match "continuum 0.1.0-alpha.3", shell_output("#{bin}/continuum version")
  end
end
