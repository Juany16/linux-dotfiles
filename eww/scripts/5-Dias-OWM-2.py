#! /usr/bin/python3

import requests as rqs
import json
from datetime import datetime
import locale

locale.setlocale(locale.LC_TIME, "es_ES.utf8")

API = "API_KEY"
UNIDADES = 'metric'
IDIOMA = 'es'
CIUDAD = "Villa Carlos Paz"

url = f"https://api.openweathermap.org/data/2.5/forecast?q={CIUDAD}&appid={API}&lang={IDIOMA}&units={UNIDADES}"

def Iconos(code):
    icons = {
        "01d": "",
        "01n": "",
        "02d": "",
        "02n": "",
        "03d": "󰖐",
        "03n": "󰖐",
        "04d": "",
        "04n": "",
        "09d": "",
        "09n": "",
        "10d": "",
        "10n": "",
        "11d": "",
        "11n": "",
        "13d": "󰖘",
        "13n": "󰖘",
        "50d": "",
        "50n": "" 
    }

    try:
        return icons[code]
    except KeyError:
        return None

response = rqs.get(url).json()

ciudad = response["city"]["name"]

actual = response["list"][0]
temp = int(actual["main"]["temp"])
clima = actual["weather"][0]["description"].capitalize()
icono = Iconos(actual["weather"][0]["icon"])

dias = []
for dia in response["list"]:
    if "12:00:00" in dia["dt_txt"]:
        dias.append(dia)

dias2 = []
iconos = []
temps = []
descs = []

for i in range(5):
    if i >= len(dias):
        break
    # dias2.append(dias[i]["dt_txt"])
    dias2.append(datetime.strptime(dias[i]["dt_txt"], "%Y-%m-%d %H:%M:%S").strftime("%a").capitalize())
    temps.append(int(dias[i]["main"]["temp"]))
    iconos.append(Iconos(dias[i]["weather"][0]["icon"]))
    descs.append(dias[i]["weather"][0]["description"].capitalize())

for dia, icono, temp, desc in zip(dias2, iconos, temps, descs):
    print(f"{dia}    {icono}   {temp}ºC   {desc}")

