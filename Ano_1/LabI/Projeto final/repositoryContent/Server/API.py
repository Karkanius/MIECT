# encoding: utf-8
import cherrypy
import os.path
import sys
import json

# The absolute path to this file's base directory:
baseDir = os.path.dirname(os.path.abspath(__file__))
# Dict with the this app's configuration:
config = {
  "/":       {"tools.staticdir.root": baseDir},

  "/static": {"tools.staticdir.on": True, "tools.staticdir.dir": "static"},

  "/js":     {"tools.staticdir.on": True, "tools.staticdir.dir": "js"},

  "/css":    {"tools.staticdir.on": True, "tools.staticdir.dir": "css"},

  "/fonts":  {"tools.staticdir.on": True, "tools.staticdir.dir": "fonts"},

  "/assets": {"tools.staticdir.on": True, "tools.staticdir.dir": "assets"},
}


class Root(object):

    @cherrypy.expose
    def index(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("home.html")

    @cherrypy.expose
    def vote(self, id, uid, nvote):
        if nvote == 1:
            # To be added: verification
            db_UPdate(id)
        elif nvote == -1:
            # To be added: verification
            db_DOWNdate(id)
        else:
            return "ERROR: Invalid Vote"

    @cherrypy.expose
    def list(self):
        pictures = db_list()
        dic
        for photo in pictures.length:
            dic["id"] = pictures[photo]["id"]
            dic["votes_up"] = pictures[photo]["votes_up"]
            dic["votes_down"] = pictures[photo]["votes_down"]
            dic["category"] = pictures[photo]["category"]
            dic["date"] = pictures[photo]["date"]
            dic["author"] = pictures[photo]["author"]
        return dic

    @cherrypy.expose
    def listAll(self):
        return"Development in progress"

    @cherrypy.expose
    def put(self, ):
        return"Development in progress"

    @cherrypy.expose
    def get(self):
        return"Development in progress"
