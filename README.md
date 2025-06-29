# Installation instructions

## Clone to .vim

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

## As root user

Copy `.vimrc` to `/root/.vimrc`

```bash
sudo cp ~/.vim/vimrc /root/.vimrc
```

and explicitly add the user directory path (exchange **_user_** with you username)

```bash
sudo sed -i 's|~|/home/user|g' /root/.vimrc
```

Then install vim-plug as root:

```bash
sudo su
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
