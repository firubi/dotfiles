### Kind of minimal install of openSUSE ###
Pick the default KDE desktop environment. In the software selection, remove KDE apps (except Discover/others you want) and VLC (I use mpv). After installation, you may want to remove icewm, and a few other apps so run:

`sudo zypper rm -u icewm opensuse-welcome plasma6-desktop-emojier`

Sometimes, opensuse-welcome and plasma6-desktop-emojier will be reinstalled on system updates, but you can taboo it in YaST so it won't be reinstalled.

### Setting up Firefox and input methods ###
Install the extenstions: uBlock (recommended filters: https://github.com/yokoffing/filterlists#guidelines), Yomichan (and import settings), Clipboard inserter, Return YouTube Dislikes and 7TV for twitch enjoyment (lol). For japanese, you need to install the necessary fonts: `sudo zypper in google-noto-sans-jp-fonts`. You'll need fcitx5 as well so run `sudo zypper in fcitx5 fcitx5-mozc kcm_fcitx5 fcitx5-configtool` and change the virtual keyboard in KDE system settings. If it doesn't work out of the box (it should), you can try these steps https://en.opensuse.org/SDB:Enable_input_method_in_Wayland. For fcitx5 to work with qolibri and other Qt/GTK apps, you'll need some additional packages:

`sudo zypper in --no-recommends fcitx5-gtk2 fcitx5-gtk3 fcitx5-gtk4 fcitx5-qt5 fcitx5-qt6`

For Yomichan, this is how I like to prioritize them: ![image](https://github.com/firubi/dotfiles/assets/168989779/3c34bbc3-577a-4755-b683-d681320a19b8)

For qolibri, I like this priority:

![image](https://github.com/firubi/dotfiles/assets/168989779/65e776e4-8647-4e2f-af59-730df233b1b2)


### Setting up the desktop, studying and gaming ###
1. You'll need to enter tty (alternatively YaST) and install your preferred terminal emulator, etc:
     
`sudo zypper in alacritty fastfetch dolphin qolibri`

Make sure to import the EPWINGS and optionally the stylesheet to fit with KDE Plasma's Breeze theme (straight up used ChatGPT).

2. For nVidia users, install the drivers: https://en.opensuse.org/SDB:NVIDIA_drivers. Run `sudo zypper addrepo --refresh https://download.nvidia.com/opensuse/tumbleweed NVIDIA` and then `sudo zypper install-new-recommends --repo NVIDIA`
3. Let's set up the gaming. Run `sudo zypper in steam lutris wine` and make sure everything works (run a game). Also install Ryujinx (among other emulators), osu!lazer, Prism Launcher and also ProtonUp-Qt for proton-ge. EDIT: I have moved to the native Minecraft client and I now use Bottles instead of lutris. 
4. You'll also probably need gamemode and mangohud so run `sudo zypper in mangohud goverlay gamemode` if you want to be able to run gamemoderun and mangohud
5. Make sure flatpak is installed and install KeePassXC and Anki
6. Import database and Anki addons (found in SSD)
7. Now install mpv (with yt-dlp) `sudo zypper in mpv` and import config
8. Set up Kavita for Mangas: https://www.kavitareader.com/#downloads-v1-linux. You can create a shortcut too that launches the terminal (Kavita.desktop).
9. Install other needed apps from flatpak like Obsidian (for medicine), qBittorrent, Discord/Vencord and possibly foobar2000 through WINE

#### Motion controls ####
To get motion controls working on nintendo pro controllers / joy-cons, you'll need a few apps. Firstly you need joycond which is in the official repositories `sudo zypper in joycond`. Motion control works now, but for the pro controller it will be "sideways". To get it straight, you can use joycond-cemuhook (https://github.com/joaorb64/joycond-cemuhook). Clone it in a folder (for me ~/Downloads/gitclone) and then to execute `sudo python3 joycond-cemuhook/src/joycond_cemuhook`. I personally launch it by typing in gyro that is an alias for `sudo python3 ~/Downloads/gitclone/joycond-cemuhook/src/joycond_cemuhook`.
 
### Setting up audio server for Anki ###
https://github.com/themoeway/local-audio-yomichan

 
 
### Setting up virt-manager ###
You can configure virt-manager right through YaST and it will auto-configure itself

  ##### Shared folders #####
 Enable shared memory 
 
![image](https://github.com/firubi/dotfiles/assets/168989779/440e7774-e705-45ab-b0ac-4bb98bd1661b)




 Add new hardware "Filesysytem" and use these settings: 
 
![image](https://github.com/firubi/dotfiles/assets/168989779/8188b71c-b7ea-4a8b-b390-56180a69115b)

 The source path could be something like `/home/firubi/Documents/virtmanager-shared-folder/Fedora`. Enter the virtual machine and make a directory to mount to, for example `mkdir ~/Documents/Shared-folder` and then mount it `sudo mount -t virtiofs shared ~/Documents/Shared-folder`. If you want to be able to put something in from guest, then change the folder's permission. To mount on boot, add in your fstab `shared   /home/firubi/Documents/Shared-folder       virtiofs        defaults        0       0`. (Swap "Fedora" with whatever you want)
 
For a Windows guest, follow these instructions: https://www.debugpoint.com/kvm-share-folder-windows-guest/. The first part of adding a Filesystem is identical.


### Setting up BSPWM ###
| Screenshots  | Screenshots |
| ------------- | ------------- |
| ![image](https://github.com/firubi/dotfiles/assets/168989779/58107ec0-d000-4a2e-b8cf-a77768628c33) | ![image](https://github.com/firubi/dotfiles/assets/168989779/669eac84-474a-4aaa-9780-5748358a704f)|
| ![image](https://github.com/firubi/dotfiles/assets/168989779/b2dd9dc7-4fba-496b-af1e-1db0c6751a57) | ![image](https://github.com/firubi/dotfiles/assets/168989779/87f34231-3be1-46fe-ace6-f3b78ae4e310) |

You'll need to install BSPWM and some other things: `sudo zypper in --no-recommends bspwm sxhkd rofi polybar nitrogen xfce4-power-manager fontawesome-fonts symbols-only-nerd-fonts`, the fonts if you want to use special symbols. Make the bspwm and sxhkd directory in .config and move the dotfiles over. Make sure the bspwmrc is an executable `chmod +x ~/.config/bspwm/bspwmrc`. If you want notifications and blur, then you'll need picom and dunst: `sudo zypper in picom dunst libnotify-tools`, and copy over the dotfiles.  I like to use pavucontrol for the audio module: `sudo zypper in pavucontrol`.

For themes to work out properly, I found that installing qt5ct and qt6ct solves the issue (choose Custom), and putting `export QT_QPA_PLATFORMTHEME="qt5ct"` in my ~/.profile (or bspwmrc to not interfere with plasma).

##### Disabling mouse acceleration #####
This is not needed when using KDE as it is its own option in the setting, but it doesn't carry over to bspwm. To disable, first find the device ID, `sudo zypper in xinput` and then run xinput. For the Logitech Superlight you only need to look at "Logitech USB Receiver". Then type `xinput set-prop "deviceid" "libinput Accel Profile Enabled" 0 1 0`. Confirm with `xinput list-props "deviceid"`. In /usr/share/X11/xorg.conf.d/40-libinput.conf, add the line `Option "AccelProfile" "flat"` in the section with the identifier `Identifier "libinput pointer catchall"`. (Essentially the same as Section 1 in https://wiki.archlinux.org/title/Mouse_acceleration). You might as well install a mouse configuration app as well, the easiest to use is solaar `sudo zypper in solaar`.

##### Rofi and power menu #####
Install all the themes from this https://github.com/adi1090x/rofi. Import the color themes black.rasi and the type-1 launcher.sh and the type-1 powermenu.sh (gives black and red colors). For lockscreen to work, it requires i3-lock (which I won't bother compiling)

### Setting up Hyprland ###
Firstly, I'd recommend tabooing sway, kanshi and grim in YaST (as they are recommended packages). Then install packages: `sudo zypper in --no-recommends hyprland waybar swww`. For the rofi menu to work for logout, you need to, in powermenu.sh, add ``elif [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
				hyprctl dispatch exit``
