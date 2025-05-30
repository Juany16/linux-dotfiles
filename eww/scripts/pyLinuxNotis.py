#! /bin/python3

import os

for notis in range(5):
    os.system("dunstctl history-pop")
