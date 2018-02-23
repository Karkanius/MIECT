package aula05.prob03;

import java.time.LocalDateTime;

public class Pessoa {
	
	private final String nome;
	private final int cc;
	private final Data dataNasc;
	
	public Pessoa (String nome, int cc, Data data) {
		this.nome = nome;
		this.cc = cc;
		this.dataNasc = data;
	}
	
	public String getNome () { return this.nome; }
	public int getCC () { return this.cc; }
	public Data getDataNasc () { return this.dataNasc; }
	
	public int calcIdade () {
		Data hoje = new Data (LocalDateTime.now().getDayOfMonth(), LocalDateTime.now().getMonthValue(), LocalDateTime.now().getYear());
		return dataNasc.difAnos(hoje);
	}
}