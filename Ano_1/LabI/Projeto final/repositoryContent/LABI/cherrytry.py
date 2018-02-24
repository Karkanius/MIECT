# encoding: utf-8
import cherrypy
import os.path
import sys

 # The absolute path to this file's base directory:
baseDir = os.path.dirname(os.path.abspath(__file__))
# Dict with the this app's configuration:
config = {
  "/":     { "tools.staticdir.root": baseDir},
  "/static":   { "tools.staticdir.on": True,
             "tools.staticdir.dir": "static" },
  "/js":   { "tools.staticdir.on": True,
             "tools.staticdir.dir": "js" },
  "/css":  { "tools.staticdir.on": True,
             "tools.staticdir.dir": "css" },
  "/fonts":  { "tools.staticdir.on": True,
             "tools.staticdir.dir": "fonts" },
  "/assets":  { "tools.staticdir.on": True,
             "tools.staticdir.dir": "assets" },
  "/static":  { "tools.staticdir.on": True,
             "tools.staticdir.dir": "static" },
}

class Root(object):
    @cherrypy.expose
    def index(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("home-B.html")

cherrypy.quickstart(Root(),"/", config)
