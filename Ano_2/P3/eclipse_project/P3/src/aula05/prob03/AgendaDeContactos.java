package aula05.prob03;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Scanner;

import G1.vs2.Pessoa;

public class AgendaDeContactos implements CarregarAgenda{
	private static LinkedList<Pessoa> lista;
	private static int len = 0 ;
	
	public AgendaDeContactos() {
		 lista = new LinkedList<Pessoa>();
	}

	public static LinkedList<Pessoa> getLista() {
		return lista;
	}

	public int getLen() {
		return len;
	}
	
	public void adicPessoa(Pessoa p){
		lista.add(p);
		len++;
	}
	
	public void apagarPessoa(int cc){
		for(Pessoa p : lista){
			if(p.getCc() == cc){
				lista.remove(p);
				len--;
				break;
			}
		}
	}
	
	@Override
	public void listar(){
		for(Pessoa p : lista){
			System.out.println(p.toString());
		}
		
	}
	
	public void listarNome(){ 	
				
		String [] nomes = new String[len];
		int i=0;
		for(Pessoa p : lista){
			nomes[i]=p.getNome();
			i++;
		}
		
		Arrays.sort(nomes);//order the names by name
		
		for(i=0; i<nomes.length;i++){
			for(Pessoa p : lista){
				if(nomes[i].equals(p.getNome()))
					System.out.println(p.toString());
			}
		}
		
	}

	public void listarCC(){
		
		int [] CCs = new int[len];
		int i=0;
		for(Pessoa p : lista){
			CCs[i]=p.getCc();
			i++;
		}
		
		Arrays.sort(CCs);//order the cc
		
		for(i=0; i<CCs.length;i++){
			for(Pessoa p : lista){
				if(CCs[i] == p.getCc())
					System.out.println(p.toString());
			}
		}
	}
	
	public boolean isEmpty(){return lista.isEmpty(); }
	
	public boolean ccExists(int cc){
		for(Pessoa p : lista){
			if(p.getCc() == cc){
				return true;
			}
		}
		return false;
			
	}

	@Override
	public void lerAgenda() throws IOException{
		Scanner in = new Scanner(System.in);
		System.out.print("Introduza o nome da agenda (com extensao): ");
		String nome = in.next();
		File agenda = new File(nome);
		if(isValid(agenda)) {
			if(whatKind(agenda).equals("Nokia")) {
				Nokia nokia = new Nokia(agenda);
				nokia.lerAgenda();
				LinkedList<Pessoa> nokiaLista = nokia.getNokiaLista();
				//System.out.println("for");
				for(Pessoa p : nokiaLista){
					lista.add(p);
					//System.out.println(p);
				}
				//System.out.println("listar");
				listar();
			}
			else if(whatKind(agenda).equals("vCard")) {
				/*Nokia nokia = new Nokia(agenda);
				LinkedList<Pessoa> nokiaLista = Nokia.getNokiaLista();//review
				for(Pessoa p : nokiaLista){
					lista.add(p);
				}*/
			}
			else if(whatKind(agenda).equals("CSV")) {
				/*Nokia nokia = new Nokia(agenda);
				LinkedList<Pessoa> nokiaLista = Nokia.getNokiaLista();//review
				for(Pessoa p : nokiaLista){
					lista.add(p);
				}*/
			}
		}
		in.close();
	}
	
	public boolean isValid(File f) {
		return !f.isDirectory() && f.exists() && f.isFile();
	}
	
	
	
	
}
