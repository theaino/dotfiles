#!/usr/bin/python3

import subprocess
import json
import sys


monitor_id = int(sys.argv[1])

def update(monitors, workspaces):
    active_workspace = -1
    for monitor in monitors:
        if monitor["id"] == monitor_id:
            active_workspace = int(monitor["activeWorkspace"]["id"])

    if active_workspace == -1:
        return

    workspace_map = {}

    for workspace in workspaces:
        workspace_id = int(workspace["id"])
        real_id = workspace_id
        if real_id > 10:
            real_id -= 10
        active = workspace_id == active_workspace

        if real_id not in workspace_map.keys():
            workspace_map[real_id] = {}
        if "active" in workspace_map[real_id].keys() and workspace_map[real_id]["active"]:
            continue
        workspace_map[real_id]["active"] = active
        workspace_map[real_id]["name"] = str(real_id)
        workspace_map[real_id]["class"] = f"workspace-button w{real_id}"
        if active:
            workspace_map[real_id]["class"] += f" workspace-active wa{real_id}"

    print(json.dumps(list(workspace_map.values())))


monitors = json.loads(subprocess.getoutput("hyprctl monitors -j"))
workspaces = json.loads(subprocess.getoutput("hyprctl workspaces -j"))

update(monitors, workspaces)
