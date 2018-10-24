import requests
from bs4 import BeautifulSoup

r = requests.get("https://www.dolarhoje.com/iene/")
data = BeautifulSoup(r.text, 'html.parser')

print("R$ {}".format(data.find(id="estrangeiro")["value"]))
