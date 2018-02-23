package aula05.prob02;

public class AutomovelPolicia extends Automovel implements Policia {
	
	private Tipo tipo;
	private String id;
	
	
	public AutomovelPolicia (Cor cor, int ano, Matricula matricula, int cilindrada, int velMax, double consumo, double combustivel, Tipo tipo, String id) {
		super (cor, ano, matricula, cilindrada, velMax, consumo, combustivel);
		this.tipo = tipo;
		this.id = id;
	}
	
	public Tipo getTipo() { return this.tipo; }
	public String getID() {return this.id; }
}
