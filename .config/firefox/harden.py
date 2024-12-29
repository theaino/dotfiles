#!/usr/bin/env python3

import sys
import re
import json
import os
import shutil

#
# https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/Smoothfox.js
# https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/Peskyfox.js
# https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/Fastfox.js
# https://raw.githubusercontent.com/yokoffing/Betterfox/refs/heads/main/Securefox.js
#

os.chdir(os.path.dirname(os.path.abspath(__file__)))

PROFILE_ROOT = "/home/aino/.mozilla/firefox/6eg47zzj.hard"
PROFILE_LOCAL = "/home/aino/.cache/mozilla/firefox/6eg47zzj.hard"
USERJS_PATH = os.path.join(PROFILE_ROOT, "user.js")
STARTUP_CACHE = os.path.join(PROFILE_LOCAL, "startupCache")
FILES = ["Betterfox.js", "Smoothfox.js", "Peskyfox.js", "Fastfox.js", "Securefox.js", "custom.js"]


def loadprefs(file):
    with open(file, "r") as f:
        data = f.read()
    cap = re.findall(r"(?:^|\n)user_pref\((?:\"([^\"]+)\"),\s*([^)]+)\);?", data)
    prefs = {}
    for key, value in cap:
        prefs[key] = json.loads(value)
    return prefs

def assprefs(prefs):
    return "\n".join([f"user_pref(\"{key}\", {json.dumps(value)});" for key, value in prefs.items()])

def genprefs():
    print("Generating user.js")
    prefs = {}
    for file in FILES:
        for key, value in loadprefs(file).items():
            prefs[key] = value
    data = assprefs(prefs)
    with open("user.js", "w") as f:
        f.write(data)
    
def updateuser():
    if not os.path.isfile("user.js"):
        genprefs()
    with open("user.js", "r") as f:
        target = f.read()
    up = True
    if os.path.isfile(USERJS_PATH):
        with open(USERJS_PATH, "r") as f:
            if f.read().strip() == target.strip():
                up = False
    if not up:
        return
    print("Updating user.js")
    with open(USERJS_PATH, "w") as f:
        f.write(target)
    if not os.path.isdir(STARTUP_CACHE):
        return
    print("Clearing startup cache")
    shutil.rmtree(STARTUP_CACHE)

if __name__ == "__main__":
    gen = len(sys.argv) > 1 and sys.argv[1] == "gen"
    if gen:
        genprefs()
    else:
        updateuser()
