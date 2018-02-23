package biblioteca;
import java.util.*;

public class ListaLivros {
	public ArrayList<Livro> livros = new ArrayList<>();
	public ArrayList<Integer> qtdTotal = new ArrayList<>();
	public ArrayList<Integer> qtdDsp = new ArrayList<>();
	
	public int qtdDsp(Livro l) {
		return qtdDsp.get(livros.indexOf(l));
	}
	
	public int qtdTotal(Livro l) {
		return qtdTotal.get(livros.indexOf(l));
	}
	
	public Livro getLivro(int i) {
		return livros.get(i);
	}
	
	public int getLivroIndex(Livro l) {
		if (!livros.contains(l))
			return -1;
		return livros.indexOf(l);
	}
	
	public ArrayList<Livro> getLivros() {
		return livros;
	}
	
	public ArrayList<Livro> getLivrosDsp() {
		ArrayList<Livro> tmp = new ArrayList<>();
		for (int i=0; i<livros.size(); i++) {
			if (qtdDsp.get(i) > 0)
				tmp.add(livros.get(i));
		}
		return tmp;
	}
	
	public int size() {
		return livros.size();
	}
	
	public boolean addLivro(Livro l, int qtd) {
		if (size() > 0)
			for (int i=0; i<size(); i++) {
				if (l.getTitulo().equals(livros.get(i).getTitulo()))
					return false;
			}
		livros.add(l);
		l.setId(livros.size());
		qtdTotal.add(qtd);
		qtdDsp.add(qtd);
		return true;
	}
	
	
	
	public boolean rmvLivro(Livro l) {
		if (!livros.contains(l))
			return false;
		qtdTotal.remove(qtdTotal(l));
		qtdDsp.remove(qtdDsp(l));
		livros.remove(l);
		return true;
	}
	
	public boolean addUnidade(Livro l, int qtd) {
		if (!livros.contains(l))
			return false;
		qtdDsp.set(qtdDsp(l), qtdDsp(l)+qtd);
		qtdTotal.set(qtdTotal(l), qtdTotal(l)+qtd);
		return true;
	}
	
	public boolean rmvUnidade(Livro l, int qtd) {
		if (!livros.contains(l))
			return false;
		if 	(qtd > qtdDsp(l)) 
			return false;
		qtdDsp.set(qtdDsp(l), qtdDsp(l)+qtd);
		qtdTotal.set(qtdTotal(l), qtdTotal(l)+qtd);
		return true;
	}
	
	public boolean reqLivro(Livro l) {
		if (!livros.contains(l))
			return false;
		if (qtdDsp(l) == 0) 
			return false;
		qtdDsp.set(getLivroIndex(l), qtdDsp(l)-1);
		return true;
	}
	
	public boolean devLivro(Livro l) {
		if (!livros.contains(l))
			return false;
		if (qtdDsp(l) == qtdTotal(l)) 
			return false;
		qtdDsp.set(getLivroIndex(l), qtdDsp(l)+1);
		return true;
	}
	
	@Override
	public String toString() {
		String str = "Livros disponiveis na biblioteca: \nTitulo";
		for (int s = 0; s<73; s++) { 
			str += " ";
			if (s == 71)
				str += "|";
		}
		str+= "Qtd tot |  Qtd disp";
		
		for (int i = 0; i<livros.size(); i++) {
			str += "\n" + livros.get(i).toString();
			int tmp = 79-livros.get(i).toString().length();
			for (int s = 0; s<tmp; s++) {
				str += " ";
				if (s==tmp-2)
					str += "|";
			}
			if (qtdTotal.get(i) < 10)
				str += qtdTotal.get(i) + "       |   ";
			else
				str += qtdTotal.get(i) + "      |   ";
			str += qtdDsp.get(i);
		}
		return str;
	}
	
}
