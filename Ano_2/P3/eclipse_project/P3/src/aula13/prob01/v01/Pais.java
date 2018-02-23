package aula13.prob01.v01;

import java.util.HashSet;
import java.util.Set;

public class Pais {

	//---Atributos---
	private String nome = "";
	private Localidade capital = null;
	private Set<Regiao> regioes = new HashSet<Regiao>();
	
	
	//---Construtores---
	public Pais(String nome) {
		this.nome = nome;
		this.capital = null;
	}
	
	public Pais(String nome, Localidade capital) {
		this.nome = nome;
		if(!capital.isCidade())	{ throw new IllegalArgumentException("Capital Inválida"); }
		else					{ this.capital = capital; }
	}

	
	//---Métodos---
	//-Getters-
	public String getNome() { return nome; }
	public Localidade getCapital() { return capital; }
	public Set<Regiao> getRegioes() { return regioes; }

	//-Setters-
	public void setNome(String nome) { this.nome = nome; }
	public void setCapital(Localidade capital) {
		if(!capital.isCidade())	{ throw new IllegalArgumentException("Capital Inválida"); }
		else					{ this.capital = capital; }
	}
	public void setRegioes(Set<Regiao> regioes) { this.regioes = regioes; }
	
	//-Outros-
	public void addRegiao(Regiao r) { regioes.add(r); }
	public int getPopulacaoTotal() {
		int pop=0;
		for(Regiao r : regioes) { pop+=r.getPopulacao(); }
		return pop;
	}

	//-HashCode-
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((capital == null) ? 0 : capital.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((regioes == null) ? 0 : regioes.hashCode());
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
		Pais other = (Pais) obj;
		if (capital == null) {
			if (other.capital != null)
				return false;
		} else if (!capital.equals(other.capital))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (regioes == null) {
			if (other.regioes != null)
				return false;
		} else if (!regioes.equals(other.regioes))
			return false;
		return true;
	}

	//-toString-
	@Override
	public String toString() {
		String str = "Pais: "+this.nome+
			", Populaçao: "+this.getPopulacaoTotal()+
			" (Capital: ";
		if (this.capital!=null)	{ str+=capital.toString(); }
		else					{ str+="*Indefinida*"; }
		str+=")";
		return str;
	}
	
	
}
