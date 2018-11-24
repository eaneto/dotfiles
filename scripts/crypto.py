#!/usr/bin/python3

from urllib.error import HTTPError

import requests


def get_coins(currency):
    """Get coin price. """
    try:
        req = requests.get(
            "https://api.coinmarketcap.com/v1/ticker/{}"
            .format(currency))
        coin_data = req.json()
        coin_data = coin_data[0]
    except HTTPError:
        return False

    return int(float(coin_data["price_usd"]))


btc = get_coins("bitcoin")
eth = get_coins("ethereum")
print("BTC:", btc, "ETH:", eth)
