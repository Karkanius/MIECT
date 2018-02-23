package aula05.prob02;

public class Bicicleta extends Veiculo {

	public Bicicleta (Cor cor, int ano) {
		super (2, cor, ano);
	}
	
	@Override
	public String toString () { return
			"BICICLETA"+
			"\nCor: "+super.cor+
			"\nAno: "+super.ano;
	}
}
