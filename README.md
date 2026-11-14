# Confetti Spawner

Fire confetti or color emoji bursts across your desktop with a hotkey. Runs from the tray, click-through, never steals focus.

Also available as a Windhawk mod: [`windhawk/confetti-spawner.wh.cpp`](windhawk/confetti-spawner.wh.cpp).

## Demo

![Confetti Demo](./demo.gif)

## Features

- **Particle modes:** confetti, emoji, mixed (confetti + emoji), or your own PNG images (`config/particles`).
- **Color emoji:** any emoji you type in the settings, including multi-part ones, rendered in full color.
- **Confetti shapes:** rect, square, circle, triangle, star, heart, with optional 3D tumbling.
- **Hold to fire:** confetti keeps coming while you hold the hotkey and stops when you let go.
- **Live cursor origin:** with origin `cursor`, confetti spawns at the mouse as you move it, across monitors.
- **Full control:** count, duration, speed, gravity, spread, density, wobble, size, spin, drag, lifetime, fade, opacity, fps, colors.
- **Origins:** sides, top, bottom, cursor, random.
- **Presets** in the tray menu: Classic (the default, the original look), Fireworks, Gold Rain.
- **Settings window** with live preview, a Test burst button and a Reset button on every slider.
- **Custom hotkeys.**
- **Multi-monitor and virtual desktops:** the burst plays on the screen under your mouse, on the current desktop.

## Hotkeys (defaults, change them in settings)

| Keys | Action |
|---|---|
| `Ctrl + Shift + C` | Fire a burst |
| `Ctrl + Shift + S` | Open settings |
| `Ctrl + Shift + E` | Cycle origin |
| `Ctrl + Shift + M` | Cycle mode (confetti, emoji, mixed, images) |

## How to use

1. Download the latest release from the [Releases](https://github.com/JudeCJz/confetti-spawner/releases) page.
2. Run `Confetti.exe`.
3. Press `Ctrl + Shift + C`. Right-click the tray icon for settings and presets.

All settings live in `config/confetti-settings.ini` next to the exe. Edits there are picked up automatically.

## Performance

- Zero CPU while idle: the overlay window only exists while a burst is playing.
- Per-pixel alpha layered window; only the changed region is redrawn and pushed each frame.
- Emoji are rasterised once with Direct2D, pre-rotated, and blitted with GDI AlphaBlend.
- Roughly 2 ms per frame for a 300-particle mixed burst, about 13 ms at 2000 particles (1080p).

## Development

- Language: C# 5, single file `Confetti.cs`, .NET Framework 4 (built into Windows).
- Build:

```
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe /t:winexe /out:Confetti.exe /win32icon:confetti.ico /optimize+ /r:System.dll,System.Windows.Forms.dll,System.Drawing.dll,System.Core.dll Confetti.cs
```

- Self test (no windows shown): `Confetti.exe --selftest <folder>` writes sample frames, emoji sprites and timings.

## Author
JudeCJz
