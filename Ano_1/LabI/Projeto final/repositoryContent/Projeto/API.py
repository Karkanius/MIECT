# Authors notes:
# 1) One of the parameters attatched to our images is "location".
#    This was not required by the objectives of this project.
#    However, we considered it to be a good adition to our data.
#
# 2)
#
#
#
#
#
#
#
#
#
#
# encoding: utf-8
import cherrypy
import os.path
import sys
import json
import hashlib
import urllib2
import time
from db import *
from Meme import *
from Effect import *
#from pathlib import Path
#from PIL import Image

# The absolute path to this file's base directory:
baseDir = os.path.dirname(os.path.abspath(__file__))
# Dict with the this app's configuration:
config = {
  "/":       {"tools.staticdir.root": baseDir},

  "/static": {"tools.staticdir.on": True, "tools.staticdir.dir": os.path.join(baseDir, "static")},

}
class Root(object):
	
	def __init__(self):
		self.api = api()

	@cherrypy.expose
	def index(self):
		raise cherrypy.HTTPRedirect("static/html/home.html")

class api(object):
	
	@cherrypy.expose
	def vote(self, picid, nvote):
		fdb = db()
		uid = getUser()
		if (nvote == 1) or (nvote == -1):
			db.UPdate(picid, uid, nvote)
		else:
			return "ERROR: Invalid Vote"

	# DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE
	@cherrypy.expose
	def list(self):
		fdb = db()
		pictures = fdb.list()
		if (len(pictures) != 0):
			dic = [[0 for x in range(6)] for y in range(len(pictures))] 
			i = 0
			for img in pictures:
				dic[i][0] = pictures[i][0]
				dic[i][1] = pictures[i][2]
				dic[i][2] = pictures[i][3]
				dic[i][3] = pictures[i][4]
				dic[i][4] = pictures[i][5]
				dic[i][5] = pictures[i][7]
				i += 1
			jsonContent = json.dumps(dic)
			return jsonContent
		else:
			return "ERROR: Empty database. No pictures to be shown."
	
	# This will receive every groups listing, including our own
	@cherrypy.expose
	def listAll(self):
		portas = urllib2.urlopen("https://xcoa.av.it.pt/labi1617-p2-list").read()
		JSONportas = json.loads(portas)
		JSONlist = list()
		print portas
		print JSONportas
		print JSONportas[0]
		print JSONlist
		num = 0
		for grupo in JSONlist:
			print ""
			try:
				url = "https://xcoa.av.it.pt/labi1617-p2-g" + JSONportas[num][3:] + "/api/list"
				JSONcontent = urllib2.urlopen(url).read()
			except Exception:
				print "Group " + str(num) + ": Empty database."
				JSONlist[num] = []
			else:
				JSONlist[num] = JSONcontent
			num  += 1
			print ""
		print JSONlist
		return JSONlist


	# @cherrypy.expose
	# def imgSave(self, path, filename):
	# 	with open(path, 'r') as img:
	# 		data = img.read()
	# 	img.close()
	# 	encoded_name = hashlib.sha1(data + time.time()).hexdigest() + ".jpg"

	@cherrypy.expose
	def put(self, myFile, category, arg1, arg2, arg3, arg4, location):
		fdb = db()
		fMeme = Meme()
		fEffect = Effect()
		username = self.getUser()
		timestamp = str(time.time())
		if (category == "photo") or (category == "PHOTO"):
			category = "PHOTO"	# Just to make sure all categories are in capital letters
			path = self.upload(myFile)
		elif (category == "meme") or (category == "MEME"):
			category = "MEME"	# Just to make sure all categories are in capital letters
			path = self.upload(myFile)
			fMeme.receiver(path, arg1, arg2, arg3, arg4)
		elif (category == "effect") or (category == "EFFECT"):
			category = "EFFECT"	# Just to make sure all categories are in capital letters
			path = self.upload(myFile)
			fEffect.receiver(path, arg1, arg3)
		else:
			return "ERROR 400: Bad request - Invalid category."
		ide = hashlib.sha1(myFile.filename + category + timestamp).hexdigest()
		fdb.setup(ide, path, 0, 0, category, timestamp, location, username)

	@cherrypy.expose
	def get(self, pic_id):
		path = fdb.retPath(pic_id)	# Returns path associated to pic_id
		raise cherrypy.HTTPRedirect(".."+info, status=301) # Redirect message

	@cherrypy.expose
	def getUser(self):
		username=cherrypy.request.headers.get("X-Remote-User")
		return username

	@cherrypy.expose
	def upload(self, myFile):
		path = os.getcwd() + "/img/"+ myFile.filename
		fo = open(path, 'wb')
		while True:
			data = myFile.file.read(8192)
			if not data:
				break
			fo.write(data)
		fo.close()
		return path

	# # Verifica se existe um ficheiro (imagem) no path escolhido
	# @cherrypy.expose
	# def nameVerif(self, filename, num):
	# 	my_file = Path("/img/"+filename)
	# 	return my_file.is_file()

cherrypy.config.update({"server.socket_port": 10003,})		
cherrypy.server.socket_host = '0.0.0.0'
cherrypy.quickstart(Root(), "/", config)