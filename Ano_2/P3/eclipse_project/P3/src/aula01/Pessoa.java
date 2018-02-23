package aula01;

public class Pessoa {
	
	private final String nome;
	private final int cc;
	private final Data dataNasc;
	
	Pessoa (String nome, int cc, Data data) {
		this.nome = nome;
		this.cc = cc;
		this.dataNasc = data;
	}
	
	public String getNome () { return this.nome;}
	public int getCC () { return this.cc;}
	public Data getDataNasc () { return this.dataNasc;}
}