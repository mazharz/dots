killall -q polybar

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#	MONITOR=$m polybar bar_top &
#	MONITOR=$m polybar bar_bottom &
#done
polybar bar_top &
polybar bar_bottom &

echo "Launched the fuck out of the bars!!!"
