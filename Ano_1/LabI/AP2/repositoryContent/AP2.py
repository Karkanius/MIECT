# -*- coding: utf-8 -*-                         # Importing all the modules needed fot the project
import base64                           # Base64 is used to encode the signature
import time                             # time is used to get the current time in seconds through the method time.time()
import socket                           # socket is used to open a socket and connect to a server
import sys                              # sys is used to get arguments from the shell where python this is being run
import json                             # json is used to format data according to standards the server accepts
from Crypto.PublicKey import RSA        # Used to create bht the public and private keys
from Crypto.Hash import SHA             # Used for the signature
from Crypto.Signature import PKCS1_PSS  # Used for the signature


def draw_menu():# Draws a menu
	print '¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯'
	print '     MENU       '
	print ''
	print '    LIST'
	print '   CREATE'
	print '    PUT'
	print '    GET'
	print '   EXIT '
	print '__________________'


def box_type_menu():                    # Draws Another menu
	print '¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯'
	print '     Box Type'
	print ' '
	print ' 1: PUBLIC'
	print ' 2: PRIVATE'
	print '____________________'


def get_box():                                              # Method for getting a box from server
	tcp_s.send(json_get(raw_input("Insert Box Name: ")))    # Sends a JSON string to the server through the socket tcp_s
	msg = tcp_s.recv(4096)                                  # Receiveing a message from the server
	if not msg.endswith("\r\n"):                            # if the message doesn't end with \r\n
		while not msg.endswith("\n\n"):                     # While it doesn't end with \r\n
			msg = msg + tcp_s.recv(4096)                    # The socket keeps receiveing data
	dic = dict(json.loads(msg))                             # Then a dictionary is made from the received JSON
	if str(dic['code']) == 'OK':                            # If the code from the received string is 'OK'
		print str(dic['content'])                         # The message is shown
	else:                                                   # Otherwise
		print 'An error has ocurred while searching for your box.'  # An error message is shown
		print 'Details: ' + str(dic['content'])                     # with details regarf«ding the error


def json_list():  # Creating JSON String for Box Listing
	j_list = {'type': "LIST"}       #
	return str(json.dumps(j_list)+'\r\n')


def put_msg():
	tcp_s.send(json_put(raw_input("Insert Box Name: "), raw_input("Insert Message: ")))
	msg = tcp_s.recv(4096)
	if not msg.endswith("\r\n"):
		while not msg.endswith("\n\n"):
			msg = msg + tcp_s.recv(4096)
	dic = dict(json.loads(msg))
	print str(dic)
	if str(dic['code']) == 'OK':
		print 'Your message was dellivered successfully'
	else:
		print 'An error has ocurred while delivering your message. Please Try again'


def list_box():
	tcp_s.send(json_list())
	msg = tcp_s.recv(4096)
	if not msg.endswith("\r\n"):
		while not msg.endswith("\r\n"):
			msg = msg + tcp_s.recv(4096)
		dic = dict(json.loads(msg))
		if str(dic['code']) == 'OK':
			for i in range(0, len(dic['payload'])):
				print dic['payload'][i]['name']
		else:
			print 'There has been a problem. Please try again'


def json_create_public(box_name):  # Creating SON String for Box Creation
	j_create = {  # then there is no encryption on the message
		'type': "CREATE",
		'name': str(box_name),
		'timestamp': int(time.time())  # Encontrar comando para meter timestamp
	}
	return str(json.dumps(j_create))


def json_create_private(box_name):
	secs = str(int(time.time()))
	pubk = str(get_pubk())
	name = str(box_name)
	text = pubk + secs + name
	prv_key = RSA.importKey(open('privateKey.pem', 'r').read())
	digest = SHA.new(text)
	signer = PKCS1_PSS.new(prv_key)
	signature = signer.sign(digest)
	sig = base64.encodestring(signature)
	print "\n\n"+sig
	j_create = {
		'type': 'CREATE',
		'name': name,
		'timestamp': secs,
		'pubk': secs ,
		'sig': sig
	}

	print j_create

	return json.dumps(j_create)


def create_box_public(box_name):
	tcp_s.send(json_create_public(box_name) + '\r\n')
	print 'test 1'
	msg = tcp_s.recv(4096)
	if not msg.endswith("\r\n"):
		while not msg.endswith("\r\n"):
			msg = msg + tcp_s.recv(4096)
	dic = dict(json.loads(msg))
	if str(dic['code']) == 'OK':
		print 'Your box has been created successfully'
	else:
		print 'An error has ocurred. Please try again later'
		print 'Details: ' + str(dic['content'])


