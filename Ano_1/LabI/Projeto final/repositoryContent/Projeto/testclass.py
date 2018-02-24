#encoding : utf-8
from db import db

def main():
    datab = db()
#    datab.setup("fe34r3", "/isto/vai/ser/apagado", 0, 0, "MEME", 4565432345, "MakerLab", "JC")

#    datab.removeVote("fe34r3", "id1", -1)
#    datab.UPdate("fe34r3", "id1", 1)
#    datab.printdb()

    print datab.retPath("fe34r3")

main()
