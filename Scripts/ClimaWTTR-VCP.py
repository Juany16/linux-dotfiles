#! /usr/bin/env python3

import requests as rq

def mostrarClima():
    try:
        ciudad = "villa carlos paz"
        formato = "Q"
        url = f"https://es.wttr.in/{ciudad}?{formato}?F"
        pag = rq.get(url, timeout = 7)
        print("                                             VILLA CARLOS PAZ, CÓRDOBA, ARGENTINA \n")
        print(pag.text)
    except:
        print("Error!")

mostrarClima()
