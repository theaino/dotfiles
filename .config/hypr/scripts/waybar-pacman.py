#!/usr/bin/env python3

import os
import json


updates = os.popen("checkupdates && yay -Qua").read().strip()
count = len(updates.split("\n"))
if updates == "":
    count = 0

print(json.dumps({
    "text": str(count),
    "tooltip": updates
}))
