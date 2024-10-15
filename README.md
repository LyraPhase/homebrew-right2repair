<!-- markdownlint-configure-file
{
  "required-headings": {
    "headings": [
      "# Lyraphase Right2Repair Casks & Formulae",
      "*",
      "## How do I install these formulae?",
      "*",
      "## Documentation",
      "*",
      "## Installation",
      "*",
      "## Usage",
      "*",
      "### Casks",
      "*",
      "### Formula",
      "*",
      "### Upgrading",
      "*",
      "## Sponsor",
      "*",
      "## Development",
      "*",
      "## Testing",
      "*",
      "# Author(s) / Credits",
      "*"
    ]
  }
}
-->

# Lyraphase Right2Repair Casks & Formulae

[![ci](https://github.com/LyraPhase/homebrew-right2repair/actions/workflows/ci.yml/badge.svg)](https://github.com/LyraPhase/homebrew-right2repair/actions/workflows/ci.yml)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://github.com/LyraPhase/homebrew-right2repair/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/LyraPhase/homebrew-right2repair/actions/workflows/pre-commit.yml)
[![Donate using Liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/trinitronx/donate)

<!-- markdownlint-disable MD012 MD033  -->
<kbd>[<img alt="Donate using GitHub Sponsors" src="./assets/heart-24.svg"](https://github.com/sponsors/trinitronx)></kbd>
<span style="color:#c96198" />[![Donate using GitHub Sponsors](./assets/heart-24.svg)](https://github.com/sponsors/trinitronx)</span>

<span style="color:#c96198" />[![Donate using GitHub Sponsors](./assets/heart-24.svg)](https://github.com/sponsors/trinitronx)</span>
<!-- markdownlint-enable MD012 MD033  -->

A collection of Homebrew Casks & Formulae for old or unsupported macOS
(Currently just Monterey).

The idea behind this Tap is to provide installers for some tools or old
abandonware.
Whether through forked maintained alternative versions of those tools, or by
providing a version-pinned old installer.

Think of this like the "Island of Misfit Toys" for macOS software that has been
made hard to install by Apple's [Planned Obsolescence][planned-obsolescence],
Homebrew maintainer's over-eager deprecations, community abandonment the
[Hype Cycle's][hype-cycle] "_Trough of Disillusionment_", and other such
emergent scenarios from community behaviors.

## How do I install these formulae?

`brew install lyraphase/right2repair/<cask>`

Or `brew tap lyraphase/right2repair` and then `brew install --cask <cask>`
or `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Installation

First, make sure you have installed [`homebrew`](https://brew.sh) and
[`homebrew-cask`](http://caskroom.io/) if you haven't yet.

Then, run the following in your command-line:

    brew tap lyraphase/right2repair

## Usage

**Note**: For info run:

    brew info --cask <cask>

Once the tap is installed, you can install the Casks!

    brew install --cask <cask>

To uninstall run:

    brew uninstall --cask <cask>

### Casks

Casks included in this Tap:

- [`vmware-fusion@13.5.2`][vmware-fusion] - The last version of VMWare Fusion
  Pro that works on macOS Monterey. [Free for personal use][vmware-fusion-free].

### Formula

- [`rancher-machine`][rancher-machine] - A maintained fork of `docker-machine`

### Upgrading

This Homebrew Tap contains some Casks that can not be auto-upgraded, and some
that can.

Below are some helpful commands for upgrading.

To view all outdated Casks on your system, run:

    brew outdated --cask --greedy

To check if a single Cask is outdated, (e.g.: `rancher-machine`):

    brew outdated --greedy rancher-machine

To upgrade a single Cask (e.g.: `rancher-machine`):

    brew upgrade --greedy rancher-machine

To upgrade an `installer manual` Cask (e.g.: `soundid-reference`):

    brew reinstall  --cask soundid-reference

To upgrade all outdated Casks on your system, run:

    brew outdated --cask  --quiet --greedy | xargs brew upgrade --cask

## Sponsor

If you find this project useful and appreciate my work,
would you be willing to click one of the buttons below to Sponsor this project
and help me continue?

<!-- markdownlint-disable MD013 MD033  -->
| Method       | Button                                                                                                                               |
| :----------- | :----------------------------------------------------------------------------------------------------------------------------------: |
| GitHub       | [💖 Sponsor](https://github.com/sponsors/trinitronx)                                                                                 |
| Liberapay    | [![Support with Liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/trinitronx/donate)                |
| PayPal       | [![Support with PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/JamesCuzella)              |
| Ko-Fi        | [![Support with Ko-Fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/trinitronx)                                     |
| BuyMeACoffee | [<img alt="Buy Me A Coffee" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="51px" width="180px" />](https://www.buymeacoffee.com/TrinitronX) |
| Polar        | [![Support with Polar](https://polar.sh/embed/seeks-funding-shield.svg?org=lyraphase)](https://polar.sh/lyraphase)                   |
| Patreon <sup>(_my artist page_)</sup> | [![Support with Patreon](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fshieldsio-patreon.vercel.app%2Fapi%3Fusername%3Dphasik%26type%3Dpatrons&style=for-the-badge)](https://www.patreon.com/bePatron?u=16585899)                                     |
<!-- markdownlint-enable MD013 MD033  -->

Every little bit is appreciated! Thank you! 🙏

## Development

If you wish to contribute to this Tap, there is a helper `Makefile` with some
useful targets.

To checkout this repo and install in development mode:

    git clone https://github.com/LyraPhase/homebrew-right2repair.git
    cd homebrew-right2repair
    make install

This will install a symbolic link to this git repo under:

    $(brew --repo)/Library/Taps/LyraPhase/homebrew-right2repair

Then, you may edit and test the Homebrew Cask recipe from the cloned git repo
file location.

## Testing

To test:

    make test

# Author(s) / Credits

Author:: James Cuzella ([@trinitronx][keybase-id])

# License

Copyright (C) © 🄯  2022-2024 James Cuzella

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

[keybase-id]: https://gist.github.com/trinitronx/aee110cbdf55e67185dc44272784e694
[vmware-fusion]: https://docs.vmware.com/en/VMware-Fusion/13.5.2/rn/vmware-fusion-1352-release-notes/index.html
[vmware-fusion-free]: https://blogs.vmware.com/teamfusion/2020/08/announcing-fusion-12-and-workstation-16.html
[rancher-machine]: https://github.com/rancher/machine
[planned-obsolescence]: https://en.wikipedia.org/wiki/Planned_obsolescence
[hype-cycle]: https://en.wikipedia.org/wiki/Gartner_hype_cycle
