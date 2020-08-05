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
arm-himix100-linux-ar cr ../libhi3518ev300.a *.o
cd ..
rm -rf tmp
