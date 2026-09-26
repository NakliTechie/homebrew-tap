# NakliTechie Homebrew tap

Homebrew formulae and casks for [NakliTechie](https://github.com/NakliTechie) tools.

## summon

[Summon](https://github.com/NakliTechie/summon) — a sovereign, native macOS launcher (no account, no server, no telemetry) with on-device AI.

```sh
brew install --cask naklitechie/tap/summon
```

The 0.6.x build is ad-hoc signed (not yet Apple-notarized); the cask clears the download quarantine so it launches normally. Requires macOS Sonoma (14)+; on-device AI needs Apple Intelligence hardware (macOS 26+).

## ferrule

[Ferrule](https://github.com/NakliTechie/ferrule) — every LLM key held once, encrypted, on your machine, with one OpenAI-compatible endpoint on top that your whole house can use. No account, no server, no telemetry.

```sh
brew install --cask naklitechie/tap/ferrule   # Ferrule.app (Apple Silicon): starts the daemon, opens the panel
brew install naklitechie/tap/ferrule          # the `ferrule` command (macOS arm64/Intel, Linux)
```

The app is not notarised; the cask clears the download quarantine and says so. The formula is the prebuilt binary, fetched with curl so it is never quarantined. Both are rendered from the release's `SHA256SUMS` by `make brew` in the ferrule repo.

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

## Publishing from an app's release workflow

An app renders its own `Formula/<name>.rb` / `Casks/<name>.rb`, uploads them as an artifact,
and calls `.github/workflows/publish.yml` here, which lints them with `brew style` and
commits. Each app has its own write deploy key on this repo, stored in that app's secrets as
`HOMEBREW_TAP_DEPLOY_KEY`. To add an app:

```sh
ssh-keygen -t ed25519 -N "" -C "<app>-release → homebrew-tap" -f <app>-tap-key
gh repo deploy-key add <app>-tap-key.pub --repo NakliTechie/homebrew-tap --allow-write --title "<app> release"
gh secret set HOMEBREW_TAP_DEPLOY_KEY --repo NakliTechie/<app> < <app>-tap-key
rm <app>-tap-key <app>-tap-key.pub
```

Then in the app's release workflow, after the release exists:

```yaml
  publish-tap:
    needs: release
    uses: NakliTechie/homebrew-tap/.github/workflows/publish.yml@main
    with:
      artifact: homebrew
      message: "<app> ${{ github.ref_name }}"
    secrets:
      deploy_key: ${{ secrets.HOMEBREW_TAP_DEPLOY_KEY }}
```

[ferrule](https://github.com/NakliTechie/ferrule/blob/main/.github/workflows/release.yml) is the reference caller; its `make brew` renders from the release's `SHA256SUMS`.

## disktree-cli

[disktree-cli](https://github.com/NakliTechie/disktree) — [tobi/disktree](https://github.com/tobi/disktree)'s scanner, classifier and removal guards without a window, for scripts and coding agents. Every command prints JSON; `trash` is the only way it removes anything. The fork adds model-weight and stale-archive findings and a `--store` for a model store.

```sh
brew install naklitechie/tap/disktree-cli
```

Prebuilt for macOS arm64 and Intel, ad-hoc signed. Linux: `cargo install --git https://github.com/NakliTechie/disktree disktree-cli`.
