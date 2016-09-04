#!/sbin/sh

# This pulls the files out of /system that are needed for decrypt and module loading
# This allows us to decrypt the device in recovery and still be
# able to unmount /system when we are done.

# Mount system
mkdir -p /system;
umount -l /dev/block/bootdevice/by-name/system;
umount -l /system;
mount -t ext4 -o ro /dev/block/bootdevice/by-name/system /system;

# Copy proprietary binaries
mkdir -p /tmp/bin/;
cp /system/bin/linker64 /tmp/bin/linker64;
cp /system/bin/qseecomd /sbin/qseecomd;

# Copy proprietary libraries
mkdir -p /vendor/lib64/hw;
cp /system/vendor/lib64/hw/keystore.msm8996.so /vendor/lib64/hw/keystore.msm8996.so;
cp /system/vendor/lib64/lib-sec-disp.so /vendor/lib64/lib-sec-disp.so;
cp /system/vendor/lib64/libGPreqcancel.so /vendor/lib64/libGPreqcancel.so;
cp /system/vendor/lib64/libGPreqcancel_svc.so /vendor/lib64/libGPreqcancel_svc.so;
cp /system/vendor/lib64/libQSEEComAPI.so /vendor/lib64/libQSEEComAPI.so;
cp /system/vendor/lib64/libStDrvInt.so /vendor/lib64/libStDrvInt.so;
cp /system/vendor/lib64/libdiag.so /vendor/lib64/libdiag.so;
cp /system/vendor/lib64/libdrmfs.so /vendor/lib64/libdrmfs.so;
cp /system/vendor/lib64/libdrmtime.so /vendor/lib64/libdrmtime.so;
cp /system/vendor/lib64/libqisl.so /vendor/lib64/libqisl.so;
cp /system/vendor/lib64/librpmb.so /vendor/lib64/librpmb.so;
cp /system/vendor/lib64/libsecureui.so /vendor/lib64/libsecureui.so;
cp /system/vendor/lib64/libsecureui_svcsock.so /vendor/lib64/libsecureui_svcsock.so;
cp /system/vendor/lib64/libssd.so /vendor/lib64/libssd.so;
cp /system/vendor/lib64/libtime_genoff.so /vendor/lib64/libtime_genoff.so;

# Release system
umount -l /dev/block/bootdevice/by-name/system;
umount -l /system;

# Copy decrypt system
mkdir -p /system/bin;
cp -r /tmp/bin/* /system/bin/;
chmod 755 /system/bin/*;
chown -R system:system /system/bin/*;
