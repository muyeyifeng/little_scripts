./scripts/feeds update -a
#./scripts/feeds install -a

for f in `find . -maxdepth 1 -name "*.defconfig"` 
do 
   echo $f
   cp $f defconfig
   cat defconfig > .config
   #make download -j8
   make defconfig
   make menuconfig
   ./scripts/diffconfig.sh > $f
done;
