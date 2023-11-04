#!/bin/bash

# When starting the rofi, it automatically changes the language to English
xkb-switch -s us &

# rofi_command='rofi -m -1' # Use this var if your rofi doesn't have a theme
rofi_command='rofi -m -1 -theme themes/code.rasi'

# Enter the path to the `workspaces.json`
data="/home/inauris/.config/rofi/data/workspaces.json"


all_sessions="$(jq -r '.[].session_name' "$data")"
selected_session="$(echo -e "$all_sessions" | $rofi_command -p "tmuxwm" -dmenu)"

[[ -z "$selected_session" ]] && exit 1

session_exist=$(tmux list-sessions | grep $selected_session)
if [ "$session_exist" = "" ]
then
  directory=$(jq -r ".[] | select(.session_name==\"$selected_session\") .directory" "$data")
  windows=$(jq -r ".[] | select(.session_name==\"$selected_session\") .windows" "$data")

  # Создание сессии
  if tmux new-session -d -s $selected_session -c $directory
  then
    window_number=1
    for window in $(echo "${windows}" | jq -r '.[] | @base64'); do
      # Открытие нового окна
      window_name=$(echo "${window}" | base64 --decode | jq -r ".window_name")
      if [ $window_number == 1 ]
      then
          tmux rename-window -t $selected_session:$window_number $window_name
      else
          tmux new-window -t $selected_session:$window_number -n $window_name -c $directory
      fi

      # Выполнение команд через "send-keys"
      commands=$(echo "${window}" | base64 --decode | jq -r ".commands")
      for row in $(echo "${commands}" | jq -r '.[] | @base64'); do
        command=$(echo "${row}" | base64 --decode)
        tmux send-keys -t $selected_session:$window_number "$command" C-m
      done

      ((window_number++))
    done
  else
    notify-send "Failed to create a tmux session"
    exit 1
  fi
fi

alacritty -e tmux attach -t $selected_session &
tmux select-window -t $selected_session:1
