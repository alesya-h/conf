# Critical battery level (acpi reports it at 5%)
CRITICAL=10

battery_level=`acpi -b | grep -o [1-9]*% | sed s/%//`
if [ ! $battery_level ]
then
   exit
fi
if [ $battery_level -le $CRITICAL ]
then
   if acpi -a | grep 'off-line'
   then
      # battery level is critical, lets hibernate
      su -c "notify-send -u critical -t 25000 'Critical battery level!' 'Sleep in 30 seconds'" me
      sleep 30s
      pm-suspend
   fi
fi 

