# ProtonLaunch

A small piece of script to launch Steam Proton instance directly from the CLI, similar to Wine. It also allows you to set custom proton prefixes instead of Steam default ones

![Protonlaunch running Winecfg](https://raw.githubusercontent.com/h0m3/protonlaunch/main/screenshot.png)

# installation

## Requirements

- [Steam](https://store.steampowered.com/)
- [Bash](https://www.gnu.org/software/bash/)
- [curl](https://curl.se/) (only needed for automatic installation)
- [sudo](https://www.sudo.ws/) (only needed for automatic installation)

## Enable Steam Play Compatibility

You need to enable Steam Play Compatibility Layer (proton) for all games.

For that, open Steam and go to **Steam > Settings > Steam Play > Advanced** and check *Enable Steam Play for all other titles*

## Install Proton on Steam

Make sure you're in your Steam **Library** and in the Search Bar type *proton*, you should see all available Proton versions, install the ones that you want to use. I recommend using the latest non-experimental one.

## Arch Linux Users

Protonlaunch is available on [AUR](https://aur.archlinux.org/packages/protonlaunch) for Arch Linux users.

You can build it and install using the standard AUR build commands
```bash
git clone https://aur.archlinux.org/protonlaunch.git
cd protonlaunch
makepkg -si
```

If you're not running Arch Linux you can still use the single line automatic installation below or the [manual installation process](https://github.com/h0m3/protonlaunch/wiki/Manual-installation).

## Single line automatic installation

Just copy and paste to install protonlaunch to your `/usr/local/bin`

```bash
curl -O https://raw.githubusercontent.com/h0m3/protonlaunch/main/protonlaunch; sudo mv ./protonlaunch /usr/local/bin/protonlaunch; sudo chmod +x /usr/local/bin/protonlaunch
```

## You're done

Now just test it, if you have a standard Steam / Proton installation, it should work by just typing `protonlaunch winecfg` in your terminal.

# Manual installation

We have a [manual installation process](https://github.com/h0m3/protonlaunch/wiki/Manual-installation) guide on your wiki if you prefer

# Check out our FAQ

We have a [FAQ](https://github.com/h0m3/protonlaunch/wiki/FAQ) with the most common questions on our wiki, if you have any problems check it out. Also feel free to report a bug or a improvement using the github issue tracker.


# Notice

Protonlaunch **IS NOT** associated with [Valve Software](https://www.valvesoftware.com) or [ProtonDB](https://www.protondb.com/). [Steam](https://steampowered.com), [Valve](https://www.valvesoftware.com) and [Proton](https://github.com/ValveSoftware/Proton/) are developed by and trademarks of [Valve Software](https://www.valvesoftware.com). [ProtonDB](https://www.protondb.com/) is a passion project from [@bdefore](https://github.com/bdefore) and a dedicated community of reporters.
