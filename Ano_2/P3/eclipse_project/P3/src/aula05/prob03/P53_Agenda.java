package aula05.prob03;

import java.io.IOException;
import java.util.Scanner;
import G1.vs2.Data;
import G1.vs2.Pessoa;

public class P53_Agenda {

	private static AgendaDeContactos list = new AgendaDeContactos();
	static Scanner in = new Scanner(System.in);
		
		public static void main(String[] args) throws IOException {
			int op;
			do{
				menu();
				op = in.nextInt();
				menuOption(op);
				
			}while(op != 7);

		}
		
		public static void menu(){
			System.out.println("------menu------");
			System.out.println("1 - add person");
			System.out.println("2 - delete person");
			System.out.println("3 - show list");
			System.out.println("4 - show list ordered by name");
			System.out.println("5 - show list ordered by cc");
			System.out.println("6 - add agenda");
			System.out.println("7 - exit");
			System.out.print("option: ");
			
		}
		
		public static void menuOption(int option) throws IOException{
			switch(option){
				case 1: addPerson();
						  break;
				case 2: deletePerson();
						  break;
				case 3: showList();
						  break;
				case 4: showListName();
						  break;
				case 5: showListCC();
				  		  break;
				case 6: addAgenda();
						  break;
				default: System.out.println("closing....");
						 System.exit(-1);
			}
		}
		
		public static void addPerson(){
			System.out.println("------add person------");
			System.out.print("name: ");
			String name = in.nextLine();
			System.out.print("CC: ");
			int cc = in.nextInt();
			System.out.println("birthday: ");
			System.out.print("day: ");
			int day = in.nextInt();
			System.out.print("month: ");
			int month = in.nextInt();
			System.out.print("year: ");
			int	year = in.nextInt();
			
			if(!(Data.validData(day, month, year) && Pessoa.validCC(cc))){
				//System.out.println("data.validData(): " + data.validData());
				//System.out.println("pessoa.validCC(): " + pessoa.validCC());
				System.out.println("invalid data");
			}
			else{
				Data data = new Data(day, month, year);
				Pessoa pessoa = new Pessoa(name, cc, data);
				if(list.isEmpty()) list.adicPessoa(pessoa);
				else if (!list.ccExists(cc)) list.adicPessoa(pessoa); //there is only one cc
				else System.out.println("invalid data");
			}
				
			
		}
		
		public static void deletePerson(){
			System.out.println("------clear person------");
			System.out.print("Cc of the person you want to delete: ");
			int cc = in.nextInt();
			list.apagarPessoa(cc);
		}
		
		public static void showList(){
			list.listar();
		}
		
		public static void showListName(){
			list.listarNome();
		}

		public static void showListCC(){
			list.listarCC();
		}
		
		public static void addAgenda() throws IOException {
			list.lerAgenda();
		}

	}
