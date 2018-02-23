package biblioteca;
import java.util.*;
import MPEI.*;

public class Biblioteca {
	private ArrayList<Socio> listaSocios = new ArrayList<>();
	private ListaLivros listaLivros = new ListaLivros();
	private BloomFilter filterSocios;
	private CountingFilter filterLivros;
	
	public Biblioteca() {}
	public Biblioteca(int socios, int livros){
		filterSocios = new BloomFilter((int)(socios*1.25));
		filterLivros = new CountingFilter((int)(livros*1.25));
		String[] autores = Generator.autores(livros/5);				//Gerar autores dos livros
		
		for (int l=0; l<livros; l++) {								//Gerar lista de livros
			int q = (int)Math.floor(1+Math.random()*(livros/150));
			addLivro(Generator.livro(autores),q);
		}
		
		for (int s=0; s<socios; s++) {								//Gerar lista de socios
			addSocio(Generator.socio());
		}
		
		for (int h=0; h<livros/10; h++) {							//Req e dev livros (criar histórico)
			randomReq();
			randomDev();
		}	
	}
	
	public boolean addSocio(Socio s) {
		if (listaSocios.contains(s))
			return false;
		listaSocios.add(s);
		s.setId(listaSocios.size());
		filterSocios.Insert(s.getNome());
		return true;
	}
	
	public boolean addLivro(Livro l, int q) {
		if (listaLivros.addLivro(l, q)) {
			for (int i=0; i<q; i++) {
				filterLivros.Insert(l.getTitulo());
			}
			return true;
		}
		return false;
	}
	
	public boolean rmvLivro(Livro l) {
		for (int i=0; i<listaSocios.size(); i++) {
			if (listaSocios.get(i).getRequisitados().contains(l))
				return false;
		}
		if (listaLivros.rmvLivro(l)) {
			filterLivros.remove(l.getTitulo());
			return true;
		}
		return false;
	}
	
	public boolean reqLivro(Livro l, Socio s) {
		boolean tmp = listaLivros.reqLivro(l);
		if (!tmp)
			return false;
		if (s.isFull())
			return false;
		s.reqLivro(l);
		return true;
	}
	
	public boolean devLivro(Livro l, Socio s) {
		boolean tmp = listaLivros.devLivro(l);
		if (!tmp)
			return false;
		if (!s.isRequisitado(l))
			return false;
		s.devLivro(l);
		return true;
	}
	
	public boolean randomReq() {
		for (int i=0; i<listaSocios.size(); i++) {					
			if (Math.random() >= 0.4) {
				int nreq = (int)Math.floor(Math.random()*2);
				for (int j=0; j<=nreq; j++) {
					int refLivro = (int)Math.floor(Math.random()*listaLivros.size());
					reqLivro(listaLivros.getLivro(refLivro), listaSocios.get(i));
				}
			}
		}
		return true;
	}
	
	public boolean randomDev() {
		for (int i=0; i<listaSocios.size(); i++) {	
			if (listaSocios.get(i).getnreq()>0) {
				int ndev = (int)Math.floor((Math.random()*listaSocios.get(i).getnreq())-1);
					for (int j=0; j<=ndev; j++) {
						devLivro(listaSocios.get(i).getRequisitados().get(j), listaSocios.get(i));
					}
			}
		}
		return true;
	}
	
	public int findSocio(String s) {
		if (filterSocios.isMember(s)) {
			for (int i=0; i<listaSocios.size(); i++) {
				if (listaSocios.get(i).getNome().equals(s))
					return i+1;
			}
		}
		return 0;
	}
	
	public int findLivro(String l) {
		if (filterLivros.isMember(l)) {
			for (int i=0; i<listaLivros.size(); i++) {
				if (listaLivros.getLivro(i).getTitulo().equals(l))
					return i+1;
			}
		}
		return 0;
	}
	
	public ArrayList<String> sugerir(int s) {
		List<String> titulos = new ArrayList<>();
		ArrayList<String> recomendados = new ArrayList<>();
		
		for (int i=0; i<getListaSocios().get(s).getHistorico().size(); i++) {			//Converte histórico do sócio selecionado
			titulos.add(getListaSocios().get(s).getHistorico().get(i).toString());	//para uma lista de strings
		}
		
		minHashing mh = new minHashing(titulos, 3);
		int[] sign = mh.init();									//assinatura da lista de livros do sócio escolhido
		
		for (int j=0; j<getListaSocios().size(); j++) {
			List<String> hist = new ArrayList<>();
			for (int i=0; i<getListaSocios().get(j).getHistorico().size(); i++) {	//Converte histórico do sócio j
				hist.add(getListaSocios().get(j).getHistorico().get(i).toString()); //para uma lista de strings
			}
			
			minHashing mhj = new minHashing(hist, 3);
			int [] signj = mhj.init();									//assinatura da lista j
			
			double sim = minHashing.similarity(sign, signj);			//indice de similaridade com o sócio j
			
			if (sim > 0.3) {
				for (int i=0; i<hist.size(); i++) {
					if (!titulos.contains(hist.get(i))) {
						recomendados.add(hist.get(i));
					}
				}
			}
		}
		
		return recomendados;
	}
	
	public ArrayList<Socio> getListaSocios() {
		return listaSocios;
	}
	
	public ListaLivros getListaLivros() {
		return listaLivros;
	}
	
	public BloomFilter getFilterSocios() {
		return filterSocios;
	}
	
	public CountingFilter getFilterLivros() {
		return filterLivros;
	}
	
	public String printSocios() {
		String str = "Lista de Sócios:\n";
		for (int i=0; i<listaSocios.size(); i++) {
			str += "\n" + listaSocios.get(i).toString() + "\n";
		}
		return str;
	}
	
	public String printLivros() {
		return listaLivros.toString();
	}
	
	@Override
	public String toString() {
		String str = "Biblioteca\n";
		str += "Lista de Sócios:\n";
		str += listaSocios.toString() + "\n";
		str += listaLivros.toString();
		return str;
	}

}