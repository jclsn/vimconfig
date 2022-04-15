# Installation instructions

## Clone to .vim

```bash
git clone git@github.com:jclsn/vimconfig.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
```

## Install vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## As root user

Copy `.vimrc` to `/root/.vimrc`

```bash
sudo cp ~/.vim/.vimrc /root/.vimrc
```

and explicitly add the user directory path (exchange **_user_** with you username)

```bash
sudo sed -e 's|~|/home/user|g' /root/.vimrc
```

Then install vim-plug as root:

```bash
sudo su
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
