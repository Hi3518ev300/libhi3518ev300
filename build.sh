cd common
arm-himix100-linux-gcc -c *.c -I./ -I../include -I../adp/ -DSENSOR0_TYPE=SONY_IMX327_2L_MIPI_2M_30FPS_12BIT
cd ..

arm-himix100-linux-gcc sample_venc.c -o sample_venc common/*.o ./libhi3518ev300.a -I./include -I./common -Dhi3516ev200 -DHI_XXXX -lpthread -lm -ldl -DISP_V2  -lstdc++ -DSENSOR0_TYPE=SONY_IMX327_2L_MIPI_2M_30FPS_12BIT -DHI_ACODEC_TYPE_INNER -DHI_VQE_USE_STATIC_MODULE_REGISTER -DHI_AAC_USE_STATIC_MODULE_REGISTER -DHI_AAC_HAVE_SBR_LIB -ffunction-sections -Wl,-gc-sections


#-ffunction-sections -Wl,-gc-sections 这两个可以减少编译出来的程序的大小，参考HiMPP V4.0 媒体处理软件FAQ.pdf
#相对于 -Wall -g 
