#! /bin/python3

import random as rd

valores = {"A": 11, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "J": 10, "Q": 10, "K": 10}
keys = tuple(valores.keys())
mazo = []
jugador = []
jugador1 = []
crupier = []
puntajeJugador = 0
puntajeCrupier = 0
puntajeJugador1 = 0
volverAJugar = True
dinero = 0
apuesta = 0
apuesta1 = 0
seguro = 0
haySeguro = False
presupuesto = 0
decisionValida = True

def crearMazo():
	for i in keys:
		for j in range(4):
			mazo.append(i)
def mezclar():
	rd.shuffle(mazo)

def repartir():
	for i in range(2):
		jugador.append(mazo.pop())
	crupier.append(mazo.pop())

def tieneBJ(quien):
	if quien == "crupier":
		if puntajeCrupier == 21 and "A" in crupier and len(crupier) == 2:
			return True
		else:
			return False
	if quien == "jugador":
		if puntajeJugador == 21 and "A" in jugador and len(jugador) == 2:
			return True
		else:
			return False

def calcularPuntajes(quien):
	if quien == "crupier":
		if len(crupier) == 2:
			puntajeCrupier = valores[crupier[0]] + valores[crupier[1]]
			return puntajeCrupier
		elif len(crupier) == 3:
			puntajeCrupier = valores[crupier[0]] + valores[crupier[1]] + valores[crupier[2]]
			if "A" in crupier and puntajeCrupier > 21:
				puntajeCrupier -= 10
			return puntajeCrupier
		else:
			puntajeCrupier = valores[crupier[0]]
			return puntajeCrupier
	elif quien == "jugador":
		if len(jugador) == 2:
			puntajeJugador = valores[jugador[0]] + valores[jugador[1]]
			return puntajeJugador
		elif len(jugador) == 3:
			puntajeJugador = valores[jugador[0]] + valores[jugador[1]] + valores[jugador[2]]
			if "A" in jugador and puntajeJugador > 21:
				puntajeJugador -= 10
			return puntajeJugador
	elif quien == "jugador1":
		if len(jugador1) == 2:
			puntajeJugador1 = valores[jugador1[0]] + valores[jugador1[1]]
			return puntajeJugador1
		elif len(jugador1) == 3:
			puntajeJugador1 = valores[jugador1[0]] + valores[jugador1[1]] + valores[jugador1[2]]
			if "A" in jugador1 and puntajeJugador1 > 21:
				puntajeJugador1 -= 10
			return puntajeJugador1

def fueraDeJuego(quien):
	if quien == "jugador":
		if puntajeJugador > 21:
			return True
		else:
			return False
	elif quien == "crupier":
		if puntajeCrupier > 21:
			return True
		else:
			return False

while True:
	presupuesto = input("Dime tu presupuesto.\n>> ")
	try:
		presupuesto = int(presupuesto)
		break
	except ValueError:
		print("Debes darme un presupuesto valido.\n")

