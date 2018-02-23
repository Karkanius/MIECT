package aula05.prob02;

public class BicicletaPolicia extends Bicicleta implements Policia {
	
	private Tipo tipo;
	private String id;
	
	
	public BicicletaPolicia (Cor cor, int ano, Tipo tipo, String id) {
		super (cor, ano);
		this.tipo = tipo;
		this.id = id;
	}
	
	public Tipo getTipo() { return this.tipo; }
	public String getID() {return this.id; }
}
