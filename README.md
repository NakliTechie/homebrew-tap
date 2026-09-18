# NakliTechie Homebrew tap

Homebrew formulae and casks for [NakliTechie](https://github.com/NakliTechie) tools.

## summon

[Summon](https://github.com/NakliTechie/summon) — a sovereign, native macOS launcher (no account, no server, no telemetry) with on-device AI.

```sh
brew install --cask naklitechie/tap/summon
```

The 0.6.x build is ad-hoc signed (not yet Apple-notarized); the cask clears the download quarantine so it launches normally. Requires macOS Sonoma (14)+; on-device AI needs Apple Intelligence hardware (macOS 26+).

## menagerie-relay

The relay for [Menagerie](https://github.com/NakliTechie/menagerie) — the browser-native console for fleets of coding agents.

```sh
brew install naklitechie/tap/menagerie-relay
menagerie-relay init     # prints your registration token
menagerie-relay serve    # leave this running
```

Homebrew downloads the prebuilt binary (no Go toolchain), and because it fetches via curl the binary is never quarantined — it runs on macOS with no Gatekeeper prompt.

## continuum

[Continuum](https://github.com/NakliTechie/continuum) — one daemon per machine that owns your terminals and coding agents so work outlives the client that started it; the runtime under Menagerie. Public alpha.

```sh
brew install naklitechie/tap/continuum
continuum serve                                   # foreground, prints the Menagerie endpoint
continuum service install --listen 127.0.0.1:7878 # always-on (launchd / systemd --user)
```

Prebuilt archive, no Go toolchain, fetched with curl so macOS never quarantines it. `continuum legacy serve` is the `menagerie-relay` entry point inside the same binary; the separate `menagerie-relay` formula still installs the standalone relay.
