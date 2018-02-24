#encoding : utf-8

import sqlite3 as sql

def db_removeVote(ide, uid, vote):
    check = False
    if(check == False):
        db = sql.connect("database.db")
        c = db.cursor()
        param = uid
        if(vote == 1):
            c.execute("SELECT userVotesUp FROM users WHERE uid LIKE ?", (param,))
            voteStringUP = c.fetchone()
            resUp = voteStringUP[0]
            listUp = resUp.split()
            listUp.remove(ide)
            newEl = ' '.join(listUp)
            params = (newEl, uid)
            try:
                db.execute("UPDATE users SET userVotesUp = ? WHERE uid LIKE ?", params)
                db.execute("UPDATE images SET votes_up = votes_up - 1 WHERE id LIKE ?",(ide,))
                db.commit()
            except:
                db.rollback()
                db.close()
        if(vote == -1):
            c.execute("SELECT userVotesDown FROM users WHERE uid LIKE ?", (param,))
            voteStringDOWN = c.fetchone()
            resDown = voteStringDOWN[0]
            listDown = resDown.split()
            listDown.remove(ide)
            newEl = ' '.join(listDown)
            params = (newEl, uid)
            try:
                db.execute("UPDATE users SET userVotesDown = ? WHERE uid LIKE ?", params)
                db.execute("UPDATE images SET votes_down = votes_down - 1 WHERE id LIKE ?",(ide,))
                db.commit()
            except:
                db.rollback()
                db.close()

def db_printdb():
	rows = db_list()
	for row in rows:
		print( row )

def db_list():
	db = sql.connect("database.db")
	result = db.execute("SELECT * FROM users")  #a base de dados nao contem nada neste momento, portanto devolve uma lista vazia, substituir por images por data para testes
	rows = result.fetchall()
	db.close()
	return rows
db_printdb()
db_removeVote('test', 'id1', -1)
db_printdb()
