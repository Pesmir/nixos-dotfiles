# A tidy `$HOME` is a tidy mind

+ Fanatical XDG compliance
+ Closet Vim-_in_-Emacs evangelist
+ Aesthetics are modularized into theme modules
+ Tailored to a C++ GameDev hobbyist
  + Love2D, godot, or phaser for rapid prototyping
  + LMMS + Sunvox as my DAW
  + GIMP & Aseprite for gfx
+ Former Adobe cultist, trying real hard to like the open source alternatives.
  + Photoshop -> GIMP & Krita
  + Illustrator -> Inkscape
  + InDesign or XD -> HTML + print stylesheets
  + Premiere/After Effects -> [DaVinci
    Resolve](https://www.blackmagicdesign.com/products/davinciresolve/) (how
    dafuq is this free?)
  + Animate/Flash -> [Aseprite](https://www.aseprite.org/)
  + Audition -> Audacity
+ *Works on my machine ¯\_(ツ)_/¯*

![Me looking busy](/../screenshots/fluorescence/fakebusy.png?raw=true)

<p align="center">
<span><img src="/../screenshots/fluorescence/desktop.png?raw=true" height="188" /></span>
<span><img src="/../screenshots/fluorescence/rofi.png?raw=true" height="188" /></span>
<span><img src="/../screenshots/fluorescence/tiling.png?raw=true" height="188" /></span>
</p>

+ **Operating System:** NixOS 19.09
+ **Shell:** zsh 5.7.1 + zgen
+ **DM:** lightdm + lightdm-mini-greeter
+ **WM:** bspwm + polybar
+ **Editor:** [Doom Emacs][doom-emacs] (and occasionally [vim][vimrc])
+ **Terminal:** st
+ **Launcher:** rofi
+ **Browser:** firefox
+ **GTK Theme:** [Ant Dracula](https://github.com/EliverLara/Ant-Dracula)
+ **Icon Theme:** [Paper Mono Dark](https://github.com/snwh/paper-icon-theme)

## Quick start

```sh
# Assumes your partitions are set up and root is mounted on /mnt
curl https://raw.githubusercontent.com/hlissner/dotfiles/nixos/deploy | sh
```

Which is equivalent to:

```sh
USER=${USER:-hlissner}
HOST=${HOST:-kuro}
NIXOS_VERSION=19.09
DOTFILES=/home/$USER/.dotfiles

git clone https://github.com/hlissner/dotfiles /etc/dotfiles
ln -s /etc/dotfiles $DOTFILES
chown -R $USER:users $DOTFILES

# make channels
nix-channel --add "https://nixos.org/channels/nixos-${NIXOS_VERSION}" nixos
nix-channel --add "https://github.com/rycee/home-manager/archive/release-${NIXOS_VERSION}.tar.gz" home-manager
nix-channel --add "https://nixos.org/channels/nixpkgs-unstable" nixpkgs-unstable

# make /etc/nixos/configuration.nix
nixos-generate-config --root /mnt
echo "import /etc/dotfiles \"$$HOST\" \"$$USER\"" >/mnt/etc/nixos/configuration.nix

# make install
nixos-install --root /mnt -I "my=/etc/dotfiles"
```

### Management

+ `make` = `nixos-rebuild test`
+ `make switch` = `nixos-rebuild switch`
+ `make upgrade` = `nix-channel --update && nixos-rebuild switch`
+ `make install` = `nixos-generate-config --root $PREFIX && nixos-install --root
  $PREFIX`
+ `make gc` = `nix-collect-garbage -d` (use sudo to clear system profile)


[doom-emacs]: https://github.com/hlissner/doom-emacs
[vimrc]: https://github.com/hlissner/.vim
