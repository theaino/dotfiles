#!/usr/bin/python3

import json
import subprocess


def pactl(cmd):
    cmd = f"pactl --format=json {cmd}"
    return subprocess.getoutput(cmd).strip()

default_sink = pactl("get-default-sink")
sink_inputs = json.loads(pactl("list sink-inputs"))

for input in sink_inputs:
    idx = input["index"]
    pactl(f"move-sink-input {idx} {default_sink}")
    
