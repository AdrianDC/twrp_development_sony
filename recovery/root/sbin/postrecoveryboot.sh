#!/sbin/sh

# Clearpad touchscreen software reset on recovery boot
echo 'RS' > /sys/kernel/debug/clearpad/hwtest;
