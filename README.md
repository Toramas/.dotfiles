#.dotfiles

##What's inside?

This repo contains config files for:
* [neovim](https://github.com/neovim/neovim)
* [vscode](https://github.com/microsoft/vscode)
* [zsh](https://www.zsh.org/) and [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

##Preriquisites

Set zsh as your default shell:
```sh
chsh -s $(which zsh)
```

Install [GNU Stow](https://www.gnu.org/software/stow/) to manage the symlinks:
```sh
sudo apt install stow
```

##Installation

**Warning:** If you want to try these dotfiles, you should fork this repository, review the configs and remove what you don't need. I am not responsible if one of my dotfile causes unwanted behavior in your apps or clash with your own config.

First, clone and move inside the repository:
```sh
git clone https://github.com/Toramas/.dotfiles.git
cd .dotfiles
```
Then, use `stow` in order to generate the symlinks of all the files in the repo:
```sh
stow *
```
Alternatively, if you want to generate the symlinks of a specific app, use the folder of the app as argument. For exemple:
```sh
stow zsh
```

##Update

###Modify an already existing file
If you have already used `stow` on the folder containing the file, then your updates are already taken into account. Otherwise, use `stow` on the folder of the app as stated in the [installation](#installation) section.

###Add a new file to an existing app
Create or move the file in the folder of the corresponding `app` reproducing the same path from the `home` directory.
Exemple of moving the file (`app` is the folder the app in the repo):
```sh
mv $HOME/path/to/file /path/to/.dotfiles/app/path/to/file
```
Then, move to the root of the repo and use stow to generate the symlink of the new file:
```sh
cd /path/to/.dotfiles
stow app
```

###Add the dotfiles of a new app to the repo
Create a folder named after the `app` in the root of the repo. Move the config files of the `app` in the new folder reproducing the path from the `home` directory.
For exemple (`app` is the newly created folder):
```sh
mv $HOME/.config/application/file /path/to/.dotfiles/app/.config/application/file
or
mv $HOME/file /path/to/.dotfiles/app/file
```
Then, move to the root of the repo and use stow to generate the symlinks of the moved files:
```sh
cd /path/to/.dotfiles
stow app
```