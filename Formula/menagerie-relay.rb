# Homebrew formula for the Menagerie relay.
# Installs the prebuilt binary from the GitHub release — no Go toolchain needed.
# Because Homebrew downloads via curl, the binary is never quarantined, so it
# runs on macOS without any Gatekeeper / `xattr` step.
class MenagerieRelay < Formula
  desc "Relay for Menagerie, the browser-native console for fleets of coding agents"
  homepage "https://github.com/NakliTechie/menagerie"
  version "0.3.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.3.0/menagerie-relay-darwin-arm64"
      sha256 "715178c0260a827fed3fc53d6305ebf0aee2f0a5db4b9b33a437bf0ad45478a3"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.3.0/menagerie-relay-darwin-amd64"
      sha256 "d9d84908a9df71882cf113a9d124aad2a39b110c3420292e87b168d70f1a60eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.3.0/menagerie-relay-linux-arm64"
      sha256 "42e433bcbbd3bbdb8db8d2a551faf96f799e59c71f0f05062fd060701a6438ba"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.3.0/menagerie-relay-linux-amd64"
      sha256 "71c679cc1f817a9d79c4e79da486df9e621d4cd8c53351adb8203bbe81a6d9c7"
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
