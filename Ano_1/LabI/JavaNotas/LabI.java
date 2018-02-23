import java.util.*;
import java.io.*;


public class LabI {
	
	static Scanner sc = new Scanner (System.in);
	
	public static void main (String[] args) throws IOException {
		
		//Variáveis
		//Notas
		double mt [] = new double [4];
		double ap [] = new double [2];
		double proj [] = new double [2];
		
		boolean completo;
		
		//Ficheiros para armazenamento das notas
		File f_mt = new File ("FicheirosNotas/mt.txt");
		File f_ap = new File ("FicheirosNotas/ap.txt");
		File f_proj = new File ("FicheirosNotas/proj.txt");
		
		//Respetivos scanners
		Scanner sc_mt = new Scanner (f_mt);
		Scanner sc_ap = new Scanner (f_ap);
		Scanner sc_proj = new Scanner (f_proj);
		
		//Leitor de opções
		int op;
		
		//Atribuição de notas conforme valores nos respetivos ficheiros
		//Mini-testes
		for (int i = 0; sc_mt.hasNextLine(); i++)
			mt[i] = Double.parseDouble(sc_mt.nextLine());
		//Trabalhos de aprofundamento
		for (int i = 0; sc_ap.hasNextLine(); i++)
			ap[i] = Double.parseDouble(sc_ap.nextLine());
		//Projetos
		for (int i = 0; sc_proj.hasNextLine(); i++)
			proj[i] = Double.parseDouble(sc_proj.nextLine());
		
		
		while (true)
		{
			System.out.println ("MENU");
			System.out.println ("1 - Atribuição de novas notas");
			System.out.println ("2 - Consulta de notas");
			System.out.println ("3 - Término do programa");
			System.out.print ("» ");
			op = sc.nextInt();
			assert (op == 1 || op == 2 || op == 3) : "ERROR: Option out of bounds.";
			System.out.println();
			
			
			//Atribuição de notas
			if (op == 1)
			{
				System.out.println ("1 - Mini-teste");
				System.out.println ("2 - Trabalho de Aprofundamento");
				System.out.println ("3 - Projeto");
				System.out.print ("» ");
				op = sc.nextInt();
				assert (op == 1 || op == 2 || op == 3) : "ERROR: Option out of bounds.";
				System.out.println();
				
				if (op == 1)
				{
					System.out.println ("Inserir número do Mini-teste");
					System.out.print ("» ");
					op = sc.nextInt();
					assert (op == 1 || op == 2 || op == 3 || op == 4) : "Só é possível atribuir notas ao Mini-teste 1, 2, 3 ou 4";
					System.out.println();
					System.out.print ("Nota: ");
					mt[op-1] = sc.nextDouble();
					PrintWriter pw = new PrintWriter (f_mt);
					for (int i = 0; i < 4; i++)
						pw.println (mt[i]);
					pw.close();
				}
				else if (op == 2)
				{
					System.out.println ("Inserir número do Trabalho de Aprofundamento");
					System.out.print ("» ");
					op = sc.nextInt();
					assert (op == 1 || op == 2) : "Só é possível atribuir notas ao Trabalho de aprofundamento 1 ou 2";
					System.out.println();
					System.out.print ("Nota: ");
					ap[op-1] = sc.nextDouble();
					PrintWriter pw = new PrintWriter (f_ap);
					for (int i = 0; i < 2; i++)
						pw.println (ap[i]);
					pw.close();
				}
				else if (op == 3)
				{
					System.out.println ("Inserir número do Projeto");
					System.out.print ("» ");
					op = sc.nextInt();
					assert (op == 1 || op == 2) : "Só é possível atribuir notas ao Projeto 1 ou 2";
					System.out.println();
					System.out.print ("Nota: ");
					proj[op-1] = sc.nextDouble();
					PrintWriter pw = new PrintWriter (f_proj);
					for (int i = 0; i < 2; i++)
						pw.println (proj[i]);
					pw.close();		
				}
				System.out.println ();
				System.out.println ();
				System.out.println ();
			}
			
			
			//Consulta de notas
			else if (op == 2)
			{
				System.out.println ();
				System.out.println ("*************Mini-testes*************");
				System.out.print ("Mini-teste 1: ");
				PrintNota (mt[0]);
				System.out.print ("Mini-teste 2: ");
				PrintNota (mt[1]);
				System.out.print ("Mini-teste 3: ");
				PrintNota (mt[2]);
				System.out.print ("Mini-teste 4: ");
				PrintNota (mt[3]);
				System.out.print ("Média: ");
				PrintNota (SubMed (mt));
				
				System.out.println ();
				
				System.out.println ("*****Trabalhos de aprofundamento*****");
				System.out.print ("Trabalho de aprofundamento 1: ");
				PrintNota (ap[0]);
				System.out.print ("Trabalho de aprofundamento 2: ");
				PrintNota (ap[1]);
				System.out.print ("Média: ");
				PrintNota (SubMed (ap));

				System.out.println ();
				
				System.out.println ("**************Projetos***************");
				System.out.print ("Projeto 1: ");
				PrintNota (proj[0]);
				System.out.print ("Projeto 2: ");
				PrintNota (proj[1]);
				System.out.print ("Média: ");
				PrintNota (SubMed (proj));
				
				if (verif_comp(mt, ap, proj))
				{
					System.out.println ();
					System.out.println ();
					System.out.println ("As notas já foram todas inseridas.");
					System.out.println ();
					System.out.print ("Média final: ");
					PrintNota(notFinalDef(mt, ap, proj));
					System.out.println ("Nota final : " + Math.round(notFinalDef(mt, ap, proj)));
				}
				else
				{
					System.out.println ();
					System.out.println ();
					System.out.println ("As notas ainda não foram todas inseridas.");
					System.out.println ();
					System.out.print ("Média mínima: ");
					PrintNota(min(mt, ap, proj));
					System.out.println ("Nota mínima : " + Math.round(min(mt, ap, proj)));
					System.out.println ();
					System.out.print ("Média máxima: ");
					PrintNota(max(mt, ap, proj));
					System.out.println ("Nota máxima : " + Math.round(max(mt, ap, proj)));
					System.out.println ();
					System.out.print ("Média final provisória: ");
					PrintNota(notFinalProv(mt, ap, proj));
					System.out.println ("Nota final provisória : " + Math.round(notFinalProv(mt, ap, proj)));
				}
				System.out.println ();
				System.out.println ();
				System.out.println ();
			}
			else
				break;
		}
	}
	
	
	//Cálculo da média
	static double med (double [] vetor_notas) {
		
		int n = vetor_notas.length;
		int soma = 0;
		
		for (int i = 0; i < n; i++)
		{
			//Só calcula a média das notas diferentes de 0
			if (vetor_notas [i] != 0)
				soma += vetor_notas [i];
			else
				n--;
		}
		
		return (soma/n);
	}
	
	
	
