# Installation instructions

## Clone to ~/.vim

Linux:
```bash
git clone git@github.com:jclsn/vimconfig.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

Windows:
```powershell
git clone git@github.com:jclsn/vimconfig.git $HOME\vimfiles
```

Vim reads `~/vimfiles/vimrc` by itself. Make sure there is no `~/_vimrc`, it
takes precedence.

## Install vim-plug

Linux:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows:
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

## Sharing config and plugins with the root user

Copy `.vimrc` to `/root/.vimrc` and create undodir

```bash
sudo cp ~/.vim/vimrc /root/.vimrc
sudo mkdir -p /root/.vim/undodir
```

A copied vimrc falls back to `/home/jan/.vim`. Point it to your own config

```bash
me=$(whoami); sudo sed -i "s|'/home/jan/.vim'|'/home/${me}/.vim'|" /root/.vimrc
```

Then install vim-plug as root

```bash
sudo curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
