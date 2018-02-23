package aula05.prob02;

public abstract class Motorizado extends Veiculo {
	
	public Matricula matricula;
	public int cilindrada;
	public int velMax;
	public double consumo;
	public double combustivel;

	
	public Motorizado (int numRodas, Cor cor, int ano, Matricula matricula, int cilindrada, int velMax, double consumo, double combustivel) {
		super (numRodas, cor, ano);
		this.matricula = matricula;
		this.cilindrada = cilindrada;
		this.velMax = velMax;
		this.consumo = consumo;
		this.combustivel = combustivel;
	}
	
	public int getPotencia() { return cilindrada; }
	public double getConsumo() { return consumo; }
	public double getCombustivel() { return combustivel; }
	
	@Override
	public String toString () { return
			"VEÍCULO MOTORIZADO"+
			"\nCor: "+super.cor+
			"\nAno: "+super.ano+
			"\nMatrícula: "+this.matricula.toString()+
			"\nCilindrada: "+this.cilindrada+
			"\nVelocidade Máxima: "+this.velMax;
	}
}
