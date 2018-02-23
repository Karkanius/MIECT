package aula13.prob03;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Scanner;

public class BrincaAndBeira {
	
	static List<String> funcionarios = new ArrayList<String>();
	static HashMap<String, String> brinquedoGratis = new HashMap<String, String>();
	static List<String> brinquedos = new LinkedList<String>();
	static AmountList<String> nomesMaisPopulares = new AmountList<String>();
	
	static Scanner sc = new Scanner (System.in);
	
	public static void main(String[] args) {
		
		funcionarios.add("Zé da Viola");
		funcionarios.add("Zé Maria");
		funcionarios.add("António Júlio");
		funcionarios.add("Dona Albertina");
		
		brinquedos.add("Transformer");
		brinquedos.add("Jogo do galo");
		brinquedos.add("Monopólio");
		brinquedos.add("Boneca");
		brinquedos.add("Lego");
		
		
		String [] mainMenu = {"Adicionar Funcionário", "Adicionar Brinquedo", "Brinquedo Grátis Mensal", "Renomear Segundo Nomes", "Terminar programa"};
		
		
		int op = 0;
		do {
			try {
				op = menu(mainMenu);
				switch(op) {
					case 1:
						funcionarios.add(read("Nome do Funcionário"));
					break;
					case 2:
						brinquedos.add(read("Nome do Brinquedo"));
					break;
					case 3:
						atribuirBrinquedo();
					break;
					case 4:
						renomearSegundoPopularidade();
					break;
					case 5:
						System.exit(0);
					break;
					default:
						System.out.println("Insert an integer between 1 and 10.");
					break;
				}
			}
			catch (InputMismatchException a) {
				System.out.println("Insert integer.");
			} catch (NullPointerException a) {
				System.out.println("Insert integer.");
			}
		}
		while(op != 4);
		
	}
	
	private static int menu(String[] args) {
		emptyLines(3);
		System.out.print((char)9487);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9491);
		for (int i=0; i<args.length; i++) {
			System.out.print((char)9475);
			int spaceLeft = (int)((36-args[i].length())/2);
			int spaceRight = 36 - spaceLeft - args[i].length();
			for (int j=0; j<spaceLeft; j++) { System.out.print(" "); }
			System.out.print((i+1)+" - "+args[i]);
			for (int j=0; j<spaceRight; j++) { System.out.print(" "); }
			System.out.print((char)9475+"\n");
		}
		System.out.print((char)9495);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9499);
		return readInteger();
	}

	private static void atribuirBrinquedo() {
		String brinquedo = brinquedos.get((int)Math.random()*brinquedos.size());
		String funcionario = funcionarios.get((int)Math.random()*funcionarios.size());
		System.out.println("Brinquedo "+brinquedo+" atribuído a "+funcionario+".");
		brinquedoGratis.put(brinquedo, funcionario);
	}
	
	private static void renomearSegundoPopularidade() {
		String[] nomes = new String [nomesMaisPopulares.getList().size()];
		ListIterator<Pair<String, Integer>> it = nomesMaisPopulares.getList().listIterator();
		while(it.hasNext()) {
			Pair<String, Integer> p = it.next();
			
		}
	}
	
	private static String read(String text) {
		System.out.println(text);
		return read();
	}
	
	private static String read() {
		System.out.print((char)9205+" ");
		return sc.nextLine();
	}
	
	private static Integer readInteger() {
		System.out.print((char)9205+" ");
		String aux = sc.nextLine();
		if((!aux.equals(""))&&(!aux.equals(null))) { return Integer.parseInt(aux); }
		else { return null; }
	}
	
	
	private static Integer readInteger(String text) {
		System.out.println(text);
		return readInteger();
	}
	
	private static double randBetween(double min, double max) { return Math.random()*Math.abs(max-min)+min; }
	
	private static void emptyLines (int n) { for (int i=0; i<n; i++) { System.out.println(); } }
	
}
