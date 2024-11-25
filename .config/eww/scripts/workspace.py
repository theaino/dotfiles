#!/usr/bin/python3

import subprocess
import json
import sys


monitor_id = int(sys.argv[1])

def update(monitors, workspaces):
    active_workspace = -1
    real_id = -1
    for monitor in monitors:
        if monitor["id"] != monitor_id:
            continue
        real_id = monitor["activeWorkspace"]["id"]
        active_workspace = real_id
        if real_id > 10:
            real_id -= 10

    sid = 1
    if active_workspace > 10:
        sid = 11
    eid = sid + 10
    before_count = 0
    after_count = 0
    for workspace in workspaces:
        wid = workspace["id"]
        if wid < sid or wid >= eid:
            continue
        if workspace["lastwindow"] != "0x0":
            if wid < active_workspace:
                before_count += 1
            elif wid > active_workspace:
                after_count += 1
    print(f"{'-' * before_count}{real_id}{'-' * after_count}")


monitors = json.loads(subprocess.getoutput("hyprctl monitors -j"))
workspaces = json.loads(subprocess.getoutput("hyprctl workspaces -j"))

update(monitors, workspaces)
