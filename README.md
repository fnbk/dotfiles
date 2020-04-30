# Dotfiles

## build all
```
make
```

## build individually
```
make nvim
make fish
make git
```

# useful libraries

## vcprompt
```
git clone git@bitbucket.org:fnbk/vcpromt.git
make
sudo make install
```

## pwgen
```
git clone git@bitbucket.org:fnbk/pwgen.git
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


# Windows Setup

**Notepad++**
https://github.com/pnedev/compare-plugin
