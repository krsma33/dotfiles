# Configurations

<!--toc:start-->
- [Configurations](#configurations)
  - [Scoop](#scoop)
  - [Helix](#helix)
    - [Rust](#rust)
    - [C#](#c)
    - [JSON](#json)
    - [YAML](#yaml)
    - [Markdown](#markdown)
  - [Lazygit](#lazygit)
<!--toc:end-->

## Scoop

Scoop is a package manager (like Chocolatey)

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUse # Optional: Needed to run a remote script the first time
    irm get.scoop.sh | iex

## Helix

Helix is a text editor which can be used as IDE with minimal setup.
    
    scoop bucket add main
    scoop install helix

Helix configuration can be found in **helix-editor\config.toml**.

Helix language configurations can be found in **helix-editor\languages.toml**.

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

    npm i -g vscode-langservers-extracted

### YAML

Language server for YAML

    npm i -g yaml-language-server@next

### Markdown

Language server for markdown

    scoop install main/marksman

## Lazygit

Lazy git is command line git tool

    scoop bucket add extras
    scoop install extras/lazygit