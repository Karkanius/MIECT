#encoding=utf-8
import select
import socket
import json
import sys
import time

def main():
	tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	tcp_s.bind(("0.0.0.0", 0))
	tcp_s.connect( ("37.247.48.69", 1863) )
	
	tcp_s.send(json.dumps({'from': 'shabadu', 'msg': raw_input("Mensagem: ")})+'\n')
	message = json.loads(tcp_s.recv(4096))
	while 1:

		rsocks = select.select([tcp_s, sys.stdin, ], [], [])[0]
		for sock in rsocks:
			if sock == tcp_s:
				# Informação recebida no socket
				data = tcp_s.recv(4096)
#				if message['from'] == 'shabadu':
#					print message['msg']
				sys.stdout.write("Mensagem: " "%s\n" % data)
			elif sock == sys.stdin:
				# Informação recebida do teclado
				data = sys.stdin.readline().strip()
				if len(data) == 0:
					data = sys.stdin.readline()
				data_to_send = json.dumps({'msg': raw_input("Mensagem: ") + data})
				#print (json.loads('from') + message['msg'])
				print data_to_send
				tcp_s.send(data_to_send+'\n')

	tcp_s.close()

main()
