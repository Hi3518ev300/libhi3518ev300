#build common
cd common
arm-himix100-linux-gcc -c *.c -I./ -I../include -I../adp/ -DSENSOR0_TYPE=SONY_IMX327_2L_MIPI_2M_30FPS_12BIT
cd ..
#build sample_venc
arm-himix100-linux-gcc -c sample_venc.c -I./common/ -I./include

rm -rf tmp
mkdir tmp
cp lib/*.a tmp/
cd tmp
ls *.a -1>all.tmp 
while read line
do
    	#echo $line
	arm-himix100-linux-ar x $line
done <all.tmp

cp ../common/*.o ./
mv ../sample_venc.o ./

arm-himix100-linux-ar cr ../libhisiv.a *.o
cd ..
rm -rf tmp

cp libhisiv.a ../rtsp/http-rtp/
