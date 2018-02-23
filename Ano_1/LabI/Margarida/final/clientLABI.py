#encoding=utf-8

"""
Alexandre Lourenço nº79894
Ana Margarida Silva nº 77752
Susana Dias nº 80410
"""


import select
import socket
import json
import sys
import time

def main():
	tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	tcp_s.bind(("0.0.0.0", 0))
	try:
		tcp_s.connect( ("37.247.48.69", 1863) )
	except:
		print 'Nao foi possivel realizar a coneccao ao chat'
		sys.exit()


	print '_____________________________________________________'
	print '                                                   	'
	print '----------------------LABI CHAT----------------------'
	print '_____________________________________________________'
	print '                                                   	'
	print '                                                   	'
	print 'Opcoes: online; msg; nome; sair'
	print
	print getOn(tcp_s)

	#escolher nome e enviar mensagem
	nick = nickname(tcp_s)
	first=True
		
	while 1:

		rsocks = select.select([tcp_s, sys.stdin, ], [], [])[0]
		for sock in rsocks:
			if sock == tcp_s:
				# Informação recebida no socket
				data = tcp_s.recv(4096).split('"msg":')
				if(not(first)):
					#mensagens recebidas
					data=data[1].split('"to":')
					msg=data[0].split(",")[0]
					de=data[1].split('"from":')[1].split("}")[0]
					if(('"'+nick+'"')!=de):
						print ("De: "+ de+"\nMensagem: " + msg + "\n")
				else:
					first=False;

			elif sock == sys.stdin:
				# Informação recebida do teclado
				option = (sys.stdin.readline()).strip()
				#option=(raw_input("Opcao: ")).strip()

				if (option=="sair"):
					tcp_s.close()
					sys.exit(0)
				elif (option=="online"):
					print(getOn(tcp_s))
				elif (option=="msg"):
					 tcp_s.send(message()+'\n')
				elif (option=="nome"):
					first=True
					nick=nickname(tcp_s)
				else:
					print 'Opcao inexistente! Valido: online; msg; nome; sair'
			
	tcp_s.close()

def getOn(tcp_s):
	#ver quem esta on
	data = json.dumps({})+'\n'
	tcp_s.send(data)
	inicial = tcp_s.recv(4096).split('"')
	return "On-line: "+inicial[3] +'\n' 

def message():
	data1=(raw_input("Para: ")).strip()
	data0=(raw_input("Mensagem: ")).strip()
	print ""
	data_to_send = json.dumps({"msg": data0, "to": data1})
	if data0 != "":
		return data_to_send
	
	else:
		print 'Conteudo nulo! Mensagem nao enviada...'

def nickname(tcp_s):
	nickname = (raw_input("Nome: ")).strip()
	tcp_s.send(json.dumps({"from" : nickname})+'\n')
	return nickname

main()