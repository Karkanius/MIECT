package MPEI;
import java.io.*;
import java.util.*;
import testes.*;
import biblioteca.*;

public class MENU {
	final static Scanner dan = new Scanner(System.in);
	public static void main(String[] args) throws IOException{
		int op=0, op2=0;
		
		do{
		
			System.out.println("MENU DE TESTES");
			System.out.println("1 - Testes do BloomFilter");
			System.out.println("2 - Testes do CountingFilter");
			System.out.println("3 - Testes do MinHash");
			System.out.println("4 - Biblioteca");
			System.out.println("0 - Terminar Programa");
			System.out.print("Opcao:");
			op = dan.nextInt();
			switch(op){
				case 0: System.exit(0); 
					break;
				case 1:
					do{ 
						System.out.println();
						System.out.println("MENU DE TESTES > TESTES DO BLOOMFILTER");
						System.out.println("1 - Strings predefinidas");
						System.out.println("2 - Strings aleatórias");
						System.out.println("3 - Lista de países");
						System.out.println("4 - Alunos de uma turma");
						System.out.println("5 - Lista de contactos de email");
						System.out.println("0 - Voltar");
						System.out.print("Opção:");
						op2 = dan.nextInt();
						switch(op2) {
							case 1: TesteBFStrings.main(null);
								break;
							case 2: TesteBFStringsRand.main(null);
								break;
							case 3: TesteBFPaises.main(null);
								break;
							case 4: TesteBFTurma.main(null);
								break;
							case 5: TesteBFEmail.main(null);
								break;
						}
					}while(op2<0 || op2>0);
					break; 
				case 2:
					do{ 
						System.out.println();
						System.out.println("MENU DE TESTES > TESTES DO COUNTING BLOOMFILTER");
						System.out.println("1 - Faltas de uma turma");
						System.out.println("2 - Carrinho de compras");
						System.out.println("0 - Voltar");
						System.out.print("Opção:");
						op2 = dan.nextInt();
						switch(op2) {
							case 1: TesteCFTurma.main(null);
								break;
							case 2: TesteCFCompras.main(null);
								break;
						}
					}while(op2<0 || op2>0);
					break; 
				case 3:
					do{ 
						System.out.println();
						System.out.println("MENU DE TESTES > TESTES DO MINHASH");
						System.out.println("1 - Livros");
						System.out.println("2 - Viagens");
						System.out.println("0 - Voltar");
						System.out.print("Opção:");
						op2 = dan.nextInt();
						switch(op2) {
							case 1: TesteMHLivros.main(null);
								break;
							case 2: TesteMHViagens.main(null);
								break;
						}
					}while(op2<0 || op2>0);
					break; 
				case 4: TesteBiblioteca.main(null);
					break;
			}
		}while(op<0 || op>0);
		
		
	}

}
