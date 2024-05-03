import subprocess
import hypr


def run_menu(menu, input):
    result = subprocess.run(["bash", "-c", menu], stdout=subprocess.PIPE, input=input.encode())
    return result.stdout.decode()

def main():
    menu = input()
    active_workspace_data = hypr.get_active_workspace()
    windows_data = hypr.get_windows()
    active_workspace = active_workspace_data["id"]

    active_window = hypr.get_active_window()

    workspace_windows = [window for window in windows_data if window["workspace"]["id"] == active_workspace]
    new_workspace_windows = []
    for window in workspace_windows:
        if window["address"] == active_window["address"]:
            new_workspace_windows = [window] + new_workspace_windows
        else:
            new_workspace_windows.append(window)

    workspace_window_names = [f"{idx} {window['class']}" for idx, window in enumerate(new_workspace_windows)]

    selected_window = run_menu(menu, "\n".join(workspace_window_names)).strip()
    if selected_window == "":
        return
    selected_window_idx = int(selected_window.split(" ")[0])
    hypr.focus_window(new_workspace_windows[selected_window_idx]["address"])

if __name__ == "__main__":
    main()

