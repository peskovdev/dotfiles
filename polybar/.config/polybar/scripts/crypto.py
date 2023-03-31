#!/usr/bin/python3

import sys
import requests
from decimal import Decimal


def getCrytpo(cryptoName, icon, baseCurrency='usd'):
    '''Parses json response and outputs value to polybar'''
    try:
        json = requests.get(
                f'https://api.coingecko.com/api/v3/coins/{cryptoName}',
                ).json()["market_data"]
        local_price = round(Decimal(json["current_price"][f'{baseCurrency}']))
        sys.stdout.write(f'{icon}{local_price}')
    except Exception:
        sys.stdout.write(f'{icon}None')


'''
getCrypto() takes 3 parameters:
- The first is the name of the cryptocurrency.
  You can find the list of names here: https://api.coingecko.com/api/v3/coins/

- The second is the icon that will be displayed in the polybar
  (use spaces to adjust the display)
  Examples of icons:
    fonts: cryptocoins
    bitcoin:     
    ethereum:    
    monero: 

    fonts: material design icons
    bitcoin-icons: 󰠓
    ethereum-icons: 󰡪

- The third is an optional parameter,
    it's necessary to get the price in another currency (default usd)
'''

getCrytpo('bitcoin', ' ')
getCrytpo('ethereum', ' ')
getCrytpo('monero', '  ')
