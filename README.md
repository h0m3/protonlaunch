# ProtonLaunch

A small piece of script to launch Proton directly from the CLI, similar to Wine. It also allows you to set custom proton prefixes instead of Steam default ones

![Protonlaunch running Winecfg](https://raw.githubusercontent.com/h0m3/protonlaunch/main/screenshot.png)

# installation

## Requirements

- [Linux](https://kernel.org/) version 3 or newer
- [Steam](https://store.steampowered.com/) latest revision
- [Bash](https://www.gnu.org/software/bash/) version 4 or newer
- [curl](https://curl.se/) (only needed for automatic installation)

## Enable Steam Play Compatibility

You need to enable Steam Play Compatibility Layer (proton) for all games.

For that, open Steam and go to **Steam > Settings > Steam Play > Advanced** and check *Enable Steam Play for all other titles*

## Install Proton on Steam

Make sure you're in your Steam **Library** and in the Search Bar type *proton*, you should see all available Proton versions, install the ones that you want to use. I recommend using the latest non-experimental one.

## Single line automatic installation

Just copy and paste to install protonlaunch to your `/usr/local/bin`

```bash
curl -O https://raw.githubusercontent.com/h0m3/protonlaunch/main/protonlaunch; sudo mv ./protonlaunch /usr/local/bin/protonlaunch; sudo chmod +x /usr/local/bin/protonlaunch
```

## Manual Installation

Clone or download a zip file of this project, extract it in a folder then move 'protonlaunch' to a executable path in your system, e.g. `/usr/local/bin`:

```bash
sudo mv ./protonlaunch /usr/local/bin/protonlaunch
```

Then set execution permissions to protonlaunch

```bash
sudo chmod +x /usr/local/bin/protonlaunch
```

If you're installing this as a distributable package, I'd appreciate if you could also include this readme and the license file in a folder like `/usr/share/docs` ;)

## You're done

Now just test it, if you have a standard Steam / Proton installation, it should work by just typing `protonlaunch winecfg` in your terminal.

# FAQ

## Why you made this script?

Well... I was having issues with two specific bugs on proton, the first one is related to installing games in other drives: https://github.com/ValveSoftware/steam-runtime/issues/470 and the second one is the fact that *%command%* doesn't work with non-steam games: https://github.com/ValveSoftware/steam-for-linux/issues/6046.

The easy way was to run proton with an independent prefix other than Steam defaults. But that requires setting up several variables, so I made this script that detects some stuff automatically and make proton behave very similar to wine.

## What can I run with protonlaunch

I've tested proton and it seems to behave similarly to Wine, so anything that runs on Wine should run fine under Proton with protonlaunch. Check [ProtonDB](https://www.protondb.com/) for more information.

## Can I run this script without Steam?

I did some tests with Steam closed and Proton seems to work fine without Steam, but the Proton version on Steam is meant to be run with Steam, so I recommend you always run it with Steam open.

## Can I change the default prefix path?

This was the most important part for me, so the short answer is **YES**, you can. You can specify a prefix path to any folder you want using `STEAM_COMPAT_DATA_PATH`, `WINEPREFIX` or `PROTONPREFIX`. By default Steam uses `STEAM_COMPAT_DATA_PATH` to determine the default prefix path, but to shorten the command I also linked `WINEPREFIX` and `PROTONPREFIX`. You can use any of the, but the default variable will always take precedence if present. The default prefix path is `${HOME}/.proton`.

You can set the prefix like wine

```bash
env PROTONPREFIX="/your/prefix/path" protonlaunch your-program
```

## I've installed Proton in another path

> If Proton is installed without custom settings, it will be installed in the default path and you dont need to set this variable

If you take a look at your library management you will notice you can install Proton in any Steam library folder. By default, protonlaunch tries to use Proton in the default Steam library path. You can override this by setting the `_STEAM_LIBRARY_PATH` variable to the Steam library path you have Proton installed.

Since Proton is a small application and I wanted to keep this as simple as possible, I didn't add a way to automatically detect where Proton is installed. I might add this later if there's enough interest in this feature.


```bash
env _STEAM_LIBRARY_PATH="/your/steam/library/path" protonlaunch your-program
```

Your Steam library path is the folder before the `steamapps` folder. By default Steam names it `SteamLibrary` but that name can be changed by the user.

## Can I change the proton version?

By default protonlaunch will automatically detect and use the newest version of Proton in your Steam Library. This is only useful if you have a single proton installation in your Steam Library since that's the most common use case and it will always prefer stable releases over Proton Experimental. The version being used will be visible in the CLI.

If you have more than one Proton installation on your Steam or need to use a specific version, you can set the `_PROTON_VERSION` variable to the version you want to run, you can run different versions for different prefixes.

``` bash
env _PROTON_VERSION="Proton 6.3" protonlaunch your-program
```

The version specified is the name of the *proton* folder on `your-steam-library/steamapps/common/`.

## Protonlaunch is not detecting my Steam installation

Steam installs itself at `${HOME}/.local/share/Steam`, I don't know if there's a way to install it in a different location, but Protonlaunch uses some tricks to try and find your Steam install location, this might fail. **You need to launch Steam at least once** to install all files on `${HOME}/.local/share/Steam`.

But if somehow you need to customize your Steam installation or it's not default, you can set `STEAM_COMPAT_CLIENT_INSTALL_PATH` which is the default variable that Proton uses to detect the Steam install folder. I've also created an alias for that variable named `_STEAM_PATH`, but `STEAM_COMPAT_CLIENT_INSTALL_PATH` always has preference.

```bash
env _STEAM_PATH="/your/steam/installation" protonlaunch your-program
```

If Steam is not found you'll receive the following error message: `Unable to find Steam path, please set _STEAM_PATH`.

## Can I redistribute this script / license information

**YES**, Protonlaunch is distributed under the BSD-Three Clause license which allows the following rights:

> Copyright 2022 Artur 'h0m3' Paiva \<dr.hoome@gmail.com\>
> All rights reserved.
>
> Redistribution and use in source and binary forms, with or without
> modification, are permitted provided that the following conditions are met:
>
> 1. Redistributions of source code must retain the above copyright notice, this
>    list of conditions and the following disclaimer.
>
> 2. Redistributions in binary form must reproduce the above copyright notice,
>    this list of conditions and the following disclaimer in the documentation
>    and/or other materials provided with the distribution.
>
> THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
> ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIEDi
> WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
> ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

I would appreciate any extra credits ;)

# Notice

Protonlaunch **IS NOT** associated with [Valve Software](https://www.valvesoftware.com) or [ProtonDB](https://www.protondb.com/). [Steam](https://steampowered.com), [Valve](https://www.valvesoftware.com) and [Proton](https://github.com/ValveSoftware/Proton/) are developed by and trademarks of [Valve Software](https://www.valvesoftware.com). [ProtonDB](https://www.protondb.com/) is a passion project from [@bdefore](https://github.com/bdefore) and a dedicated community of reporters.
