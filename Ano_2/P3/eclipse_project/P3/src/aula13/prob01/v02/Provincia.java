package aula13.prob01.v02;

public class Provincia extends Regiao {

	//---Atributos---
	private String governador;

	
	//---Construtores---
	public Provincia(String nome, int populacao, String governador) {
		super(nome, populacao);
		this.governador = governador;
	}

	
	//---Métodos---
	//-Getters-
	public String getGovernador() { return this.governador; }

	//-Setters-
	public void setGovernador(String governador) { this.governador = governador; }

}
