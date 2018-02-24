#encoding : utf-8

import sqlite3 as sql

# O modulo como um todo esta altamente disfuncional e serve apenas para efeitos de teste neste momento
# Qualquer duvida no funcionamento de alguma coisa @Jorge Catarino
# Entretanto isto vai ser convertido para ser uma classe, para poderem usar as funcoes nas mais variadas partes do programa
# tabela data para testes locais, tabela images para testar guardar imagens

class db(object):

	def __init__ (self):
		pass

	def setup(self,ide, filepath, votes_up, votes_down, category, data, location, author):
			params = (ide,filepath, votes_up, votes_down, category, data, location, author)
			db = sql.connect("database.db")
			try:
				db.execute("INSERT INTO images VALUES(?,?, ?, ?, ?,?,?,?);",params)
				db.commit()
			except:
				db.rollback()
				db.close()

	def UPdate(self,ide, uid, vote):
			check = self.VerifyVote(ide,uid)
			if(check == False):
				db = sql.connect("database.db");
				param = (ide)
				print ide
				try:
					if(vote == 1):
						db.execute("UPDATE images SET votes_up = votes_up + 1 WHERE id LIKE ?",(param,))
						db.commit()

					elif(vote == -1):
						db.execute("UPDATE images SET votes_down = votes_down + 1 WHERE id LIKE ?",(param,))
						db.commit()

				except:
					db.rollback()
					db.close()
				db.close()
				self.regVote(ide,uid,vote)
			else:
				return False #stil deciding



	def retDown(self,ide):
		db = sql.connect("database.db");
		c = db.cursor()
		param = ide
		c.execute("SELECT votes_down FROM data WHERE id = ?",(param,))
		res = c.fetchone()
		return res[0]

	def retUP(self,ide):
		db = sql.connect("database.db");
		c = db.cursor()
		param = ide
		c.execute("SELECT votes_up FROM data WHERE id = ?",(param,))
		res = c.fetchone()
		return res[0]

	def retPath(self,ide):
		db = sql.connect("database.db")
		c = db.cursor()
		param = ide
		c.execute("SELECT filepath FROM images WHERE id = ? ", (param,))
		res = c.fetchone()
		return res[0]


	def printdb(self):
		self.rows = self.list()
		for row in self.rows:
			print( row[1] )

	def list(self):
		db = sql.connect("database.db")
		result = db.execute("SELECT * FROM images")  #a base de dados nao contem nada neste momento, portanto devolve uma lista vazia, substituir por images por data para testes
		rows = result.fetchall()
		db.close()
		return rows

	def regVote(self,ide, uid, vote):
		db = sql.connect("database.db")
		param = (ide, uid)
		try:
			if(vote == 1):
				db.execute("UPDATE users SET userVotesUp = userVotesUp || ' ' || ? WHERE uid LIKE ?", param)
				db.commit()
			if(vote == -1):
				db.execute("UPDATE users SET userVotesDown = userVotesDown || ' ' || ?  WHERE uid LIKE ?", param)
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

	def VerifyVote(self,ide,uid):
		db = sql.connect("database.db")
		c = db.cursor()
		param = uid
		c.execute("SELECT userVotesUp FROM users WHERE uid LIKE ?", (param,))
		voteStringUP = c.fetchone()
		resUp = voteStringUP[0]
		c.execute("SELECT userVotesDown FROM users WHERE uid LIKE ?", (param,))
		voteStringDOWN = c.fetchone()
		resDown = voteStringDOWN[0]

		listUp = resUp.split()
		listDown = resDown.split()
		check = False

		for word in listUp:
			if word == str(ide):
				check = True
				break
		for i in listDown:
			if i == str(ide):
				check = True
				break
		return check



	def removeVote(self,ide, uid, vote):
		check = self.VerifyVote(ide,uid)
		if(check == True):
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


#print db_retUP(1)

#f(db_VerifyVote(100,'id1')):
#	print "Ja votou"
#else:
#	print "Nao votou"
#db_setup("test","/test",2, 3,"MEME",192,"MakerLab","JC")
#db_printdb()
#db_UPdate('test', 'id1', -1)
#db_printdb()
