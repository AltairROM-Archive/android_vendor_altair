platform=mm
for combo in $(curl -s https://raw.githubusercontent.com/Altair-Devices/devices/master/$platform/build-targets | sed -e 's/#.*$//' | grep $platform | awk '{printf "altair_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
