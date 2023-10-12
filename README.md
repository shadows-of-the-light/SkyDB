# SkyDB

SkyDB's goal is to keep track of changes in the game and find new things in it. Upcoming features, easter-eggs and interesting details.

For example during the PC demo we discovered that controls remapping and more graphics settings are coming to Sky.

## Game updates

When the game receives an update on Steam, I update this repo with the new game files. This process is not automatic, but I'll try to act fast. Just keep in mind that this repository can update days after the game's been updated! A commit that contains a game update should be named like this:

```
GAME UPDATE 0.23.0 233213
```

`0.23.0` is the version and `233213` is the build number. These values should match with the [AppInfo.tgc file](./data/AppInfo.tgc) located in the game.

This repository doesn't contain all game files. There are some unreadable and rarely changing files which I decided to ignore. See [.gitignore](./.gitignore) for more details.

## Resource exploration

If you want to find cool things, but don't know where to start, I recommend the [localization files](./data/Strings/Base.lproj/Localizable.strings). Those are readable and contain a lot of interesting stuff.

If you are only curious about one update and what's changed, you can compare a game version to a previous one. Go to [commits](https://github.com/CsakiTheOne/SkyDB/commits/main/) and select a commit that reads like a game update commit mentioned above. You will see all files that changed compared to the previous version.

## Beta channel where?

We don't have access to beta on PC yet and if we did, I don't have access to Sky beta on any platform. If we get beta channel for PC and someone with access wants to help, create an issue so we can talk about it.

## General technical information about Sky

[Sky: Children of the Light](https://www.thatskygame.com/) from [<img src="https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/ThatGameCompany_Logo.png/220px-ThatGameCompany_Logo.png" width="16px"> thatgamecompany](https://thatgamecompany.com/) is made using a modified version of [PhyreEngine](https://en.wikipedia.org/wiki/PhyreEngine).

> PhyreEngine is a license-only free to use game engine from Sony Interactive Entertainment, compatible with PlayStation 5, PlayStation 4, PlayStation 3, PlayStation VR, PlayStation Vita, PlayStation Portable, Nintendo Switch, Microsoft Windows (for OpenGL and DirectX 11), Google Android and Apple iOS.
>
> -- [Wikipedia](https://en.wikipedia.org/wiki/PhyreEngine)

The rendering engine was made in-house by TGC.

> They were constantly refining the game’s look and feel, including developing a custom Metal engine to render Sky’s ethereal scenes (...)
>
> -- [An interview with Jenova Chen](https://developer.apple.com/news/?id=zm47it7t)

## Contributing

### Sky Beta

If Sky Beta comes to PC, we need someone with access to provide the beta game files here. If you have access, [create an issue](https://github.com/CsakiTheOne/SkyDB/issues/new/choose).

### Tools

Some files are not readable. If you figure out how does a file format work, [fork the repo](https://github.com/CsakiTheOne/SkyDB/fork), put every detail in the [tools folder](./tools/) and [create a pull request](https://github.com/CsakiTheOne/SkyDB/pulls).

- [tools](./tools/)
  - [topic's folder, for example textures]
    - README.md
      - which software is used to make that file
      - links to useful resources
      - how to open / view a file
      - how to edit a file
      - etc.
    - [example files to test on]
    - [self-made small executables]

Don't put whole programs in the tools folder! It's enough to put a link of the software in that topic's `README.md` file.
