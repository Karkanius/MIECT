# encoding: utf-8
import cherrypy

class Root(object):
    @cherrypy.expose
    def index(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("home-B.html","r").read()


if __name__ == "__main__":
    cherrypy.tree.mount(Root(), config={

        '/ratchet-theme-android-B':
        { 'tools.staticdir.on':True,
          'tools.staticdir.dir': "css/ratchet-theme-android-B.css"
        },

        '/ratchet.css':
        { 'tools.staticfile.on':True,
          'tools.staticfile.filename': "css/ratchet.css"
        },

        '/jquery-2.2.3.min.js':
        { 'tools.staticfile.on':True,
          'tools.staticfile.filename': "js/jquery-2.2.3.min.js"
        },

        '/ratchet.js':
        { 'tools.staticfile.on':True,
          'tools.staticfile.filename': "js/ratchet.js"
        }




    })
    cherrypy.server.start()
