import socket
import json
import time

def main():
	tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	tcp_s.bind(("0.0.0.0", 0))
	tcp_s.connect( ("37.247.48.69", 1863) )

	while 1:
		data = json.dumps({})+'\n'
		tcp_s.send(data)
		print tcp_s.recv(4096)
		time.sleep(1)
	
	tcp_s.close()

main()