while(volverAJugar):
	haySeguro = False
	decisionValida = True
	mazo.clear()
	crearMazo()
	apuesta = 0
	jugador.clear()
	crupier.clear()
	mezclar()

	if presupuesto <= 0:
		if input("Te haz quedado sin dinero, no puedes seguir jugando. Quieres hacer una recarga? si/no\n >> ").lower().strip() == "si":
			presupuesto += int(input("Cuanto dinero quieres recargar?\n>> "))
			while presupuesto <= 0:
				presupuesto += int(input("Por favor, recarga mas dinero.\n >> "))
			print("Dinero recargado")
		else:
			print("Fin del juego")
			quit()

	while True:
		ingresaApuesta = input("Cuanto quieres apostar?\n>> ")
		try:
			apuesta += int(ingresaApuesta)
			break
		except:
			print("Debes darme un valor valido.\n")

	while apuesta > presupuesto:
		apuesta -= apuesta
		while True:
			ingresaApuesta = input("No tienes ese dinero, por favor, realiza una apuesta menor\n >> ")
			try:
				apuesta += int(ingresaApuesta)
				break
			except:
				print("Debes darme un valor valido.\n")
	presupuesto -= apuesta

	print("No va mas")
	input()

	repartir()

	print("Tus cartas son: ", jugador)
	input()
	print("Tu puntaje es", calcularPuntajes("jugador"), "puntos")
	print("La carta del crupier es: ", crupier)
	input()

	if "A" in crupier:
		s = input("Quieres apostar el seguro? si/no\n>> ").lower().strip()
		if s == "si":
			seguro += int(input("Cuanto quieres apostar?\n>> "))
			while seguro > presupuesto:
				seguro -= seguro
				seguro += int(input("No dispones de ese dinero, por favor, haz una apuesta menor.\n>> "))
			presupuesto -= seguro
			haySeguro = True

	while (decisionValida):
		decision = input("\n¿Que quieres hacer?\n a) plantarte \n b) pedir cartas\n c) doblar \n d) dividir \n>> ").lower().strip()
		if decision == "a":
			decisionValida = False
			puntajeJugador = calcularPuntajes("jugador")
			print("Tu puntaje es de:", puntajeJugador)
			input()
		elif decision == "b":
			decisionValida = False
			jugador.append(mazo.pop())
			print("tus cartas son:", jugador)
			input()
			puntajeJugador = calcularPuntajes("jugador")
			print("Tu puntaje es: ", puntajeJugador)
			input()
		elif decision == "c" and apuesta <= presupuesto:
			decisionValida = False
			apuesta *= 2
			jugador.append(mazo.pop())
			print("tus cartas son:", jugador)
			input()
			puntajeJugador = calcularPuntajes("jugador")
			print("Tu puntaje es: ", puntajeJugador)
			input()
		elif decision == "c" and apuesta > presupuesto:
			print("No tienes suficiente presupuesto para doblar, elige otra opción:\n")
		elif decision == "d" and (apuesta > presupuesto or valores[jugador[0]] != valores[jugador[1]]):
			print("No estás en condiciones de dividir, intenta otra jugada")
		elif decision == "d" and (apuesta <= presupuesto or valores[jugador[0]] == valores[jugador[1]]):
			decisionValida = False
			apuesta1 = apuesta
			jugador1.append(jugador.pop())
			jugador1.append(mazo.pop())
			jugador.append(mazo.pop())
			print("tus cartas de la primera mano son:", jugador)
			input()
			puntajeJugador = calcularPuntajes("jugador")
			print("Tu puntaje de esta mano es: ", puntajeJugador)
			input()
			print("tus cartas de la segunda mano son:", jugador1)
			input()
			puntajeJugador1 = calcularPuntajes("jugador1")
			print("Tu puntaje es: ", puntajeJugador1)
			input()

	crupier.append(mazo.pop())

	print("Las cartas del crupier son: ", crupier)
	input()

	puntajeCrupier = calcularPuntajes("crupier")

	if puntajeCrupier <= 16:
		print("El crupier toma otra carta")
		input()
		crupier.append(mazo.pop())
		print("Las cartas del crupier son: ", crupier)
		input()

	puntajeCrupier = calcularPuntajes("crupier")
	puntajeJugador = calcularPuntajes("jugador")

	if (len(jugador1) == 0):
		if fueraDeJuego("jugador") and fueraDeJuego("crupier"):
			print("Empatan, ambos estan fuera de juego")
			presupuesto += apuesta
			apuesta = 0
		elif fueraDeJuego("jugador") and not fueraDeJuego("crupier"):
			print("Gana crupier, estas fuera de juego")
			dinero -= apuesta
			apuesta = 0
		elif fueraDeJuego("crupier") and not fueraDeJuego("jugador"):
			print("Ganas tu, el crupier esta fuera de juego")
			dinero += apuesta
			presupuesto += apuesta*2
			apuesta = 0
	elif (len(jugador1) == 2):
		if fueraDeJuego("jugador") and fueraDeJuego("crupier"):
			print("Con tu primera mano empatan, ambos estan fuera de juego")
			presupuesto += apuesta
			apuesta = 0
		elif fueraDeJuego("jugador") and not fueraDeJuego("crupier"):
			print("Tu primera mano pierde, gana crupier, estas fuera de juego")
			dinero -= apuesta
			apuesta = 0
		elif fueraDeJuego("crupier") and not fueraDeJuego("jugador1"):
			print("Tu primera mano gana, el crupier esta fuera de juego")
			dinero += apuesta1
			presupuesto += apuesta1*2
			apuesta = 0
		if fueraDeJuego("jugador1") and fueraDeJuego("crupier"):
			print("Con tu segunda mano empatan, ambos estan fuera de juego")
			presupuesto += apuesta1
			apuesta1 = 0
		elif fueraDeJuego("jugador1") and not fueraDeJuego("crupier"):
			print("Tu segunda mano pierde, gana crupier, estas fuera de juego")
			dinero -= apuesta1
			apuesta1 = 0
		elif fueraDeJuego("crupier") and not fueraDeJuego("jugador1"):
			print("Tu segunda mano gana, el crupier esta fuera de juego")
			dinero += apuesta1
			presupuesto += apuesta1*2
			apuesta1 = 0

	if haySeguro:
		if tieneBJ("crupier"):
			print("Ganas la apuesta de seguro, se te dara", seguro*2, "pesos")
			dinero += seguro
			presupuesto += seguro*2
			seguro = 0
		else:
			print("Pierdes la apuesta de seguro")
			seguro = 0

	if (len(jugador1) == 0):
		if not fueraDeJuego("jugador") and not fueraDeJuego("crupier") and puntajeJugador > puntajeCrupier:
			if tieneBJ("jugador"):
				print("Ganas tu, tienes blackjack, el puntaje del crupier es", puntajeCrupier, "puntos")
				dinero += apuesta*3/2
				presupuesto += apuesta*3/2 + apuesta
			else:
				print("Ganas tu, tu puntaje es de", puntajeJugador, "puntos y el del crupier", puntajeCrupier, "puntos")
				dinero += apuesta
				presupuesto += apuesta*2
				apuesta = 0
		elif not fueraDeJuego("jugador") and not fueraDeJuego("crupier") and puntajeJugador < puntajeCrupier:
			print("Pierdes, tu puntaje es de", puntajeJugador, "puntos y el del crupier", puntajeCrupier, "puntos")
			dinero -= apuesta
			apuesta = 0
		elif not fueraDeJuego("jugador") and not fueraDeJuego("crupier") and puntajeJugador == puntajeCrupier:
			print("Han empatado, recuperas tu apuesta")
			presupuesto += apuesta
	elif (len(jugador1) == 2):
		if not fueraDeJuego("jugador") and not fueraDeJuego("crupier") and puntajeJugador > puntajeCrupier:
				print("Tu primera mano gana, tu puntaje es de", puntajeJugador, "puntos y el del crupier", puntajeCrupier, "puntos")
				dinero += apuesta
				presupuesto += apuesta*2
				apuesta = 0
		elif not fueraDeJuego("jugador") and not fueraDeJuego("crupier") and puntajeJugador < puntajeCrupier:
			print("Tu primera mano pierde, tu puntaje es de", puntajeJugador, "puntos y el del crupier", puntajeCrupier, "puntos")
			dinero -= apuesta
			presupuesto -= apuesta
			apuesta = 0
		elif not fueraDeJuego("jugador") and not fueraDeJuego("crupier") and puntajeJugador == puntajeCrupier:
			print("Tu primera mano ha empatado, recuperas tu apuesta")
			presupuesto += apuesta
		if not fueraDeJuego("jugador1") and not fueraDeJuego("crupier") and puntajeJugador1 > puntajeCrupier:
				print("Tu segunda mano gana, tu puntaje es de", puntajeJugador1, "puntos y el del crupier", puntajeCrupier, "puntos")
				dinero += apuesta1
				presupuesto += apuesta1*2
				apuesta1 = 0
		elif not fueraDeJuego("jugador1") and not fueraDeJuego("crupier") and puntajeJugador1 < puntajeCrupier:
			print("Tu segunda mano pierde, tu puntaje es de", puntajeJugador1, "puntos y el del crupier", puntajeCrupier, "puntos")
			dinero -= apuesta1
			presupuesto -= apuesta1
			apuesta1 = 0
		elif not fueraDeJuego("jugador1") and not fueraDeJuego("crupier") and puntajeJugador1 == puntajeCrupier:
			print("Tu segunda mano ha empatado, recuperas tu apuesta")
			presupuesto += apuesta1

	while True:
		consDG=input("Quieres consultar el dinero ganado? si/no\n >> ").lower().strip()
		if consDG=="si":
			if dinero < 0:
					print("Perdiste", abs(dinero), "pesos")
			else:
				print("Ganaste", dinero, "pesos")
			break
		elif consDG=="no":
			break
		else:
			print("Debes ingresar si o no\n")

	while True:
		consP=input("Quieres consultar tu presupuesto? si/no\n >> ").lower().strip()
		if  consP== "si":
			print("Tienes", presupuesto, "pesos")
			break
		elif consP=="no":
			break
		else:
			print("Debes ingresar si o no\n")

	while True:
		vj=input("Quieres volver a jugar? si/no\n>> ").lower().strip()
		if vj=="si":
			volverAJugar = True
			break
		elif vj=="no":
			volverAJugar = False
			break
		else:
			print("Debes ingresar si o no.\n")

print("Fin del juego")
