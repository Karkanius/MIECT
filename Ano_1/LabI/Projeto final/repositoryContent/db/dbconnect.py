#encoding : utf-8

import sqlite3 as sql

# O modulo como um todo esta altamente disfuncional e serve apenas para efeitos de teste neste momento
# Qualquer duvida no funcionamento de alguma coisa @Jorge Catarino
# Entretanto isto vai ser convertido para ser uma classe, para poderem usar as funcoes nas mais variadas partes do programa
# tabela data para testes locais, tabela images para testar guardar imagens

#precisa de ser passado para classe


def db_setup(ide,filepath,votes_up, votes_down,category,data,location,author):
		params = (ide,filepath, votes_up, votes_down, category, data, location, author)
		db = sql.connect("database.db")
		try:
			db.execute("INSERT INTO images VALUES(?,?, ?, ?, ?,?,?,?);",params)
			db.commit()
		except:
			db.rollback()
			db.close()

def db_UPdate(ide, uid, vote):
	#	check = db_VerifyVote(ide,uid)
		check = True
		if(check):
			db = sql.connect("database.db");
			param = (ide)
			try:
				if(vote == 1):
					db.execute("UPDATE images SET votes_up = votes_up + 1 WHERE id LIKE ?",(param,))
					db.commit()
					db_regVote(ide,uid,vote)
				elif(vote == -1):
					db.execute("UPDATE images SET votes_down = votes_down + 1 WHERE id LIKE ?",(param,))
					db.commit()
					db_regVote(ide,uid,vote)
			except:
				db.rollback()
				db.close()
		else:
			return False #stil deciding



def db_retDown(ide):
		db = sql.connect("database.db");
		c = db.cursor()
		param = ide
		c.execute("SELECT votes_down FROM data WHERE id = ?",(param,))
		res = c.fetchone()
		return res[0]

def db_retUP(ide):
		db = sql.connect("database.db");
		c = db.cursor()
		param = ide
		c.execute("SELECT votes_up FROM data WHERE id = ?",(param,))
		res = c.fetchone()
		return res[0]


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

def db_regVote(ide, uid, vote):
	db = sql.connect("database.db")
	param = (ide, uid)
	print ide
	print uid
	try:
		if(vote == 1):
			db.execute("UPDATE users SET userVotesUp = userVotesUp || ' ' || ? WHERE uid LIKE ?", (param,))
			db.commit()
		if(vote == -1):
			db.execute("UPDATE users SET userVotesDown = userVotesDown || ' ' || ?  WHERE uid LIKE ?", (param,))
			db.commit()
	except:
		db.rollback()
		db.close()

#def db_regVoteDown(ide, uid):
#	db = sql.connect("database.db")
#	param = (ide, uid)
#	try:
#		db.execute("UPDATE users SET userVotesDown = userVotesDown || ' ' || CAST(? AS TEXT) WHERE uid = ?", (param,))
#		db.commit()
#	except:
#		db.rollback()
#	db.close()

def db_VerifyVote(ide,uid):
	db = sql.connect("database.db")
	c = db.cursor()
	param = uid
	c.execute("SELECT userVotesUp FROM users WHERE uid LIKE ? ", (param,))
	voteStringUP = c.fetchone()
	resUp = voteStringUP[0]
	c.execute("SELECT userVotesDown FROM users WHERE uid LIKE ?" (param,))
	voteStringDOWN = c.fetchone()
	resDown = voteStringDOWN[0]
	print resUp
	print resDown

	listUp = resUp.split()
	listDown = resDown.split()
	print listUp[0]

	for word in listUp:
		if word == str(ide):
			return True
		else:
			return False
	for i in listDown:
		if i == str(ide):
			return True
		else:
			return False



#print db_retUP(1)

#f(db_VerifyVote(100,'id1')):
#	print "Ja votou"
#else:
#	print "Nao votou"
#db_setup("test","/test",2, 3,"MEME",192,"MakerLab","JC")
db_printdb()
db_UPdate("test", "id1", -1)
db_printdb()
