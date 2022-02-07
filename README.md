# ProtonLaunch

A small piece of script to launch Proton directly from the CLI similar to Wine, it also allows you to set custom proton prefixes instead of Steam default ones

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

Go on **Library** and in the Search Bar type *proton*, you should see all available Proton versions, install the ones that you want to use. I recommend the latest non-experimental one.

## Single line automatic installation

Just copy and paste to install protonlaunch to your `/usr/local/bin`

```bash
curl -O https://raw.githubusercontent.com/h0m3/protonlaunch/main/protonlaunch; sudo mv ./protonlaunch /usr/local/bin/protonlaunch; sudo chmod +x /usr/local/bin/protonlaunch
```

## Manual Installation

Download a zip file of this project, extract it in a folder then move 'protonlaunch' to a executable path of your system like `/usr/local/bin`:

```bash
sudo mv ./protonlaunch /usr/local/bin/protonlaunch
```

Then set execution permissions to protonlaunch

```bash
sudo chmod +x /usr/local/bin/protonlaunch
```

If you're installing this as a distributable package I'll appreciate if you could also include this readme and the license file in a folder like `/usr/share/docs` ;)

## You're done

Now just test it, if you have a standard Steam / Proton installation it should work by just typing `protonlaunch winecfg` on your terminal.

# FAQ

## Why did you done this script?

Well... I was having issues with two specific bugs on proton, the first is related to install games on other drives: https://github.com/ValveSoftware/steam-runtime/issues/470 and the second is the fact that *%command%* doesn't work with non-steam games: https://github.com/ValveSoftware/steam-for-linux/issues/6046.

The easy way was to run proton with an independent prefix other than Steam defaults. But that requires setting up several variables, so I made this script that detects some stuff automatically and make proton behave very similar to wine.

## What can I run with protonlaunch

I've tested proton and it looks like it behaves very similar to wine, so anything that runs on Wine should run fine under proton with protonlaunch. Check [ProtonDB](https://www.protondb.com/) for more information.

## Can I run software without steam?

I did some tests with steam closed and proton seems to work fine without Steam open but the version of proton included on Steam is meant to run in conjunction with Steam which was my purpose with this script, so I recommend that you run with Steam open.

## Can I change the default prefix path?

This was the most important part for me, so the short answer is **YES**, you can. You can specify a prefix on whatever folder you want. By default steam uses `STEAM_COMPAT_DATA_PATH` to determinate the default prefix, but since this is a mouthful I also linked `WINEPREFIX` and `PROTONPREFIX` variables to set prefix, although it always gives preference for `STEAM_COMPAT_DATA_PATH`. By default the prefix is set to `${HOME}/.proton`. So you can use either `STEAM_COMPAT_DATA_PATH`, `WINEPREFIX` or `PROTONPREFIX` to set your prefix path.

You can set the prefix like wine

```bash
env PROTONPREFIX="/your/prefix/path" protonlaunch your-program
```

## I've installed Proton in another library

> If proton is installed without custom settings it will be installed on the default path and you dont need to set this variable

If you check on your library management you can see that you can install proton on any steam library folder, for now protonlaunch cannot detect automatically which library proton is installed so protonlaunch will only try to find Proton on the default Steam library. But you can override the library that protonlaunch will use with `_STEAM_LIBRARY_PATH` variable so you can install proton on any library.

Since proton is a small application I dont see much use on this feature, but if becomes useful i'll try to find a way to detect proton on any of your steam libraries. You can manually change your library like

```bash
env _STEAM_LIBRARY_PATH="/your/steam/library/path" protonlaunch your-program
```

Your steam library path is the folder outside the one called `steamapps`, normally steam calls it `SteamLibrary` but that name can be changed by the user.

## Can I change the proton version?

By default protonlaunch will find the newest version of proton on your Steam Library and use that, it will notify you over CLI of what version is using, but the autodetect is only useful if you have a single proton installation on your Steam Library, since thats the most common situation that shoudn't be a problem. Also, protonlaunch will avoid Proton Experimental with this autodetect and always prefer a stable release.

But if you have more than one Proton installation on your Steam I recommend you to set the `_PROTON_VERSION` variable to the version that you want to run, you can run different versions for different prefixes.

``` bash
env _PROTON_VERSION="Proton 6.3" protonlaunch your-program
```

The version specified is the name of the *proton* folder on `your-steam-library/steamapps/common/`.

## Protonlaunch cannot detect my steam installation

Steam installs itself on `${HOME}/.local/share/Steam`, I don't know if there's a way to install in another location but Protonlaunch uses some tricks to try and find your steam installation, this may fail. **You need to launch steam at least once** to install all files on `${HOME}/.local/share/Steam`.

But if somehow you need to customize your Steam installation or its not default, you can set `STEAM_COMPAT_CLIENT_INSTALL_PATH` which is the default variable that proton uses to detect for the Steam installation. I've also did a alias for that variable called `_STEAM_PATH`, but `STEAM_COMPAT_CLIENT_INSTALL_PATH` always has preference.

```bash
env _STEAM_PATH="/your/steam/installation" protonlaunch your-program
```

If Steam is not found you'll receive a `Unable to find Steam path, please set _STEAM_PATH` error.

## Can I redistribute this script / license information

**YES**, Protonlaunch is distributed under the BSD-Three Clause license which allows the follow rights:

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
