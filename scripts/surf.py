#!/usr/bin/python3

import os
import sys
import json
import subprocess


def get_bookmarks():
    home = os.getenv("HOME")
    bookmarks = []

    with open(os.path.join(home, ".surf/bookmarks.json")) as fp:
        bookmarks = fp.read()

    return json.loads(bookmarks)


if len(sys.argv) == 1:
    subprocess.call(["surf"])

bookmark = sys.argv[1]
bookmarks = get_bookmarks()

if bookmark in bookmarks:
    subprocess.call(["surf", bookmarks[bookmark]])
else:
    subprocess.call(["surf", bookmark])
