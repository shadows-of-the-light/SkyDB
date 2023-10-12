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

If you are only curious about one update and what's changed, you can compare a game version to a previous one. Link and guide will be added here.

## Beta channel where?

We don't have access to beta on PC yet and if we did, I don't have access to Sky beta on any platform. If we get beta channel for PC and someone with access wants to help, create an issue so we can talk about it.
