## Orbstation Codebase
[![Build Status](https://github.com/lizardqueenlexi/orbstation/workflows/CI%20Suite/badge.svg?branch=orbstation)](https://github.com/lizardqueenlexi/orbstation/actions?query=workflow%3A%22CI+Suite%22)
[![Percentage of issues still open](https://isitmaintained.com/badge/open/lizardqueenlexi/orbstation.svg)](https://isitmaintained.com/project/lizardqueenlexi/orbstation "Percentage of issues still open")
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/lizardqueenlexi/orbstation.svg)](https://isitmaintained.com/projectlizardqueenlexi/orbstation "Average time to resolve an issue")
![Coverage](https://img.shields.io/badge/coverage---3%25-red.svg)

[![built by furries](orbstation/readme-assets/built-by-furries.svg)](https://twitter.com/cathodegaytube/status/1197227512075411456) [![contains bad ideas](orbstation/readme-assets/contains-bad-ideas.svg)](https://imgs.xkcd.com/comics/good_code.png) [![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

This is the codebase for the Orbstation fork of the tgstation build of SpaceStation 13.

Orbstation is focused around removing the more unpleasant/bigoted flavor of tgstation, improving support/balancing for small servers, and adding fun mechanics and additions that would likely not be approved upstream.

## How to play

Orbstation is primarily run on a single, private BYOND server. Instructions for joining and announcements of upcoming sessions are posted on the Orbstation Discord server, which is currently invite-only.

## How to contribute

1. Make a **fork** of the `orbstation/orbstation` branch under your own github account to keep your changes in.

    * If you plan on working on multiple discrete changes at once (say, adding a new item, rebalancing a weapon, and modifying some flavor text), make a separate **branch** on your fork for each separate change — this makes it easier to make separate pull requests later on.

2. **Download** your fork to your computer using your Git manager of choice. For those new to Git, [Github Desktop](https://desktop.github.com/) is free and easy to use.

3. **Make your changes** using an IDE of your choice.

    * [VSCode](https://code.visualstudio.com/) with the [BYOND support extension](https://marketplace.visualstudio.com/items?itemName=ss13.byond) is highly recommended, as it features code completion and a shortcut (f5) to compile, run, and connect to a server. No more messing around with DreamDaemon!

    * If possible (usually when adding new features instead of removing or modifying existing ones), place modifications in the **Orbstation folder**. This keeps features unique to Orbstation organized and helps to prevent future merge conflicts.

4. Submit a **pull request** from your local fork or branch to the `orbstation/orbstation` branch. 

Please note that `orbstation/master` is a copy of the `tgstation/master` branch from upstream, and is used primarily to help with merging things from upstream to Orbstation. If you want to submit a change to the upstream Tgstation repo, send a pull request to `tgstation/master`, not `orbstation/master`.

---

## /tg/station codebase

[![Build Status](https://github.com/tgstation/tgstation/workflows/CI%20Suite/badge.svg)](https://github.com/tgstation/tgstation/actions?query=workflow%3A%22CI+Suite%22)
[![Percentage of issues still open](https://isitmaintained.com/badge/open/tgstation/tgstation.svg)](https://isitmaintained.com/project/tgstation/tgstation "Percentage of issues still open")
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/tgstation/tgstation.svg)](https://isitmaintained.com/project/tgstation/tgstation "Average time to resolve an issue")
![Coverage](https://img.shields.io/badge/coverage---3%25-red.svg)

[![resentment](https://forthebadge.com/images/badges/built-with-resentment.svg)](https://www.monkeyuser.com/assets/images/2019/131-bug-free.png) [![resentment](https://forthebadge.com/images/badges/contains-technical-debt.svg)](https://user-images.githubusercontent.com/8171642/50290880-ffef5500-043a-11e9-8270-a2e5b697c86c.png) [![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

* **Website:** https://www.tgstation13.org
* **Code:** https://github.com/tgstation/tgstation
* **Wiki:** https://tgstation13.org/wiki/Main_Page
* **Codedocs:** https://codedocs.tgstation13.org/
* **/tg/station Discord:** https://tgstation13.org/phpBB/viewforum.php?f=60
* **Coderbus Discord:** https://discord.gg/Vh8TJp9

This is the codebase for the /tg/station flavoured fork of SpaceStation 13.

Space Station 13 is a paranoia-laden round-based roleplaying game set against the backdrop of a nonsensical, metal death trap masquerading as a space station, with charming spritework designed to represent the sci-fi setting and its dangerous undertones. Have fun, and survive!

## DOWNLOADING
[Downloading](.github/guides/DOWNLOADING.md)

[Running on the server](.github/guides/RUNNING_A_SERVER.md)

[Maps and Away Missions](.github/guides/MAPS_AND_AWAY_MISSIONS.md)

## :exclamation: How to compile :exclamation:

On **2021-01-04** we have changed the way to compile the codebase.

**The quick way**. Find `bin/server.cmd` in this folder and double click it to automatically build and host the server on port 1337.

**The long way**. Find `bin/build.cmd` in this folder, and double click it to initiate the build. It consists of multiple steps and might take around 1-5 minutes to compile. If it closes, it means it has finished its job. You can then [setup the server](.github/guides/RUNNING_A_SERVER.md) normally by opening `tgstation.dmb` in DreamDaemon.

**Building tgstation in DreamMaker directly is now deprecated and might produce errors**, such as `'tgui.bundle.js': cannot find file`.

**[How to compile in VSCode and other build options](tools/build/README.md).**

## Contributors
[Guides for Contributors](.github/CONTRIBUTING.md)

[/tg/station HACKMD account](https://hackmd.io/@tgstation) - Design documentation here

[Interested in some starting lore?](https://github.com/tgstation/common_core)

## LICENSE

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.html).

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See LICENSE and GPLv3.txt for more details.

The TGS DMAPI API is licensed as a subproject under the MIT license.

See the footer of [code/__DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

All assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
