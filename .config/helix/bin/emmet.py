#!/usr/bin/env python3

import sys
import subprocess

input = sys.stdin.readlines()

tab_count = 0

for char in input[0]:
    if char == "\t":
        tab_count += 1
    else:
        break

space_count = 0

for char in input[0]:
    if char == " ":
        space_count += 1
    else:
        break

for idx, line in enumerate(input):
    input[idx] = line.removesuffix("\n")

gen = subprocess.run(["emmet"], text=True, stdout=subprocess.PIPE, input="\n".join(input)).stdout

lines = []
for line in gen.split("\n")[:-1]:
    lines.append(" " * space_count + "\t" * tab_count + line)

print("\n".join(lines))
