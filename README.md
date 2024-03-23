# Configurations

<!--toc:start-->
- [Configurations](#configurations)
  - [Windows](#windows)
    - [Scoop](#scoop)
    - [Oh my posh](#oh-my-posh)
    - [PowerShell](#powershell)
    - [Rancher Desktop](#rancher-desktop)
    - [Microsoft PowerToys](#microsoft-powertoys)
    - [Visual Studio 2022](#visual-studio-2022)
    - [Windows Terminals](#windows-terminals)
      - [Wezterm](#wezterm)
      - [Windows Terminal](#windows-terminal)
    - [Windows Text Editors](#windows-text-editors)
      - [NeoVim](#neovim)
        - [Rust Setup](#rust-setup)
      - [Helix](#helix)
        - [Rust](#rust)
        - [C#](#c)
        - [JSON](#json)
        - [YAML](#yaml)
        - [Markdown](#markdown)
    - [Lazygit](#lazygit)
  - [WSL2](#wsl2)
    - [Install](#install)
    - [Wslu](#wslu)
    - [Map to drive](#map-to-drive)
  - [Linux Arch/Manjaro](#linux-archmanjaro)
    - [Zsh](#zsh)
      - [Oh my posh linux](#oh-my-posh-linux)
      - [Syntax Highlighting](#syntax-highlighting)
      - [Fzf keybindings](#fzf-keybindings)
      - [Zsh-autosuggestions](#zsh-autosuggestions)
    - [Yay Package Manager](#yay-package-manager)
    - [Enable SSH](#enable-ssh)
    - [Linux Text Editors](#linux-text-editors)
      - [NeoVim-nightly](#neovim-nightly)
        - [WSL clipboard](#wsl-clipboard)
        - [Linux clipboard](#linux-clipboard)
    - [Linux Terminals](#linux-terminals)
      - [Wezterm terminal](#wezterm-terminal)
    - [Dev Tools](#dev-tools)
      - [Lazygit CLI](#lazygit-cli)
      - [Docker](#docker)
      - [Kubectl](#kubectl)
      - [Fzf](#fzf)
      - [Neofetch](#neofetch)
      - [Manuals](#manuals)
      - [Less](#less)
      - [Sed](#sed)
    - [Languages](#languages)
      - [DotNet](#dotnet)
      - [Java](#java)
      - [Rust Lang](#rust-lang)
<!--toc:end-->

## Windows

### Scoop

Scoop is a package manager (like Chocolatey)

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUse
    irm get.scoop.sh | iex

### Oh my posh

Oh my posh is used to customize prompt in your terminal

    scoop bucket add main
    scoop install main/oh-my-posh

Download and install the nerd font.
[Caskaydia Cove Nerd Font Complete](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip)
looks nice.

Init powershell profile

    New-Item -Path $PROFILE -Type File -Force

Modify newly created file by appending
**oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/multiverse-neon.omp.json" | Invoke-Expression**

    notepad $PROFILE

### PowerShell

PowerShell is the .NET Core version of PowerShell
(compared to WindowsPowerShell which runs on .NET Framework)

    scoop install main/pwsh

### Rancher Desktop

Rancher desktop is used to locally work with k8s and docker.
It's good open source replacement for Docker Desktop.

    scoop install extras/rancher-desktop

### Microsoft PowerToys

[Microsoft PowerToys](https://apps.microsoft.com/store/detail/microsoft-powertoys/XP89DCGQ3K6VLD) add a lot of nice functionalities to windows.

    scoop install extras/powertoys

Run the app:

- **Keyboard Manager** tab - remap **Caps Lock** to **Esc**
- **FancyZones** tab - setup window tiling to desired

### Visual Studio 2022

IDE for .NET development

Visual studio configuration can be found in **vs-2022** subfolder.

### Windows Terminals

#### Wezterm

Terminal written in Rust

    scoop install extras/wezterm

#### Windows Terminal

Windows Terminal is terminal created by Microsoft.

    scoop bucket add extras
    scoop install extras/windows-terminal

Windows Terminal configuration can be found in **windows-terminal** subfolder.

### Windows Text Editors

#### NeoVim

Text editor which can be used as IDE with a lot of configuration, but more mature than Helix

    scoop install main/neovim
    scoop install main/make
    scoop install main/mingw
    scoop install main/ripgrep
    scoop install main/python
    scoop install nodejs-lts

For initial setup we use LazyVim

    git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim

Copy configuration files form **neovim** directory to %appdata%\nvim

Open neovim and wait for Lazy to install the plugins, after which quit neovim and reopen

    neovim

##### Rust Setup

Install better test runner

    cargo install cargo-nextest --locked

#### Helix

Helix is a text editor which can be used as IDE with minimal setup.

    scoop install helix

Helix configuration can be found in **helix-editor** subfolder.

##### Rust

Configure Helix language server and debugger for Rust

    scoop install main/rust-analyzer
    scoop install main/llvm

NOTE: This assumes Rust tooling and C++ tooling is previously installed

##### C#

Configure Helix language server and debugger forC#

    scoop bucket add versions
    scoop install versions/omnisharp-net6
    scoop install main/netcoredbg
    scoop shim add netcoredbg ~\scoop\apps\netcoredbg\current\netcoredbg.exe

NOTE: This assumes .NET Core SDK and tooling is previously installed

##### JSON

Language server covers JSON and HTML

    npm i -g vscode-langserers-extracted

##### YAML

Language server for YAML

    npm i -g yaml-language-server@next

##### Markdown

Language server for markdown

    scoop install main/marksman

### Lazygit

Lazy git is command line git tool

    scoop install extras/lazygit

## WSL2

### Install

Install WSL (will install Ubuntu distro by default)

    wsl --install

Install Arch Linux distro from Windows Store

    https://github.com/VSWSL/Arch-WSL

Start **arch** in **powershell** and setup user and password

    arch

Set arch as default wsl distro

    wsl --set-default arch

Open **wsl**

    wsl

Set the root password

    sudo passwd root

(Optional) If company certificate is required copy it to ~/cert.crt

    sudo trust anchor --store ~/cert.crt

Install zsh

    sudo pacman -S zsh

Setup default user

    sudo usermod -aG wheel -s /bin/zsh {username}

Initialize key ring

    sudo pacman-key --init
    sudo pacman-key --populate
    sudo pacman -Sy archlinux-keyring
    sudo pacman -Su

### Wslu

Wslu is a collection of [Utilities for WSL](https://wslutiliti.es/wslu/install.html).
The reason for installing is mainly for **wslview** which allows opening Windows
explorer or browsr from WSL.

Download WSL Utilities Package

    curl https://pkg.wslutiliti.es/public.key >> public.key
    sudo pacman-key --add public.key

Locally sign the key (if not signed)

    sudo pacman-key --lsign-key 2D4C887EB08424F157151C493DD50AA7E055D853

Modify **pacman.conf** to include the repository

    sudo nano /etc/pacman.conf

Add following

    [wslutilities]
    Server = https://pkg.wslutiliti.es/arch/

Run cmds

    sudo pacman -Sy
    sudo pacman -S wslu

Set environment variable of default browser:

    sudo nano ~/.zshrc

Add following line:

    export BROWSER=wslview

### Map to drive

In windows explorer right click on **This PC** (or **Network**) tab
and select **map network drive..**  
Select drive letter and in folder type **\\wsl$\Arch**  
Select Finish

## Linux Arch/Manjaro

### Zsh

Install zsh

    sudo pacman -S zsh

#### Oh my posh linux

Install oh-my-posh

    yay -S oh-my-posh

Open zsh and perform initial configuration

    zsh

Copy and paste **./oh_my_posh_themes** directory to **~/.config/** (or get from [github](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/))

Edit ~/.zshrc

    sudo nano ~/.zshrc

Add theme

    eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_themes/sonicboom-custom.omp.json)"

Refresh zsh

    exec zsh

#### Syntax Highlighting

Install Fast Syntax Highlighting

    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/fsh

Activate the plugin

    nano ~/.zshrc

Add following line (must be last line)

    source ~/.config/fsh/fast-syntax-highlighting.plugin.zsh

(Optional) Set theme

    fast-theme sv-orple

#### Fzf keybindings

To enable fzf history-search (CTRL+r) and fzf file-search (CTRL+t)

Activate the plugin

    nano ~/.zshrc

Add following line above syntax highlighting plugin

    source /usr/share/fzf/key-bindings.zsh

#### Zsh-autosuggestions

To install zsh autosuggestions plugin

    yay -S zsh-autosuggestions

Activate the plugin

    nano ~/.zshrc

Add following line above syntax highlighting plugin

    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### Yay Package Manager

Yay package manager is needed for installing packages from AUR repository.

Install *base-devel* and *git*

    sudo pacman -S --needed base-devel git

Clone yay git repo

    git clone https://aur.archlinux.org/yay.git

Switch dir to yay

    cd yay

Install yay

    makepkg -si

Remove git repo

    cd ..
    rm -r yay -f

### Enable SSH

Whole reason for enabling ssh is to be able to have **undercurls** by using
wezterm ssh instead of wsl directly (ConPty removes all underlines which is annoying)

Arch doesn't have ssh pre installed

    yay -S openssh

Copy existing (generate and copy) %userprofile%/.ssh/id_rsa.pub key contents to ~/.ssh/authorized_keys

    mkdir -p ~/.ssh
    nano ~/.ssh/authorized_keys

Copy id_rsa.pub key contents

    sudo chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

Generate host keys

    sudo ssh-keygen -A

Open sshd config

    sudo nano /etc/ssh/sshd_config

Append/modify the following to the sshd_config file

    AllowUsers {username}
    Port 2222

Fix PAM rule to allow ssh for non root

    sudo nano /etc/pam.d/sshd

Prepend following lines

    account [success=done default=ignore] pam_succeed_if.so quiet user ingroup wheel
    account required     pam_nologin.so

Enable sshd service to run on startup

    sudo systemctl enable sshd

Reboot

    sudo reboot

### Linux Text Editors

#### NeoVim-nightly

Install neovim-nightly and dependencies

    yay -S neovim-git ripgrep fd python nodejs npm unzip

For initial setup we use LazyVim

    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git

Copy configuration files form **neovim** dir to ~/.config/nvim

Open neovim and wait for Lazy to install the plugins,
after which quit neovim and reopen

    nvim

##### WSL clipboard

To be able to use clipboard between neovim WSL instance and Windows some setup is needed
In neovim **init.lua** or **lua/config/options.lua** configure clipboard

    vim.opt.clipboard = "unnamedplus"

On WSL instance install **win32yank**

    yay -S win32yank-bin

##### Linux clipboard

To be able to use clipboard between neovim WSL instance and Windows some setup is needed
In neovim **init.lua** or **lua/config/options.lua** configure clipboard

    vim.opt.clipboard = "unnamedplus"

On WSL instance install **xclip**

    yay -S xclip

##### Roslyn Language Server

To install latest DotNet language server, [Roslyn](https://github.com/jmederosalvarado/roslyn.nvim), few steps are needed (as it's not supported by usual nvim tooling):

- Download [Roslyn Language Server](https://github.com/jmederosalvarado/roslyn.nvim/releases) from releases
- Extract tar using: **tar zxf /path/to/roslyn.tar.gz -C ~/.local/share/nvim/roslyn**
- Make sure that **roslyn_version** option matches the downloaded language server version (plugins/lsp/roslyn.lua)
### Linux Terminals

#### Wezterm terminal

Terminal written in Rust

    yay -S wezterm
    yay -S wezterm-terminfo

Add TERM=wezterm to **zshrc**

    sudo nvim ~/.zshrc

Add TERM=wezterm and save

### Dev Tools

#### Lazygit CLI

Install lazygit

    yay -S lazygit

#### Docker

Instal docker

    yay -S docker

Add user to docker group to avoid using sudo

    sudo usermod -aG docker {username}

Enable docker on startup

    sudo systemctl enable docker

#### Kubectl

Install **kubectl**

    yay -S kubectl

#### Fzf

Install **fzf**

    yay -S fzf

Usage e.g.:

- fzf
- kubectl get pods -A --no-headers | fzf | awk '{print $2, $1}' | xargs -n 2 sh -c 'kubectl describe pod $0 -n $1'

#### Neofetch

Instal **neofetch**, a tool to display system information

    yay -S neofetch

#### Manuals

Install manuals database for Linux commands

    yay -S man-db

Usage e.g. **man touch** to get touch command docs

#### Less

Tool used for scrolling text in terminal

    yay -S less

Usage **less file.txt**

#### Sed

Install vim like search and replace text tool

    yay -S sed

Usage e.g. **sed 's/world/universe/' file.txt > file.txt**

### Languages

#### DotNet

Install latest .NET SDK

    yay -S dotnet-sdk
    yay -S aspnet-runtime

Add DOTNET_ROOT to **zshrc**

    sudo nvim ~/.zshrc

Add following line

    export DOTNET_ROOT=/opt/dotnet

#### Java

Install latest Java SDK

    yay -S jdk-openjdk

Install spring boot CLI

    yay -S spring-boot-cli

Install gradle

    yay -S gradle

#### Rust Lang

Install latest rustup

    yay -S rustup

Setup cargo

    rustup default stable