def create_box_private(box_name):
	tcp_s.send(str(json_create_private(box_name) + '\r\n'))
	msg = tcp_s.recv(4096)
	if not msg.endswith("\r\n"):
		while not msg.endswith("\r\n"):
			msg = msg + tcp_s.recv(4096)
			dic = dict(json.loads(msg))
			if str(dic['code']) == 'OK':
				print 'Your box has been created successfully'
			else:
				print 'An error has ocurred. Please try again later'
				print 'Details' + str(dic['content'])


def json_put(name, msg):
	j_put = {
		"type": "PUT",                      # Action : Send a message to a box
		"name": str(name),                  # Box Nmae
		"timestamp": int(time.time()),      # Box TimeStamp
		"content": str(msg)                 # Content to be sent to the box
	}
	return str(json.dumps(j_put) + '\r\n')  # Returning a JSON String ending in \r\n


def json_get(name):

	secs = str(int(time.time()))
	name = str(name)
	text = secs + name
	prv_key = RSA.importKey(open('privateKey.pem', 'r').read())
	digest = SHA.new(text)
	signer = PKCS1_PSS.new(prv_key)
	signature = signer.sign(digest)
	sig = base64.encodestring(signature)
	secs = int(time.time())             # Generating the timestamp as an integer
	j_get = {
		"type": "GET",                # Action : Request a Box from the Server
		"name": str(name),            # Box Name
		"timestamp": int(secs),            # TimeStamp
		"sig": sig   # Signature with Box Name, Timestamp and Private Key
	}
	return str(json.dumps(j_get)+'\r\n')    # Returning a JSON String ending in \r\n


def sign_get(name, t):
	key = RSA.importKey(open('privateKey.pem', 'r').read())
	pubk = RSA.importKey(open('publicKey.pem', 'r').read()).exportKey()
	h = SHA.new()
	content = str(pubk + str(name) + str(t))
	h.update(base64.encodestring(content))
	signer = PKCS1_PSS.new(key)
	signature = signer.sign(h)
	return signature

def sign_crbx(name, t):
	key = RSA.importKey(open('privateKey.pem', 'r').read())
	h = SHA.new()
	content = str(str(name)+str(t))
	h.update(base64.encodestring(content))
	signer = PKCS1_PSS.new(key)
	signature = signer.sign(h)
	return signature


def gen_key():
	key = RSA.generate(2048)
	a = open('publicKey.pem', 'w')  # Making sure privateKey exists
	f = open('publicKey.pem', 'r')
	g = open('privateKey.pem', 'w')
	if len(f.read()) < 1:
		a.write(key.publickey().exportKey('PEM'))
		g.write(key.exportKey("PEM"))
		a.close()
		f.close()
		g.close()


def get_privkey():
	f = open('privateKey.pem', 'r')
	tmp_key = RSA.importKey(f.read())
	return tmp_key


def get_pubk():
	f = open('publicKey.pem', 'r')
	tmp_key = str(RSA.importKey(f.read()).exportKey(format='PEM'))
	return tmp_key


def main():
	if len(sys.argv) > 1:
		if sys.argv[1] != "LIST" or "GET" or "PUT" or "GET":
			print "Invalid Arguments"
		else:
			if str(sys.argv[1].upper) == 'LIST':
				list_box()
			elif str(sys.argv[1].upper()) == 'CREATE':
				if len(sys.argv[2]) > 0:
					if sys.argv[2] == "PUBLIC":
						create_box_public(raw_input("Insert box name: "))
					elif sys.argv[2] == 'PRIVATE':
						create_box_private(raw_input("Insert box name: "))
					else:
						print 'Invalid Arguments'
			elif str(sys.argv[1].upper) == 'PUT':
				put_msg()
			elif str(sys.argv[1].upper) == 'GET':
				get_box()

	else:
		while True:
			draw_menu()
			option = str(raw_input().upper())
			if option == 'LIST':
				list_box()

			elif str(option) == 'CREATE':
				box_type_menu()
				command = str(raw_input("WHat box do you want to create?").upper())
				if command == 'PUBLIC':
					create_box_public(raw_input("What will the box's name be?"))
				elif command == 'PRIVATE':
					bname = raw_input("What will the box's name be?")
					create_box_private(bname)
				else:
					print "Invalid option"

			elif str(option) == 'PUT':
				put_msg()
			elif str(option) == 'GET':
				get_box()
			elif str(option) == 'EXIT':
				exit()


gen_key()                   # Generates a pair of keys in case they don't exist
tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_addr = ("xcoa.av.it.pt", 8080)
try:
	tcp_s.connect(server_addr)
except :
	print "Couldn't establish a connection with the server. Either the server or you internet connection is down"
	print("Program will now close")
	exit()
main()