### Minimal install of openSUSE ###
Pick the default KDE desktop environment. In the software selection, remove KDE apps (except Discover), TigerVNC and VLC. After installation, run:

`sudo zypper rm -u icewm xterm plasma6-desktop-emojier`


### Setting up the desktop, studying and gaming ###
1. You'll need to enter tty (alternatively YaST) and install your preferred terminal emulator, etc:
     
`sudo zypper in --no-recommends alacritty fastfetch nemo`

2. For nVidia users, install the drivers: https://en.opensuse.org/SDB:NVIDIA_drivers
3. Let's set up the gaming. Run `sudo zypper in --no-recommends steam lutris wine` and make sure everything works (run a game)
4. Make sure flatpak is installed and install KeePassXC and Anki
5. Import database and Anki addons (found in SSD)
6. Now install mpv (with yt-dlp) `sudo zypper in mpv` and import config
7. Set up Kavita for Mangas: https://www.kavitareader.com/#downloads-v1-linux. You can create a shortcut to that launches the terminal (Kavita.desktop)
8. Install other needed apps from flatpak like Obsidian, qBittorrent, Discord/Vencord
