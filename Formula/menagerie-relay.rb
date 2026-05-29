# Homebrew formula for the Menagerie relay.
# Installs the prebuilt binary from the GitHub release — no Go toolchain needed.
# Because Homebrew downloads via curl, the binary is never quarantined, so it
# runs on macOS without any Gatekeeper / `xattr` step.
class MenagerieRelay < Formula
  desc "Relay for Menagerie, the browser-native console for fleets of coding agents"
  homepage "https://github.com/NakliTechie/menagerie"
  version "0.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.1.0/menagerie-relay-darwin-arm64"
      sha256 "7decb2b7f3e4c07112e0c7ed5c9a0b117ea8780e42e4870a982f76e78356b799"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.1.0/menagerie-relay-darwin-amd64"
      sha256 "339c6131d3265b949b0a8d61876be4674edce4a9cf453231db5bb8663c1ec158"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.1.0/menagerie-relay-linux-arm64"
      sha256 "8d16f51ee4b38841c76d2cf09247c5d95a701495822f7accdae0350d8cf98d0e"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.1.0/menagerie-relay-linux-amd64"
      sha256 "cc4d0389449fb158a404790f83e18cc93d71b06f2d70cc3e110bd9bad9b18602"
    end
  end

  def install
    # The release asset is named per-platform; install it as `menagerie-relay`.
    bin.install Dir["menagerie-relay-*"].first => "menagerie-relay"
  end

  test do
    assert_match "menagerie-relay", shell_output("#{bin}/menagerie-relay --help 2>&1")
  end
end
