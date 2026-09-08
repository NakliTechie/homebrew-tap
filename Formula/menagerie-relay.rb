# Homebrew formula for the Menagerie relay.
# Installs the prebuilt binary from the GitHub release — no Go toolchain needed.
# Because Homebrew downloads via curl, the binary is never quarantined, so it
# runs on macOS without any Gatekeeper / `xattr` step.
class MenagerieRelay < Formula
  desc "Relay for Menagerie, the browser-native console for fleets of coding agents"
  homepage "https://github.com/NakliTechie/menagerie"
  version "0.6.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.0/menagerie-relay-darwin-arm64"
      sha256 "75cf8d368a12dfaaf4703a4f5b4afbf8ec9a611f721ef944c862d6d4d4486819"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.0/menagerie-relay-darwin-amd64"
      sha256 "82772a21dae600c998ca6acd1a60f6d5a18dc35ffb781a4326cd1beb1a857330"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.0/menagerie-relay-linux-arm64"
      sha256 "5b97001abcae7c839174c4d6b6c5664e25f99b9839ed9eb0b746ce604f8b94b4"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.0/menagerie-relay-linux-amd64"
      sha256 "8ad0cd957969b25f4a3302d343f28a81bd113360ba4a48f1724e1b8851cf2d87"
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
