# Auto Sysprep

## Preparations

1. git clone or download this repository into your U disk.
2. Get Your Required Packages
3. Verification
4. Get Portableapps

### Get Your Required Packages

Recommended free open-source softwares, save them into `./packages`:

Translation: [中文](./i18n/getapps-cn.md)

- Firefox: privacy-first browser

  [Download Installer directly](https://download.mozilla.org/?product=firefox-latest-ssl&os=win64)

- Thunderbird: Mozilla free email client

  [Official Download Page](https://www.thunderbird.net/)

- OBS: free live recorder

  [Official Download Page](https://obsproject.com/)

- Cyberduck: cloud storage explorer

  [Official Download Page](https://cyberduck.io/download/)

- Workrave: rest reminder

  [Official GitHub Release](https://github.com/rcaelers/workrave/releases/latest)

- Everything: file searcher, experience far beyond the system built-in search engine

  Find `Download Lite Installer 64-bit` at [Official Download Page](https://www.voidtools.com)

- VeraCrypt: free hard disk data encryptor

  Find `EXE Installer` at [Official Download Page](https://www.veracrypt.fr/en/Downloads.html)

- mcmilk's improved 7zip: compressor

  Find `.exe` at [Official GitHub Release](https://github.com/mcmilk/7-Zip-zstd/releases/latest)

- qBittorrent: free BitTorrent client

  Find `x64` at [FOSSHUB Release](https://www.fosshub.com/qBittorrent.html)

For Developers:

- Git for Windows

  [Official Download Page](https://gitforwindows.org/)

- PowerShell Core: better than classic PowerShell

  Find `win-x64.msi` at [Official GitHub Release](https://aka.ms/powershell-release?tag=stable)

- gVim: text editor Vim with GUI

  Click "Last modified" and find the latest `.exe` at [Official Download Page](https://ftp.nluug.nl/pub/vim/pc/)

- MSYS2: software distribution and building platform for Windows

  [Official Download Page](https://www.msys2.org/#installation)

- VirtualBox: free open source virtualization platform by Oracle:

  Find `Windows hosts` at [Official Download Page](https://www.vitualbox.org/wiki/Downloads#VirtualBoxbinaries)

- OpenSSH: upgrade SSH component package:

  find `OpenSSH-Win64-v` at [Official GitHub Page](https://github.com/PowerShell/Win32-OpenSSH/releases/latest)

- ImDisk Toolkit: ramdisk for Windows and mounting of image files

  [Official Download Page](https://sourceforge.net/projects/imdisk-toolkit/files/latest/download)

### Verification

Excecute `_verify.cmd` in `./packages/`

### Portable Applications

You can get [Firefox ESR](https://portableapps.com/apps/internet/firefox-portable-esr),
unpack it into current repository

## Get Started

Deploy on the target machine:

1. Enter into the
   [audit mode](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/boot-windows-to-audit-mode-or-oobe)
2. Open this repository with your './packages`
3. Edit `config.ps1`
4. Execute `setup.cmd`, or `setup-devenv.cmd` for developers.
