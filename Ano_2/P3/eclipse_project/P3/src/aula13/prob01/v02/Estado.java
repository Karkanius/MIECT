package aula13.prob01.v02;

public class Estado extends Regiao {

	//---Atributos---
	private Localidade<Cidade> capital;

	
	//---Construtores---
	public Estado(String nome, int populacao, Localidade<Cidade> capital) {
		super(nome, populacao);
		this.capital = capital;
	}

	
	//---Métodos---
	//-Getters-
	public Localidade<Cidade> getCapital() { return this.capital; }

	//-Setters-
	public void setCapital(Localidade<Cidade> capital) { this.capital = capital; }

	//-HashCode-
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((capital == null) ? 0 : capital.hashCode());
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
		Estado other = (Estado) obj;
		if (capital == null) {
			if (other.capital != null)
				return false;
		} else if (!capital.equals(other.capital))
			return false;
		return true;
	}

	//-toString-
	@Override
	public String toString() { return super.toString()+", capital "+this.capital; }

}
