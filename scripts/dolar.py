import requests

r = requests.get(
    "http://free.currencyconverterapi.com/api/v6/convert?q=USD_BRL&compact=y")
data = r.json()
print("USD: R$", data["USD_BRL"]["val"])
