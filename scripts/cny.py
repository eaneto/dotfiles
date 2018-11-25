import requests

r = requests.get(
    "http://free.currencyconverterapi.com/api/v5/convert?q=CNY_BRL&compact=y")
data = r.json()
print("CNY: R$", data["CNY_BRL"]["val"])
