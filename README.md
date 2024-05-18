### Minimal install of openSUSE ###
Pick the default KDE desktop environment. In the software selection, remove KDE apps (except Discover), TigerVNC and VLC. After installation, run:

`sudo zypper rm -u icewm xterm plasma6-desktop-emojier`


### Setting up the desktop ###
1. You'll need to enter tty (alternatively YaST) and install your preferred terminal emulator, etc:
     
`sudo zypper in --no-recommends alacritty fastfetch`

2. For nVidia users (me), install the drivers: https://en.opensuse.org/SDB:NVIDIA_drivers
