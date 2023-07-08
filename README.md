# Configurations

<!--toc:start-->
- [Configurations](#configurations)
  - [Scoop](#scoop)
  - [Windows Terminal](#windows-terminal)
  - [Helix](#helix)
    - [Rust](#rust)
    - [C#](#c)
    - [JSON](#json)
    - [YAML](#yaml)
    - [Markdown](#markdown)
  - [Lazygit](#lazygit)
  - [Microsoft PowerToys](#microsoft-powertoys)
<!--toc:end-->

## Scoop

Scoop is a package manager (like Chocolatey)

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUse # Optional: Needed to run a remote script the first time
    irm get.scoop.sh | iex

## Windows Terminal

Windows Terminal is terminal created by Microsoft.

    scoop bucket add extras
    scoop install extras/windows-terminal

Windows Terminal configuration can be found in **windows-terminal** subfolder.

## Helix

Helix is a text editor which can be used as IDE with minimal setup.
    
    scoop bucket add main
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

## Microsoft PowerToys

[Microsoft PowerToys](https://apps.microsoft.com/store/detail/microsoft-powertoys/XP89DCGQ3K6VLD) can be used to remap keys.

Install and run the app, go to **Keyboard Manager** tab, and remap **Caps Lock** to **Esc**.

## Visual Studio 2022

IDE for .NET development

Visual studio configuration can be found in **vs-2022** subfolder.