### Minimal install of openSUSE ###
Pick the default KDE desktop environment. In the software selection, remove KDE apps (except Discover), TigerVNC and VLC. After installation, run:

`sudo zypper rm -u icewm xterm plasma6-desktop-emojier opensuse-welcome`


 You can uncheck the "install recommended packages" but you'll lose a lot of functionality in plasma.

### Setting up Firefox and input methods ###
Install the extenstions: uBlock, Yomichan (and import settings), Clipboard inserter, Return YouTube Dislikes and 7TV for twitch enjoyment (lol). For japanese, you need to install the necessary fonts: `sudo zypper in google-noto-sans-jp-fonts`. You'll need fcitx5 as well so run `sudo zypper in --no-recommends fcitx5 fcitx5-mozc kcm_fcitx5 fcitx5-configtool` and change the virtual keyboard in KDE system settings. For fcitx5 to work with qolibri and other Qt/GTK apps, you'll need some additional packages:

`sudo zypper in --no-recommends fcitx5-gtk2 fcitx5-gtk3 fcitx5-gtk4 fcitx5-qt5 fcitx5-qt6`


### Setting up the desktop, studying and gaming ###
1. You'll need to enter tty (alternatively YaST) and install your preferred terminal emulator, etc:
     
`sudo zypper in --no-recommends alacritty fastfetch dolphin qolibri`

Make sure to import the EPWINGS and optionally the stylesheet to fit with KDE Plasma's Breeze theme (straight up used ChatGPT).

2. For nVidia users, install the drivers: https://en.opensuse.org/SDB:NVIDIA_drivers. Run `zypper addrepo --refresh https://download.nvidia.com/opensuse/tumbleweed NVIDIA` and then `sudo zypper install-new-recommends --repo NVIDIA`
3. Let's set up the gaming. Run `sudo zypper in --no-recommends steam lutris wine` and make sure everything works (run a game). Also install Ryujinx (among other emulators), osu!lazer, Prism Launcher and also ProtonUp-Qt for proton-ge
4. You'll also probably need gamemode and mangohud so run `sudo zypper in mangohud goverlay gamemode` if you want to be able to run gamemoderun and mangohud
5. Make sure flatpak is installed and install KeePassXC and Anki
6. Import database and Anki addons (found in SSD)
7. Now install mpv (with yt-dlp) `sudo zypper in mpv` and import config
8. Set up Kavita for Mangas: https://www.kavitareader.com/#downloads-v1-linux. You can create a shortcut too that launches the terminal (Kavita.desktop)
9. Install other needed apps from flatpak like Obsidian (for medicine), qBittorrent, Discord/Vencord and possibly foobar2000 through WINE, and protonvpn-gui

  
 
### Setting up audio server for Anki ###
https://github.com/themoeway/local-audio-yomichan

 
 
### Setting up virt-manager ###
You can configure virt-manager right through YaST and it will auto-configure itself

 
 
### DONE ###
Install your games, themes, customizations, whatever. 

Install mouse-configuration and OpenRGB

### Setting up awesomewm ###
There's an annoying thing with openSUSE making you install programs that aren't needed, even with the --no-recommends argument. Taboo lightdm via YaST and then you can run `sudo zypper in awesome` to get a minimal install.
