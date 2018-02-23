package aula13.prob01.v01;

public class Localidade extends Regiao {

	//---Atributos---
	private TipoLocalidade tipo;

	
	//---Construtores---
	public Localidade(String nome, int populacao, TipoLocalidade tipo) {
		super(nome, populacao);
		this.tipo = tipo;
	}

	
	//---Métodos---
	//-Getters-
	public TipoLocalidade getTipo() { return this.tipo; }

	//-Setters-
	public void setTipo(TipoLocalidade tipo) { this.tipo = tipo; }

	//-Outros-
	public boolean isCidade() { return this.tipo.equals(TipoLocalidade.CIDADE); }

	//-HashCode-
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		return result;
	}

	//-Equals-
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Localidade other = (Localidade) obj;
		if (tipo != other.tipo)
			return false;
		return true;
	}

	//-toString-
	@Override
	public String toString() { return tipo.toString().substring(0, 1).toUpperCase()+tipo.toString().substring(1).toLowerCase()+" "+super.getNome()+", populaçao "+super.getPopulacao(); }
	
}
