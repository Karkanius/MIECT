package aula11.prob03;
import java.util.*;

public class Prato implements Comparable<Prato> {

	public String nome;
	public LinkedList<Alimento> composicao = new LinkedList<Alimento> ();
	public double calorias = 0;
	
	
	public Prato (String nome) {
		this.nome = nome;
	}
	
	
	public boolean addIngrediente (Alimento alimento) { composicao.add(alimento); return true; }
	
	
	public int compareTo (Prato obj) {
		if (this.calorias == obj.calorias) { return 0; }
		else if (this.calorias < obj.calorias) { return -1; }
		else { return 1; }
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(calorias);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((composicao == null) ? 0 : composicao.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prato other = (Prato) obj;
		if (Double.doubleToLongBits(calorias) != Double.doubleToLongBits(other.calorias))
			return false;
		if (composicao == null) {
			if (other.composicao != null)
				return false;
		} else if (!composicao.equals(other.composicao))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Prato Normal \"" + nome + "\" composto por " + composicao.size() + " ingredientes";
	}	
	
}
