#! /bin/sh

vol="$(wpctl get-volume  @DEFAULT_AUDIO_SINK@)"

[ "$vol" != "${vol%\[MUTED\]}" ] && echo MUT && exit

vol="${vol#VOL: }"

split() {
	IFS=$2
	set -- $1
	printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
	$((vol >= 1)) ) icon="VOL" ;;
	* ) echo MUT && exit ;;
esac

echo "$status$vol%"
