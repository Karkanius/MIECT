package aula01;
import java.util.*;

public class ex02 {
	
	static Scanner sc = new Scanner (System.in);
	
	public static void main(String[] args) {
		
		LinkedList <Pessoa> lista = new LinkedList <Pessoa> ();
		int op=0, op2=0;
		
		do {
			op=Menu();
			if (op==1) {
				Pessoa p = createPessoa();
				lista.add(p);
			}
			else if (op==2) {
				Pessoa p = createPessoa();
				if (lista.contains(p)) {
					lista.remove(p);
				}
				else {
					System.out.println("A pessoa introduzida não se encontra nos registos.");
				}
			}
			else if (op==3) {
				System.out.println();
				System.out.println("1 - Ordenar por Nome");
				System.out.println("2 - Ordenar por CC");
				System.out.println("3 - Voltar atrás");
				System.out.print("» ");
				op2 = Integer.parseInt(sc.nextLine());
				if (op2==1) { printList(orderByName(lista)); }
				else if (op2==2) { printList(orderByCC(lista)); }
				else if (op2!=3) {System.out.println("ERROR: Opção Inválida.");}
			}
			else if (op==4) {
				System.exit(0);
			}
			else {
				System.out.println("ERROR: Opção Inválida.");
			}
		} while (op!=4);

	}
	
//--------------------------------------------------------------------------------
//--------------------------FUNÇÕES----AUXILIARES---------------------------------
//--------------------------------------------------------------------------------
	
	public boolean validData (Data data) {
		
		// Ano bissexto
		boolean bis = false;
		if ((data.getAno()%400==0) || (data.getAno()%100!=0 && data.getAno()%4==0)) {
			bis = true;
		}
		
		// Dias não positivos & Meses fora do seu domínio
		if (data.getDia()<=0||data.getMes()<=0||data.getMes()>12) {return false;}
		
		// Dias fora do seu domínio
		int [] months31 = {1, 3, 5, 7, 8, 10, 12};
		int [] months30 = {4, 6, 9, 11};
		
		int diasMes=0;
		
		for (int i=0; i<months31.length; i++) {
			if (months31[i] == data.getMes()) {
				diasMes=31;
				break;
			}
		}
		
		if (diasMes==0) {
			for (int i=0; i<months30.length; i++) {
				if (months30[i] == data.getMes()) {
					diasMes=30;
					break;
				}
			}
		}
		
		if (diasMes==0) {
			if (bis) {diasMes=29;}
			else {diasMes=28;}
		}
		
		if (data.getDia()>diasMes) {return false;}
		
		return true;
	}
	
	
	public static int Menu () {
		System.out.println();
		System.out.println();
		
		System.out.println("1 - Introduzir uma nova pessoa");
		System.out.println("2 - Apagar uma pessoa existente");
		System.out.println("3 - Consultar a lista de pessoas");
		System.out.println("4 - Terminar programa");
		System.out.print("» ");
		return (Integer.parseInt(sc.nextLine()));
		
	}
	
	
	public static void printList (LinkedList<Pessoa> lista) {
		
		int s = lista.size();
		System.out.println("Nome | Número CC | dataNasc");
		
		for (int i=0; i<s; i++) {
			System.out.println(lista.getFirst().getNome()+" | "+lista.getFirst().getCC()+" | "+lista.getFirst().getDataNasc().getDia()+"/"+lista.getFirst().getDataNasc().getMes()+"/"+lista.getFirst().getDataNasc().getAno());
			lista.addLast(lista.getFirst());
			lista.removeFirst();
		}
	}
	
	
	public static LinkedList <Pessoa> orderByName (LinkedList <Pessoa> lista) {
		for (int i=0; i<lista.size()-1; i++) {
			for (int j=i+1; j<lista.size(); j++) {
				Pessoa p1 = lista.get(i);
				Pessoa p2 = lista.get(j);
				if (p2.getNome().compareTo(p1.getNome()) < 0) {
					lista.set(i, p2);
					lista.set(j, p1);
				}
			}
		}
		return lista;
	}
	
	
	public static LinkedList <Pessoa> orderByCC (LinkedList <Pessoa> lista) {
		for (int i=0; i<lista.size()-1; i++) {
			for (int j=i+1; j<lista.size(); j++) {
				Pessoa p1 = lista.get(i);
				Pessoa p2 = lista.get(j);
				if (p2.getCC() < p1.getCC()) {
					lista.set(i, p2);
					lista.set(j, p1);
				}
			}
		}
		return lista;
	}
	
	
	public static Pessoa createPessoa () {
		String [] data = new String [5];
		System.out.print("Nome: ");
		data[0] = sc.nextLine();
		System.out.print("Número de CC: ");
		data[1] = sc.nextLine();
		System.out.println("Data de Nascimento");
		System.out.print("Dia: ");
		data[2] = sc.nextLine();
		System.out.print("Mês: ");
		data[3] = sc.nextLine();
		System.out.print("Ano: ");
		data[4] = sc.nextLine();
		Data d = new Data (Integer.parseInt(data[2]), Integer.parseInt(data[3]), Integer.parseInt(data[4]));
		Pessoa p = new Pessoa (data[0], Integer.parseInt(data[1]), d);
		return p;
	}
}
