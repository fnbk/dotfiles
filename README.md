# Dotfiles

## build all
```
make
```

## build individually
```
make vim
make zsh
make git
```

# useful libraries

## vcprompt
```
git clone git@github.com:fnbk/vcpromt.git
./autogen.sh
./configure
make
sudo make install
```

## pwgen
```
git clone git@github.com:fnbk/pwgen.git
cd pwgen
make
sudo make install
```

## macports
```
curl -O  https://distfiles.macports.org/MacPorts/MacPorts-2.3.1.tar.bz2
mkdir macports
tar xf MacPorts-2.3.1.tar.bz2 --strip-components=1 -C macports
cd macports
./configure --prefix=/opt/macports --with-applications-dir=/Applications/MacPorts
make
sudo make install
```

## homebrew
```
sudo git clone https://github.com/Homebrew/homebrew.git /opt/homebrew
```
