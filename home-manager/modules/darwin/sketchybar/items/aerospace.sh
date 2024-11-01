sketchybar --add event aerospace_workspace_change

for sid in $(/opt/homebrew/bin/aerospace list-workspaces --monitor focused --empty no); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label="$sid" \
        click_script="/opt/homebrew/bin/aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done
