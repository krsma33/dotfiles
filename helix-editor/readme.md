# Helix #

Helix text editor personal configuration

## Windows ##

Copy **config.toml** and **languages.toml** to %appdata%\helix

## Transparent Themes

To make a theme transparent, and hence use default terminal (previously set to transparent) background,
navigate to **%userprofile%/scoop/apps/helix/current/runtime/themes** subfolder and open desired theme (e.g *tokyonight.toml*).

Replace:

    'ui.background' = { fg = 'foreground', bg = 'background' }

With:

    'ui.background' = { fg = 'foreground' }

