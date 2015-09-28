((sleep .4;wmctrl -r TeaTimer -R TeaTimer -e 0,50,20,-1,-1)
for (a="$LIMIT"; a > 0; a--); do
# for loop generates text, not shown
done
wmctrl -R TeaTimer
) | zenity --progress --title="TeaTimer" --percentage=0A
