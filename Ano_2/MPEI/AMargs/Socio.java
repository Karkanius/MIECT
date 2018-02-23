package biblioteca;
import java.util.*;
import MPEI.*;

public class Socio {
	private int id = 0;
	private String nome;
	private Data dataNasc;
	private int nreq;
	private ArrayList<Livro> requisitados = new ArrayList<>();
	private ArrayList<Livro> historico = new ArrayList<>();
	
	public Socio(String nome, Data dataNasc) {
		this.nome = nome;
		this.dataNasc = dataNasc;
		nreq = 0;
	}
	
	public Socio(String nome) {
		this.nome = nome;
		dataNasc = Generator.data();
		nreq = 0;
	}
	
	public Socio () {
		nome = Generator.nome();
		dataNasc = Generator.data();
		nreq = 0;
	}
		
	public boolean isFull() {
		if (nreq >=3)
			return true;
		return false;
	}
	
	public boolean reqLivro(Livro l) {
		if (isFull())
			return false;
		if (requisitados.contains(l))
			return false;
		if (!historico.contains(l))
			historico.add(l);
		requisitados.add(l);
		nreq++;
		return true;
	}
	
	public boolean devLivro(Livro l) {
		if (!requisitados.contains(l))
			return false;
		requisitados.remove(l);
		nreq--;
		return true;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}
	
	public int getnreq() {
		return nreq;
	}

	public Data getDataNasc() {
		return dataNasc;
	}
	
	public boolean isRequisitado(Livro l) {
		if (nreq == 0)
			return false;
		if (getRequisitados().contains(l))
			return true;
		return false;

	}
	
	public String printRequisitados() {
		String str = "\nLivros requisitados:\n";
		for (int i=0; i<nreq; i++) {
			str += getRequisitados().get(i).toString() + "\n";
		}
		return str;
	}
	
	public String printHistorico() {
		String str = "\nHistórico de livros:\n";
		for (int i=0; i<historico.size(); i++) {
			str += getHistorico().get(i).toString() + "\n";
		}
		return str;
	}

	public ArrayList<Livro> getRequisitados() {
		return requisitados;
	}

	public ArrayList<Livro> getHistorico() {
		return historico;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dataNasc == null) ? 0 : dataNasc.hashCode());
		result = prime * result + ((historico == null) ? 0 : historico.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((requisitados == null) ? 0 : requisitados.hashCode());
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
		Socio other = (Socio) obj;
		if (dataNasc == null) {
			if (other.dataNasc != null)
				return false;
		} else if (!dataNasc.equals(other.dataNasc))
			return false;
		if (historico == null) {
			if (other.historico != null)
				return false;
		} else if (!historico.equals(other.historico))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (requisitados == null) {
			if (other.requisitados != null)
				return false;
		} else if (!requisitados.equals(other.requisitados))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Socio #" + id + " " + nome + " Data de nascimento: " + dataNasc;
	}
	
	
	
}
