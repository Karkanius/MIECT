package aula13.prob01.v02;

public class Regiao {

	//---Atributos---
	private String nome;
	private int populacao;

	
	//---Construtores---
	public Regiao(String nome, int populacao) {
		this.nome = nome;
		this.populacao = populacao;
	}

	
	//---Métodos---
	//-Getters-
	public String getNome() { return nome; }
	public int getPopulacao() { return populacao; }

	//-Setters-
	public void setNome(String nome) { this.nome = nome; }
	public void setPopulacao(int populacao) { this.populacao = populacao; }

	//-HashCode-
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + populacao;
		return result;
	}

	//-Equals-
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Regiao other = (Regiao) obj;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (populacao != other.populacao)
			return false;
		return true;
	}

	//-toString-
	@Override
	public String toString() {
		return "Regiao "+this.nome+", populaçao "+this.populacao;
	}
	
	
}
