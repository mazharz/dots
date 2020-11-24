killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar top_bar &
done

echo "Launched the fuck out of the bars!!!"
