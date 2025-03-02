import requests as rq
from bs4 import BeautifulSoup as bs
import pandas as pd

try:
    urlDB = "https://dolarhoy.com"
    pagDB = rq.get(urlDB)#, timeout=7
    soup = bs(pagDB.content, "html.parser")
    
    precioDB = soup.find_all("div", class_ = "val")
except:
    print("Error")

preciosDB = list()
for psdb in precioDB:
    preciosDB.append(psdb.text)

print("  Dolar Blue: ")
dtD = pd.DataFrame({"Compra:": preciosDB[0], "Venta:": preciosDB[1]}, index=list(range(1,2)))
print(dtD, "\n")

print("  Dolar Oficial: ")
dtDO = pd.DataFrame({"Compra:": preciosDB[4], "Venta:": preciosDB[5]}, index=list(range(1,2)))
print(dtDO)

