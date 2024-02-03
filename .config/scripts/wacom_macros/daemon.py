#!/usr/bin/python

import time
from datetime import datetime
from pynput import mouse, keyboard
import os

maps = {
    "1": "+ctrl +shift l -ctrl -shift",
    "2": "ctrl",
    "3": "ctrl",
    "8": "ctrl",
}

for button in maps.keys():
    modifier = ""
    value = maps[button]
    if value != "":
        modifier = f" key \"{value}\""
    command = f"xsetwacom --set \"Wacom Intuos S Pad pad\" Button {button}{modifier}"
    os.system(command)

state = True

dir_path = os.path.dirname(os.path.realpath(__file__))

def change():
    global state
    if state:
        os.system("setxkbmap -layout us")
    else:
        os.system("setxkbmap -layout us -variant intl")
    with open(os.path.join(dir_path, "state.txt"), "w") as f:
        f.write("us" if state else "intl")
    state = not state

change()

combinations = [
    ({keyboard.Key.ctrl, keyboard.Key.shift, keyboard.KeyCode(char='L')}, change)
]

current = set()
last_pressed = None

def on_press(key):
    global current, last_pressed
    c_time = datetime.now()
    if last_pressed is not None:
        delta = c_time - last_pressed
        if delta.total_seconds() > 5:
            current = set()
    if any([key in combo for combo, handler in combinations]):
        current.add(key)
        for combo, handler in combinations:
            if all(k in current for k in combo):
                handler()
    last_pressed = c_time

def on_release(key):
    if key in current:
        current.remove(key)
        
with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()

