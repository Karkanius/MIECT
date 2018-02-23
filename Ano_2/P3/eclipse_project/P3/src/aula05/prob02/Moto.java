package aula05.prob02;

public class Moto extends Motorizado {

	public Moto (Cor cor, int ano, Matricula matricula, int cilindrada, int velMax, double consumo, double combustivel) {
		super (2, cor, ano, matricula, cilindrada, velMax, consumo, combustivel);
	}
	
	@Override
	public String toString () { return
			"MOTO"+
			"\nCor: "+super.cor+
			"\nAno: "+super.ano+
			"\nMatrícula: "+super.matricula.toString()+
			"\nCilindrada: "+super.cilindrada+
			"\nVelocidade Máxima: "+super.velMax;
	}
}
