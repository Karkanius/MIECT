package aula09.prob03;

public class Pessoa {
	
	private final String nome;
	private final int cc;
	private final Date dataNasc;
	
	public Pessoa (String nome, int cc, Date data) {
		this.nome = nome;
		this.cc = cc;
		this.dataNasc = data;
	}
	
	public String getNome () { return this.nome; }
	public int getCC () { return this.cc; }
	public Date getDataNasc () { return this.dataNasc; }
	
	public int calcIdade () {
		return dataNasc.difYears(Date.today());
	}
}