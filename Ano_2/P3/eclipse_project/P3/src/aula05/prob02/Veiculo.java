package aula05.prob02;

public abstract class Veiculo {
	
	public int numRodas;
	public Cor cor;
	public int ano;
	
	
	public Veiculo (int numRodas, Cor cor, int ano) {
		this.numRodas = numRodas;
		this.cor = cor;
		this.ano = ano;
	}
	
	@Override
	public String toString () { return
			"VEÍCULO"+
			"\nCor: "+this.cor+
			"\nAno: "+this.ano;
	}
}
