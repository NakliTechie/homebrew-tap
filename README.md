# NakliTechie Homebrew tap

Homebrew formulae for [NakliTechie](https://github.com/NakliTechie) tools.

## menagerie-relay

The relay for [Menagerie](https://github.com/NakliTechie/menagerie) — the browser-native console for fleets of coding agents.

```sh
brew install naklitechie/tap/menagerie-relay
menagerie-relay init     # prints your registration token
menagerie-relay serve    # leave this running
```

Homebrew downloads the prebuilt binary (no Go toolchain), and because it fetches via curl the binary is never quarantined — it runs on macOS with no Gatekeeper prompt.
