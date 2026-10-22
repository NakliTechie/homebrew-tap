# Homebrew formula for the Menagerie relay.
# Installs the prebuilt binary from the GitHub release — no Go toolchain needed.
# Because Homebrew downloads via curl, the binary is never quarantined, so it
# runs on macOS without any Gatekeeper / `xattr` step.
class MenagerieRelay < Formula
  desc "Relay for Menagerie, the browser-native console for fleets of coding agents"
  homepage "https://github.com/NakliTechie/menagerie"
  version "0.6.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.1/menagerie-relay-darwin-arm64"
      sha256 "fce22a65dcf7a1909df8a6f29f16b43b83efcc13adcd52ea49abf861c0b2fb5d"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.1/menagerie-relay-darwin-amd64"
      sha256 "0fba54f97cbaec287c1077be9924718ef7b40baf59776c8b8e8664a741bb832c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.1/menagerie-relay-linux-arm64"
      sha256 "4c7f15a750f710a0b4947aa12b0da507979e1ceb1486db90acaafddae4358392"
    end
    on_intel do
      url "https://github.com/NakliTechie/menagerie/releases/download/relay-v0.6.1/menagerie-relay-linux-amd64"
      sha256 "9bcea624dd3d4491a68c42c5c5afe95f17e17857dc8f8c7212a21edd3655386d"
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
