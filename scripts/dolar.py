import requests
from bs4 import BeautifulSoup

r = requests.get("https://www.dolarhoje.net.br")
data = BeautifulSoup(r.text, 'html.parser')

print("R$ {}".format(data.find(id="moeda")["value"]))
