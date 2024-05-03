import json
import subprocess


def get_handler(request):
    def handler():
        result = subprocess.run(["hyprctl", "-j", request], stdout=subprocess.PIPE)
        data = json.loads(result.stdout.decode())
        return data
    return handler


get_windows = get_handler("clients")
get_active_workspace = get_handler("activeworkspace")
get_active_window = get_handler("activewindow")


def focus_window(address):
    subprocess.run(["hyprctl", "dispatch", "focuswindow", f"address:{address}"])
