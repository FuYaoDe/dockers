#!/bin/bash
android_arch=$ANDROID_ARCH
if [ -z "$android_arch" ]
then
    android_arch="arm"
fi

emulator64-${android_arch} -avd ${android_arch} -noaudio -no-window -gpu off -verbose -qemu -vnc :0 &
sleep 120
adb wait-for-device
adb install RMBridge_1.2.0.apk
sleep 60
adb shell am start -n de.fun2code.android.rmbridge/de.fun2code.android.rmbridge.RMBridgeActivity
sleep 10
adb shell input touchscreen tap 240 500
adb forward tcp:7474 tcp:7474

ip=$(ip addr list eth0|grep "inet "|cut -d' ' -f6|cut -d/ -f1)
redir --laddr=${ip} --caddr=127.0.0.1 &
redir --laddr=${ip} --lport=5555 --caddr=127.0.0.1 --cport=5555 &
redir --laddr=${ip} --lport=7474 --caddr=127.0.0.1 --cport=7474 &

while true; do sleep 1000; done
# Detect ip and forward ADB ports outside to outside interface
