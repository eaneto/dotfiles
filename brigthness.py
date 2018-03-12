import subprocess
import sys

option = sys.argv[1]

def change_brigtness(option):
    subprocess.run(["xbacklight", "-set", option])
    print("Brigthness set to {}".format(option))
    return True

change_brigtness(option)
