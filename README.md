# Configurations

Tools configurations

## Fresh Setup

### Scoop

Scoop is a package manager (like Chocolatey)

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    irm get.scoop.sh | iex

### Helix

Helix is a text editor which can be used as IDE with minimal setup.
    
    scoop bucket add main
    scoop install helix

Helix configuration can be found in **helix-editor** subfolder

#### Rust

Configure Helix language server and debugger for Rust

    scoop install main/rust-analyzer
    scoop install main/llvm

NOTE: This assumes Rust tooling and C++ tooling is previously installed

Helix language configuration can be found in **helix-editor** subfolder

#### C#

Configure Helix language server and debugger for C#

    scoop bucket add versions
    scoop install versions/omnisharp-net6
    scoop install main/netcoredbg
    scoop shim add netcoredbg ~\scoop\apps\netcoredbg\current\netcoredbg.exe

NOTE: This assumes .NET Core SDK and tooling is previously installed

Helix language configuration can be found in **helix-editor** subfolder

### Lazygit

Lazy git is command line git tool

    scoop bucket add extras
    scoop install extras/lazygit
