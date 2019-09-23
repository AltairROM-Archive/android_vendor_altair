platform=p
for combo in $(curl -s https://raw.githubusercontent.com/AltairROM-Devices/devices/master/$platform/build-targets | sed -e 's/#.*$//' | grep $platform | awk '{printf "altair_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done

add_lunch_combo lineage_arm-userdebug
add_lunch_combo lineage_arm64-userdebug
add_lunch_combo lineage_x86-userdebug
add_lunch_combo lineage_x86_64-userdebug
