import requests

r = requests.get(
    "http://free.currencyconverterapi.com/api/v5/convert?q=JPY_BRL&compact=y")
data = r.json()
print("JPY: R$", data["JPY_BRL"]["val"])
