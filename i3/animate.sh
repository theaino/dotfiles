#!/usr/bin/env bash

LOCK_DIR="$HOME/.anim_wallpaper_lock"
PID_FILE="${LOCK_DIR}/anim_pid"

remove_lock() {
  rm $PID_FILE
  rmdir $LOCK_DIR
}

stop() {
  echo "Stopping wallpaper..."
  remove_lock
  exit #$
}

trap stop SIGINT

path=""
speed=1
convert=false
output=""
show_pid=false
force_run=false
use_feh=false

# Command usage
print_usage() {
  echo "Usage:"
  echo "  -w <path> specify the wallpaper to play"
  echo "  -s <speed> specify the fps of the wallpaper"
  echo ""
  echo " Converting"
  echo "  -c <path> specify the gif to convert to a wallpaper"
  echo "  -o <path> specify where to save the wallpaper"
  echo ""
  echo " Misc"
  echo "  -r force rerun (kill running instances)"
  echo "  -p show pid of running process"
  echo "  -f use feh instead of xwallpaper"
  echo ""
}

# Command line flag processing
while getopts "w:c:s:o:prf" flag; do
  case "${flag}" in
    w) path="${OPTARG}" ;;
    c) convert=true
       path="${OPTARG}" ;;
    s) speed="${OPTARG}" ;;
    o) output="${OPTARG}" ;;
    p) show_pid=true ;;
    r) force_run=true ;;
    f) use_feh=true ;;
    *) print_usage
       exit 1 ;;
  esac
done

# Show the pid of a running wallpaper process
if [ $show_pid = true ] ; then
  if [ -f $PID_FILE ] ; then
    echo "$(cat $PID_FILE)"
    exit 0
  else
    echo "There is no running process"
    exit 1
  fi
fi

# Convert a gif file to a wallpaper directory
if [ $convert = true ] ; then
  mkdir -p $output
  convert -coalesce $path "${output}/frame.png"
  exit 0
fi

# Make sure there isn't already a wallpaper playing
if [ -d $LOCK_DIR ] ; then
  running_pid=$(cat ${PID_FILE})
  if ps -p $running_pid > /dev/null ; then
    if [ $force_run = true ] ; then
      echo "Stopping running wallpaper..."
      kill $running_pid || { echo "Failed to kill running process (pid ${running_pid})" ; exit 1 ; }
    else
      echo "Process already running with pid $running_pid"
      exit 1
    fi
  fi
  echo "Removing lock directory..."
  remove_lock
fi

if [ "$path" = "" ] ; then
  print_usage
  exit 1
fi

# Check if the specified wallpaper is valid
if ! [ -f "${path}/frame-0.png" ] ; then
  echo "${path} does not contain a wallpaper."
  echo "Try executing"
  echo "  $0 -c <path to gif> -o $path"
  exit 1
fi

# Create lock directory
mkdir -p $LOCK_DIR
echo $$ > "$PID_FILE"

# Start the animated wallpaper
echo "Starting wallpaper ${path}..."
frame=0
frametime=$(dc <<< "2k 1000 $speed / p")
while :
do
  start=$(date +%s%N)
  image="${path}/frame-${frame}.png"

  if ! [ -f "$image" ] ; then
    frame=0
    continue
  fi

  if [ $use_feh = true ] ; then
    feh --bg-fill $image
  else
    xwallpaper --maximize $image
  fi

  ((frame++))

  end=$(date +%s%N)
  sleeptime=$(dc <<< "2k $frametime $end $start - 1000000 / - 1000 / p")
  sleep $sleeptime
done
