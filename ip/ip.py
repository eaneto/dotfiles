import requests
from bs4 import BeautifulSoup

def main():
    try:
        r = requests.get('https://wtfismyip.com/json')
        data = r.json()
    except:
        print("\nCan't connect to the server.\n")
        return False
    
    ip = data['YourFuckingIPAddress']
    isp = data['YourFuckingISP']
    location = data['YourFuckingLocation']

    print("\nYour IP Adress is: {ip}".format(ip=ip))
    print("\nYour ISP is: {isp}".format(isp=isp))
    print("\nYour Location is: {location}".format(location=location))

if __name__ == '__main__':
    main()
