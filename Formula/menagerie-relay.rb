# Homebrew formula for the Menagerie relay.
# Installs the prebuilt binary from the GitHub release — no Go toolchain needed.
# Because Homebrew downloads via curl, the binary is never quarantined, so it
# runs on macOS without any Gatekeeper / `xattr` step.
class MenagerieRelay < Formula
  desc "Relay for Menagerie, the browser-native console for fleets of coding agents"
  homepage "https://github.com/NakliTechie/menagerie"
  version "0.4.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.4.0/menagerie-relay-darwin-arm64"
      sha256 "f4a57f60ed5517eed437a6cbe86f4820617c903baa34e97bd4ce1441dd41d075"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.4.0/menagerie-relay-darwin-amd64"
      sha256 "63c09f767c5eafce3e9105f8c2c97ea67ba122d4a2f45021b2dc49710c17cb17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.4.0/menagerie-relay-linux-arm64"
      sha256 "1a4779edba23e58e5e1430bf3c03fe4ad05e3b7887eec82ec0494c55ff59bee6"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.4.0/menagerie-relay-linux-amd64"
      sha256 "109d8e04f5633d12f36dbc72d007b39d5e3bea232e464757cecc864961290a2d"
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
