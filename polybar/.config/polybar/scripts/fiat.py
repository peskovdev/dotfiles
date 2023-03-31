#!/usr/bin/python3

import sys
import requests
from decimal import Decimal


def getFiat(currency, baseCurrency='USD'):
    '''Parses json response and return price'''
    return round(Decimal(requests.get(
        f'https://freecurrencyrates.com/api/action.php?do=cvals&\
                iso={currency}&f={baseCurrency}&v=1&s=cbr',
        ).json()[f'{currency}']), 2)


'''
getFiat() takes 2 parameters:
- The first is the name of the currency.

- The second is an optional parameter,
    it's necessary to get the price in another currency (default usd)
'''

# sys.stdout.write() will output the content to the polybar.
# Use as default print() (and use spaces to adjust the display)
try:
    sys.stdout.write(f'󰆱{getFiat("RUB")} ')
    sys.stdout.write(f'󰡥{getFiat("KZT")}({getFiat("KZT", "RUB")})')
except Exception:
    sys.stdout.write("󰆱None")
    sys.stdout.write("󰡥None")
