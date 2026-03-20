#! /usr/bin/python3
import requests as rqs

# http://api.openweathermap.org/data/2.5/weather?q={}&appid=5f3b29f4dc85907c2d876b350b1a616b&units=metric&lang=es

API = "8b7fff65c29d705c40c6c729eaddc35c"
CIUDAD = "Villa Carlos Paz"
UNIDADES = "metric"
IDIOMA = "es"
URL = f"http://api.openweathermap.org/data/2.5/weather?q={CIUDAD}&appid={API}&units={UNIDADES}&lang={IDIOMA}"

res = rqs.get(URL)
datos = res.json()

icono = datos["weather"][0]["icon"]
temp = str(round(datos["main"]["temp"]))
clima =  datos["weather"][0]["description"].capitalize()

if icono == "01d":
    icono = ""
elif icono == "01n":
    icono = ""
elif icono == "02d":
    icono = ""
elif icono == "02n":
    icono = ""
elif icono == "03d":
    icono = "󰖐"
elif icono == "03n":
    icono = "󰖐"
elif icono == "04d":
    icono = ""
elif icono == "04n":
    icono = ""
elif icono == "09d":
    icono = ""
elif icono == "09n":
    icono = ""
elif icono == "10d":
    icono = ""
elif icono == "10n":
    icono = ""
elif icono == "11d":
    icono = ""
elif icono == "11n":
    icono = ""
elif icono == "13d":
    icono = "󰖘"
elif icono == "13n":
    icono = "󰖘"
elif icono == "50d":
    icono = ""
elif icono == "50n":
    icono = ""

print(f"{icono}   {temp}°C | {clima}")
#print(f"{icono} ")
#print(str(int(temp)) + "°C")
#print(clima)
