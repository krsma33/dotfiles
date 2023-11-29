# Configurations

<!--toc:start-->

- [Configurations](#configurations)
  - [Scoop](#scoop)
  - [Oh my posh](#oh-my-posh)
  - [PowerShell](#powershell)
  - [Rancher Desktop](#rancher-desktop)
  - [Windows Terminal](#windows-terminal)
  - [Helix](#helix)
    - [Rust](#rust)
    - [C#](#c)
    - [JSON](#json)
    - [YAML](#yaml)
    - [Markdown](#markdown)
  - [Lazygit](#lazygit)
  - [Wezterm](#wezterm)
  - [NeoVim](#neovim)
  - [Microsoft PowerToys](#microsoft-powertoys)
  - [Visual Studio 2022](#visual-studio-2022)
  <!--toc:end-->

## Scoop

Scoop is a package manager (like Chocolatey)

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUse # Optional: Needed to run a remote script the first time
    irm get.scoop.sh | iex

## Oh my posh

Oh my posh is used to customize prompt in your terminal

    scoop bucket add main
    scoop install main/oh-my-posh

Download and install the nerd font. [Caskaydia Cove Nerd Font Complete](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip) looks nice.

Init powershell profile

    New-Item -Path $PROFILE -Type File -Force

Modify newly created file by appending **oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/multiverse-neon.omp.json" | Invoke-Expression**

    notepad $PROFILE

## PowerShell

PowerShell is the .NET Core version of PowerShell (compared to WindowsPowerShell which runs on .NET Framework)

    scoop install main/pwsh

## Rancher Desktop

Rancher desktop is used to locally work with k8s and docker. It's good open source replacement for Docker Desktop.

    scoop install extras/rancher-desktop

## Windows Terminal

Windows Terminal is terminal created by Microsoft.

    scoop bucket add extras
    scoop install extras/windows-terminal

Windows Terminal configuration can be found in **windows-terminal** subfolder.

## Helix

Helix is a text editor which can be used as IDE with minimal setup.

    scoop install helix

Helix configuration can be found in **helix-editor** subfolder.

### Rust

Configure Helix language server and debugger for Rust

    scoop install main/rust-analyzer
    scoop install main/llvm

NOTE: This assumes Rust tooling and C++ tooling is previously installed

### C#

Configure Helix language server and debugger forC#

    scoop bucket add versions
    scoop install versions/omnisharp-net6
    scoop install main/netcoredbg
    scoop shim add netcoredbg ~\scoop\apps\netcoredbg\current\netcoredbg.exe

NOTE: This assumes .NET Core SDK and tooling is previously installed

### JSON

Language server covers JSON and HTML

    npm i -g vscode-langserers-extracted

### YAML

Language server for YAML

    npm i -g yaml-language-server@next

### Markdown

Language server for markdown

    scoop install main/marksman

## Lazygit

Lazy git is command line git tool

    scoop install extras/lazygit

## Wezterm

Terminal written in Rust

    scoop install extras/wezterm

## NeoVim

Text editor which can be used as IDE with a lot of configuration, but more mature than Helix

    scoop install main/neovim
    scoop install main/make
    scoop install main/mingw
    scoop install main/ripgrep
    scoop install main/python
    scoop install nodejs-lts

For initial setup we use NvChad distro

    git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 && nvim

Copy configuration files form **neovim** directory

Open neovim and wait for Lazy to install the plugins, after which quit neovim and reopen

    neovim

## Microsoft PowerToys

[Microsoft PowerToys](https://apps.microsoft.com/store/detail/microsoft-powertoys/XP89DCGQ3K6VLD) add a lot of nice functionalities to windows.

    scoop install extras/powertoys

Run the app:

- **Keyboard Manager** tab - remap **Caps Lock** to **Esc**
- **FancyZones** tab - setup window tiling to desired

## Visual Studio 2022

IDE for .NET development

Visual studio configuration can be found in **vs-2022** subfolder.
