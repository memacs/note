# Install erlang

## ubuntu install erlang

### install

```
sudo apt-get install autoconf libncurses-dev build-essential m4 unixodbc-dev libssl-dev  libwxgtk3.0-dev libglu-dev  fop xsltproc g++  default-jdk  libxml2-utils  libyaml-dev


## ubuntu install erlang 1903
===================================
wget https://www.openssl.org/source/openssl-1.0.2l.tar.gz
tar -zxvf openssl-1.0.2l.tar.gz 
openssl-1.0.2l/
./config --prefix=/home/memacs/opt/openssl1.0.2l

config之后，会生成Makefile，打开Makefile找到gcc，在CFLAG参数列表里加上-fPIC

vim Makefile
CC= gcc
CFLAG= -fPIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -Wa,--noexecstack -m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM

make install
===================================

wget http://erlang.org/download/otp_src_21.3.tar.gz

cd otp_src_21.3

export ERL_TOP=`pwd`

./configure  --prefix=/home/memacs/opt/erlang2103 [--with-ssl=/home/memacs/opt/openssl1.0.2l/] [ options ]

make

make install
```

### change the env

```
ERLANGPATH=/home/memacs/opt/erlang2103
PATH=$PATH:$HOME/bin:$ERLANGPATH/bin
```

### 备注
```
由于erlang1903不支持大于1.0版本的openssl(https://github.com/kerl/kerl/issues/226)，所以要特殊处理
```
