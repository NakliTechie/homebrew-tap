# Homebrew formula for the Menagerie relay.
# Installs the prebuilt binary from the GitHub release — no Go toolchain needed.
# Because Homebrew downloads via curl, the binary is never quarantined, so it
# runs on macOS without any Gatekeeper / `xattr` step.
class MenagerieRelay < Formula
  desc "Relay for Menagerie, the browser-native console for fleets of coding agents"
  homepage "https://github.com/NakliTechie/menagerie"
  version "0.2.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.2.0/menagerie-relay-darwin-arm64"
      sha256 "55e0e5c1374d364d511bd2bc053afaad70b0402868681d0a60ac3bfe424a4e9b"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.2.0/menagerie-relay-darwin-amd64"
      sha256 "94191c4ce2682fc025afed7ee3b317dc985ad9ef56c20073ebf7f460364b3fe8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.2.0/menagerie-relay-linux-arm64"
      sha256 "aafce51b418e705991fe2a83df51dfd7ce963b68391b777bd19c428f652ee496"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.2.0/menagerie-relay-linux-amd64"
      sha256 "21dc33c11a84113ad81c03dc4809981f27bc432fc316eaa6dec2980b1620e142"
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
