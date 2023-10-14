# 💾 SkyDB

SkyDB's goal is to keep track of changes in the game and find new things in it. Upcoming features, easter-eggs and interesting details. This repository is not affiliated with [<img src="https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/ThatGameCompany_Logo.png/220px-ThatGameCompany_Logo.png" width="16px"> thatgamecompany](https://thatgamecompany.com/). This is a fan project.

## 🔎 Findings

We put findings in the [findings](./findings) folder. Each update has its own file. If you want to contribute, please read the [contributing](#❤-contributing) section.

### ℹ Where to start exploring?

I recommend starting with checking previous findings in the [findings](./findings) folder. If you want to explore the game files, start with the [localization files](./data/Strings/Base.lproj/Localizable.strings). They are easily readable and contain a lot of interesting strings.

If you are familiar with GitHub or this repository, you can help us finding new things by checking [commits](https://github.com/CsakiTheOne/SkyDB/commits/main/) and selecting a commit that contains a game update. These commits are named like this:

```
GAME UPDATE 0.23.0 233213
```

`0.23.0` is the version and `233213` is the build number. These values should match with the [AppInfo.tgc file](./data/AppInfo.tgc) located in the game. If you found something interesting that you want to share, read the [contributing](#❤-contributing) section.

## 🔁 Game and repository updates

When the game receives an update on Steam, I update this repo with the new game files. This process is not automatic, but I'll try to act fast. Just keep in mind that this repository can update days after the game's been updated!

This repository doesn't contain all game files. There are some unreadable, large and rarely changing files which I decided to ignore. See [.gitignore](./.gitignore) for more details. I may change this in the future.

## ❤ Contributing

### ✨ Share your findings

If you find something interesting in the game, please share it with us! You can do this by [creating an issue](https://github.com/CsakiTheOne/SkyDB/issues/new/choose) with the `finding` label or if you are familiar with GitHub, [create a pull request](https://github.com/CsakiTheOne/SkyDB/pulls) with your changes.

In case of a pull request, please make sure that you are not changing any other files outside of the `findings` folder.

### 🛠 Sky Beta

If Sky Beta comes to PC, we need someone with access to provide the beta game files here. If you have access, [create an issue](https://github.com/CsakiTheOne/SkyDB/issues/new/choose) with the `sky-beta` label so we can talk about it.

### 🛑 Unreadable resources

There are unreadable files in the game, for example models, the executable, FMOD banks, etc. Plase do not try to decompile or disassemble these since it's against [TGC's ToS](https://thatgamecompany.helpshift.com/hc/en/17-sky-children-of-the-light/faq/460-eula-terms-of-service/)!

## 👨‍💻 General technical information about Sky

[Sky: Children of the Light](https://www.thatskygame.com/) from [<img src="https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/ThatGameCompany_Logo.png/220px-ThatGameCompany_Logo.png" width="16px"> thatgamecompany](https://thatgamecompany.com/) is made using a modified version of [PhyreEngine](https://en.wikipedia.org/wiki/PhyreEngine).

> PhyreEngine is a license-only free to use game engine from Sony Interactive Entertainment, compatible with PlayStation 5, PlayStation 4, PlayStation 3, PlayStation VR, PlayStation Vita, PlayStation Portable, Nintendo Switch, Microsoft Windows (for OpenGL and DirectX 11), Google Android and Apple iOS.
>
> -- [Wikipedia](https://en.wikipedia.org/wiki/PhyreEngine)

The rendering engine was made in-house by TGC using [Metal](https://developer.apple.com/metal/) on iOS and probably something else on other platforms.

> They were constantly refining the game’s look and feel, including developing a custom Metal engine to render Sky’s ethereal scenes (...)
>
> -- [An interview with Jenova Chen](https://developer.apple.com/news/?id=zm47it7t)
