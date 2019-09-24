# Install erlang

## ubuntu install erlang

### install

```
sudo apt-get install autoconf libncurses-dev build-essential m4 unixodbc-dev libssl-dev  libwxgtk3.0-dev libglu-dev  fop xsltproc g++  default-jdk  libxml2-utils

wget http://erlang.org/download/otp_src_21.3.tar.gz

cd otp_src_21.3

export ERL_TOP=`pwd`

./configure  --prefix=/home/memacs/opt/erlang2103 [ options ]

make

make install
```

### change the env

```
ERLANGPATH=/home/memacs/opt/erlang2103
PATH=$PATH:$HOME/bin:$ERLANGPATH/bin
```
