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
New-Item -ItemType SymbolicLink -Path $HOME\_vimrc -Target $HOME\vimfiles\vimrc
```

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

Set the custom $VIMHOME environment variable to the user's $MYVIMDIR

```bash
me=$(whoami); sudo sed -i "s|let \$VIMHOME = \$MYVIMDIR|let \$VIMHOME = \"/home/${me}/.vim\"|g" /root/.vimrc
```

Then install vim-plug as root

```bash
sudo curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
