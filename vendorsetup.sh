platform=p
for combo in $(curl -s https://raw.githubusercontent.com/AltairROM-Devices/devices/master/$platform/build-targets | sed -e 's/#.*$//' | grep $platform | awk '{printf "altair_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
