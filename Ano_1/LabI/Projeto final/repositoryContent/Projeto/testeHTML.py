import cherrypy
import os.path
import sys
import json
import hashlib
import urllib2
from db import *

baseDir = os.path.dirname(os.path.abspath(__file__))
# Dict with the this app's configuration:
config = {
  "/":       {"tools.staticdir.root": baseDir},

  "/static": {"tools.staticdir.on": True, "tools.staticdir.dir": "static"},

  "/js":     {"tools.staticdir.on": True, "tools.staticdir.dir": "js"},

  "/css":    {"tools.staticdir.on": True, "tools.staticidr.dir": "css"},

  "/fonts":  {"tools.staticdir.on": True, "tools.staticdir.dir": "fonts"},

  "/assets": {"tools.staticdir.on": True, "tools.staticdir.dir": "assets"},

  "/img": {"tools.staticdir.on": True, "tools.staticdir.dir": "img"},
  
  "/html": {"tools.staticdir.on": True, "tools.staticdir.dir": "html"},
}
class Root(object):

	@cherrypy.expose
	def index(self):
		raise cherrypy.HTTPRedirect("html/home.html")


cherrypy.config.update({"server.socket_port": 10003,})		
cherrypy.server.socket_host = '0.0.0.0'
cherrypy.quickstart(Root(), "/", config)