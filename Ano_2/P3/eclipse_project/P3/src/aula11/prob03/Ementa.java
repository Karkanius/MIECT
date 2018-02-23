package aula11.prob03;
import java.util.*;

public class Ementa {
	
	private String nome;
	private String local;
	private @SuppressWarnings("unchecked") LinkedList<Prato> [] ementa = new LinkedList [7];
	
	public Ementa (String nome, String local) {
		this.nome = nome;
		this.local = local;
		for (int i=0; i<7; i++) { ementa[i] = new LinkedList<Prato>(); }
	}
	
	
	public boolean addPrato (Prato p, DiaSemana dia) {	ementa[dia.getValue()].add(p); return true; }


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(ementa);
		result = prime * result + ((local == null) ? 0 : local.hashCode());
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
		Ementa other = (Ementa) obj;
		if (!Arrays.equals(ementa, other.ementa))
			return false;
		if (local == null) {
			if (other.local != null)
				return false;
		} else if (!local.equals(other.local))
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
		return "Ementa"
				+ "\nDomingo\n"
				+ ementa[0].toString()
				+ "\nSegunda\n"
				+ ementa[1].toString()
				+ "\nTerça\n"
				+ ementa[2].toString()
				+ "\nQuarta\n"
				+ ementa[3].toString()
				+ "\nQuinta\n"
				+ ementa[4].toString()
				+ "\nSexta\n"
				+ ementa[5].toString()
				+ "\nSábado\n"
				+ ementa[6].toString();
	}
	
}
