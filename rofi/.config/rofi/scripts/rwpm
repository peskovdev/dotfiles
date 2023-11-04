#!/bin/bash

xkb-switch -s us &

rofi_command='rofi -m -1 -theme themes/wallpaper.rasi'

# Variable passed to rofi
options=(
    "advanced download"
    "download new"
    "select random from saved"
    "select last saved"
    "select previous"
    "save current wallpaper"
  )

chosen="$(printf '%s\n' "${options[@]}" | $rofi_command -p "rwpm" -dmenu -selected-row 1)"

if [ -n "$chosen" ]; then
    if [ "$(pgrep wallpaper | wc -l)" -gt 2 ]; then
        notify-send "Please wait"
        exit 1
    fi
fi


storage_dir="$HOME/Pictures"

atleast="3840x2160"

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
    -s | --storage-dir)
        storage_dir="$2"
        shift
        shift
        ;;
    -a | --atleast)
        atleast="$2"
        shift
        shift
        ;;
    *)
        shift
        ;;
    esac
done

wallpapers_dir="$storage_dir/wallpapers"

temp_wallpapers_dir="$wallpapers_dir/.temp_wallpapers"

# Wallpaper
wallpaper="$wallpapers_dir/wallpaper"
wallpaper_previous="$wallpapers_dir/wallpaper_previous"


clean_storage () {
  find "$temp_wallpapers_dir" -mtime +1 ! -samefile "$(readlink -f "$wallpaper")" ! -samefile "$(readlink -f "$wallpaper_previous")" -exec rm {} +
}
clean_storage

case $chosen in
"download new")
    img=$(swd -l "$temp_wallpapers_dir" -s views -a "$atleast")
    ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
    ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
    ;;
"advanced download")
    options=(
        "absolute random"
        "random from most viewed"
        "random from latest"
        "random from toplist"
        "random from favorites"
        "random and blurred"
      )
    chosen="$(printf '%s\n' "${options[@]}" | $rofi_command -p "select download option" -dmenu -selected-row 1)"
    if [ -n "$chosen" ]; then
        if [ "$(pgrep wallpaper | wc -l)" -gt 2 ]; then
            notify-send "Please wait"
            exit 1
        fi
    fi

    case $chosen in
    "absolute random")
        img=$(swd -l "$temp_wallpapers_dir" -a "$atleast" -p 000)
        ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
        ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
        ;;
    "random from most viewed")
        img=$(swd -l "$temp_wallpapers_dir" -s views -a "$atleast")
        ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
        ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
        ;;
    "random from latest")
        img=$(swd -l "$temp_wallpapers_dir" -s latest -a "$atleast")
        ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
        ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
        ;;
    "random from toplist")
        img=$(swd -l "$temp_wallpapers_dir" -s toplist -a "$atleast")
        ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
        ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
        ;;
    "random from favorites")
        img=$(swd -l "$temp_wallpapers_dir" -s favorites -a "$atleast")
        ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
        ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
        ;;
    "random and blurred")
        img=$(swd -l "$temp_wallpapers_dir")
        convert -blur 0x80 "$img" "$img"
        ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
        ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
        ;;
    esac
    ;;
"select random from saved")
    mapfile -t wallpapers < <(find "$wallpapers_dir" -maxdepth 1 -type f -regex ".*\.\(jpg\|gif\|png\|jpeg\)" ! -name "$(basename "$(readlink -f "$wallpaper")")")
    ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
    ln -sf "${wallpapers[$(("$RANDOM" % ${#wallpapers[@]}))]}" "$wallpaper"
    feh --bg-fill "$wallpaper" >/dev/null
    ;;
"select last saved")
    # Получаем последнего сохранненого изображения
    last_saved="$(ls "$wallpapers_dir" | tail -3 | head -n 1)"

    ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
    ln -sf "$wallpapers_dir/$last_saved" "$wallpaper"
    feh --bg-fill "$wallpaper" >/dev/null
    ;;
"select previous")
    # Получаем путь предыдущего изображения
    previous="$(readlink -f "$wallpaper_previous")"

    ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
    ln -sf "$previous" "$wallpaper"
    feh --bg-fill "$wallpaper" >/dev/null
    ;;
"save current wallpaper")
    # Получаем путь текущего изображения
    current_wallpaper="$(readlink -f "$wallpaper")"

    PATTERN="$wallpapers_dir/*${current_wallpaper##*/}"

    # Проверяем имеется ли такое изображение
    if compgen -G "$PATTERN" >/dev/null; then
        notify-send -u critical "Image already exists"
    else
        mkdir -p "$wallpapers_dir"

        # Name of image
        img="$(date +%y%m%d-%H%M%S)-${current_wallpaper##*/}"

        # Copy the wallpaper image to archive folder
        cp "$current_wallpaper" "$wallpapers_dir/$img"
        notify-send "$img saved"
    fi
    ;;
"")
    ;;
*)
    # here bag: chosen is able to contain 2+ words
    img=$(swd -l "$temp_wallpapers_dir" -q "$chosen" -a "$atleast")
    ln -sf $(readlink -f "$wallpaper") "$wallpaper_previous"
    ln -sf "$img" "$wallpaper" && feh --bg-fill "$wallpaper" >/dev/null
    ;;
esac
