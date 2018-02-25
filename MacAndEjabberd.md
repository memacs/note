# erlang 安装

```
brew install erlang
./configure --prefix=xxx --with-ssl=/usr/local/opt/openssl
make
make install
```

# ejabberd 安装

```
brew install autoconf
brew install audomake
brew install libyaml

export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/lib"
export CFLAGS="-I/usr/local/opt/openssl/include/ -I/usr/local/include"
export CPPFLAGS="-I/usr/local/opt/openssl/include/ -I/usr/local/include"

./configure --prefix=xxxx
make
make install
```
