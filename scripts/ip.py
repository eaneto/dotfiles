#!/usr/bin/python3

import requests


if __name__ == '__main__':
    try:
        r = requests.get('https://wtfismyip.com/json')
        data = r.json()
    except Exception as exp:
        print("\nCan't connect to the server.\n")
        exit()

    ip = data['YourFuckingIPAddress']
    isp = data['YourFuckingISP']
    location = data['YourFuckingLocation']
    hostname = data["YourFuckingHostname"]

    print("\nYour IP Adress is:", ip)
    print("Your ISP is:", isp)
    print("Your host name is:", hostname)
    print("Your Location is:", location)
