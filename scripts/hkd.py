import requests

r = requests.get(
    "http://free.currencyconverterapi.com/api/v5/convert?q=HKD_BRL&compact=y")
data = r.json()
print("HKD: R$", data["HKD_BRL"]["val"])
