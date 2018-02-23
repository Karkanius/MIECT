package aula05.prob02;

public class Automovel extends Motorizado {

	public Automovel (Cor cor, int ano, Matricula matricula, int cilindrada, int velMax, double consumo, double combustivel) {
		super (4, cor, ano, matricula, cilindrada, velMax, consumo, combustivel);
	}
	
	@Override
	public String toString () { return
			"AUTOMÓVEL"+
			"\nCor: "+super.cor+
			"\nAno: "+super.ano+
			"\nMatrícula: "+super.matricula.toString()+
			"\nCilindrada: "+super.cilindrada+
			"\nVelocidade Máxima: "+super.velMax;
	}
}
