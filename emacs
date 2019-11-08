sudo yum install gcc make ncurses-devel giflib-devel libjpeg-devel libtiff-devel
wget wget http://ftp.gnu.org/gnu/emacs/emacs-26.1.tar.gz
tar -xzvf emacs* && cd emacs*
./configure  --without-selinux
make && sudo make install
emacs --version
