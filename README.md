# vice-lambda-from-template
VICE x128 Lambda source files from the [Unnecessary Computer Things video](https://youtu.be/DWFj7zqdPJo)

# notes on how to package runtime

```
sudo yum update
sudo yum install links -y
# retrieve tarball via `links https://vice-emu.sourceforge.io`
tar zxvf vice-3.5.tar.gz
sudo yum install -y gcc gcc-c++ flex bison dos2unix libpng-devel.x86_64 # because pkgconfig won't find libpng
links https://www.floodgap.com/retrotech/xa/
# download xa-2.3.11.tar.gz
tar zxvf xa-2.3.11.tar.gz
cd xa-2.3.11
make
PATH=~/xa-2.3.11:$PATH
# sudo yum install text2dvi
sudo yum install Xfvb # probably not necessary
sudo yum install libX11-devel.x86_64
# ( may need a different option than headlessui )
./configure --disable-pdf-docs --enable-headlessui --without-pulse --without-alsa
make

mkdir vice-package
cd vice-package
cp ../vice-3.5/data/C128/* .
cp ../vice-3.5/src/x128 .

cd ~
tar cvf vice-package.tar
gzip vice-package.tar
```

`scp` to your local machine

`scp ec2-user@54.166.33.232:/usr/lib64/libpng\*.scp .` 

`zip vice128lambda.zip bootstrap run128.sh vice-package/* libpng*`

