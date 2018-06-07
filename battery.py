#!/bin/python3


def main():
    with open('/sys/class/power_supply/BAT0/capacity') as f:
        battery = f.readline()
        print(battery, end="")


if __name__ == '__main__':
    main()
