./scripts/feeds update -a
#./scripts/feeds install -a

rm -rf ./fail/*
date_now=$(date "+%F-%H-%M-%S")

for f in `find . -maxdepth 1 -name "*.defconfig"` 
do 
   #make clean
   echo $f
   cp $f defconfig
   cat defconfig > .config
   make defconfig
   make download -j8
   make -j$(nproc) || make -j1 V=s > ./fail/$f.fail
done ;

sudo aliyunpan login -RefreshToken=#####################
sudo aliyunpan upload ./bin/targets /$date_now