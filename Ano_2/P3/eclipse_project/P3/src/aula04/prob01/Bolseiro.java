package aula04.prob01;

public class Bolseiro extends Estudante {
	
	double bolsa;

	
	public Bolseiro (String nome, int cc, Data dataNasc) {
		super (nome, cc, dataNasc);
		this.bolsa = 0;
	}
	
	
	public Bolseiro (String nome, int cc, Data dataNasc, double bolsa) {
		super (nome, cc, dataNasc);
		this.bolsa = bolsa;
	}
	
	
	public Bolseiro (String nome, int cc, Data dataNasc, Data dataInsc, double bolsa) {
		super (nome, cc, dataNasc, dataInsc);
		this.bolsa = bolsa;
	}
	
	
	public double getBolsa () { return this.bolsa; }
	public void setBolsa (double value) { this.bolsa = value; }
	
	
	@Override public String toString () {
		return (super.getNome()+
				", CC: "+super.getCC()+
				", Data de Nascimento: "+super.getDataNasc().toString()+
				", NMec: "+super.getNMec()+
				", inscrito em: "+super.getDataInsc().toString()+
				", Bolsa: "+this.bolsa);
	}
}