	//Cálculo da nota final provisória
	static double notFinalProv (double [] mt, double [] ap, double [] proj) {
		
		double n_mt = 0;
		double n_ap = 0;
		double n_proj = 0;
		
		int n = 0;
		
		
		//Mini-testes
		for (int i = 0; i < 4; i++, n++)
		{
			if (mt [i] != 0)
				n_mt += mt[i];
			else
				n--;
		}
		if (n != 0)
			n_mt /= n;
		
		n = 0; //reset do n
		
		
		//Trabalhos de aprofundamento
		for (int i = 0; i < 2; i++, n++)
		{
			if (ap [i] != 0)
				n_ap += ap[i];
			else
				n--;
		}
		if (n != 0)
			n_ap /= n;
			
		
		
		//Projetos
		if (proj[0]!=0 && proj[1]!=0)
			n_proj = 37.5*proj[0] + 62.5*proj[1];
		else if (proj[0]!=0)
			n_proj = proj[0];
		else
			n_proj = proj[1];
			
			
			
		return 0.4*n_mt + 0.2*n_ap + 0.4*n_proj;
	}
	
	
	
	//Cálculo da nota final definitiva
	static double notFinalDef (double [] mt, double [] ap, double [] proj) {
		
		return mt[0]*0.1 + mt[1]*0.1 + mt[2]*0.1 + mt[3]*0.1 + ap[0]*0.1 + ap[1]*0.1 + proj[0]*0.15 + proj[1]*0.25;
	
	}
	
	
	
	//Verificação se já foram inseridas todas as notas
	static boolean verif_comp (double [] mt, double [] ap, double [] proj) {
		
		boolean completo = true;
		
		//Verificação de metade dos Mini-testes, dos Trabalhos de aprofundamento e dos Projetos
		for (int i = 0; i < 2; i++)
		{
			if (mt[i] == 0) completo = false;
			if (ap[i] == 0) completo = false;
			if (proj[i] == 0) completo = false;
		}
		
		
		//Verificação da segunda metade dos Mini-testes
		for (int i = 2; i < 4; i++)
		{
			if (mt[i] == 0) completo = false;
		}

		return completo;
	}
	
	
	
	static void PrintNota (double n) {
		
		if (n != 0)
			System.out.printf ("%.2f\n", n);
		else
			System.out.println ("NaN");
			
		}
	
	
	static double SubMed (double [] v) {
		
		double soma = 0;
		int n = 0;
		
		for (int i = 0; i < v.length; i++, n++)
		{
			if (v [i] != 0)
				soma += v[i];
			else
				n--;
		}
		if (n != 0)
			soma /= n;

		return soma;
	}
		
		
		
	//Cálculo da nota mínima possível
	static double min (double [] mt, double [] ap, double [] proj) {
		
		//Igual ao cálculo da nota final pois notas não inseridas são, por definição, inseridas a 0
		return mt[0]*0.1 + mt[1]*0.1 + mt[2]*0.1 + mt[3]*0.1 + ap[0]*0.1 + ap[1]*0.1 + proj[0]*0.15 + proj[1]*0.25;
	
	}
	
	
	
	//Cálculo da nota máxima possível
	static double max (double [] mt, double [] ap, double [] proj) {
		
		double total = 0;
		
		//Mini-testes
		for (int i = 0; i < 4; i++)
		{
			if (mt[i] != 0)
				total += mt[i]*0.1;
			else
				total += 2;		//2 = 20(nota máxima possível) * 0.1(cotação)
		}
		
		//Trabalhos de aprofundamento
		for (int i = 0; i < 2; i++)
		{
			if (ap[i] != 0)
				total += ap[i]*0.1;
			else
				total += 2;		//2 = 20(nota máxima possível) * 0.1(cotação)
		}
		
		//Projetos
		if (proj[0] != 0)	total += proj[0]*0.15;
		else				total += 3;
		if (proj[1] != 0)	total += proj[1]*0.25;
		else				total += 5;
		
		return total;
	}
}



















