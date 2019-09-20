# Install erlang

## ubuntu install erlang

### install

```
sudo apt-get install autoconf libncurses-dev build-essential m4 unixodbc-dev libssl-dev  libwxgtk3.0-dev libglu-dev  fop xsltproc g++  default-jdk  libxml2-utils

wget http://erlang.org/download/otp_src_19.0.tar.gz

cd otp_src_19.0

export ERL_TOP=`pwd`

./configure [ options ]

make

make install
```

### change the env

```
ERLANGPATH=$PREFIX/erlang2103
PATH=$PATH:$HOME/bin:$ERLANGPATH/bin
```
