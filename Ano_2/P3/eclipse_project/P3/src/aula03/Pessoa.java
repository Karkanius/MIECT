package aula03;
import aula03.Data;

public class Pessoa {
	
	private final String nome;
	private final int cc;
	private final Data dataNasc;
	
	public Pessoa (String nome, int cc, Data data) {
		this.nome = nome;
		this.cc = cc;
		this.dataNasc = data;
	}
	
	public String getNome () { return this.nome;}
	public int getCC () { return this.cc;}
	public Data getDataNasc () { return this.dataNasc;}
	
	
	@Override public String toString () {
		return (this.nome+
				", CC: "+this.cc+
				", Data de Nascimento: "+this.dataNasc.toString());
	}
}