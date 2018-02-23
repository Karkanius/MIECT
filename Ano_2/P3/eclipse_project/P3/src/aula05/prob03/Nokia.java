package aula05.prob03;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Scanner;
import G1.vs2.Data;
import G1.vs2.Pessoa;

public class Nokia implements CarregarAgenda{
	/*Nokia: Cada linha cont�m um dos elementos de informa��o (i.e. um campo).
			 Existe uma linha em branco a separar cada registo;*/
	private static LinkedList<Pessoa> nokiaLista;
	private File file;
	private static int len = 0 ;
	
	public Nokia(File file) {
		nokiaLista = new LinkedList<>();
		this.file = file;
	}
	
	public int getLen() {
		return len;
	}
	
	public LinkedList<Pessoa> getNokiaLista() {
		return nokiaLista;
	}

	public File getFile() {
		return file;
	}

	@Override
	public void lerAgenda() throws IOException {
		Scanner in = new Scanner(file);
		in.nextLine();//Nokia
		
		while(in.hasNextLine()) {
			in.nextLine();//empty line
			//System.out.println("in: "+)
			String nome = in.nextLine();
			//System.out.println("nome: "+nome);
			String cc = in.next();
			//System.out.println("cc: "+cc);
			String data = in.next();
			//System.out.println("data: "+data);
			
			int CC = Integer.parseInt(cc);
			String[] d = data.split("/");
			int[] date = {Integer.parseInt(d[0]), Integer.parseInt(d[1]), Integer.parseInt(d[2])};
			//System.out.println(d[0]+"/"+d[1]+"/"+d[2]);
			//System.out.println("validCC "+ Pessoa.validCC(CC) + " validData "+ Data.validData(date[0], date[1], date[2]));
			if(Pessoa.validCC(CC) && Data.validData(date[0], date[1], date[2])){
				nokiaLista.add(new Pessoa(nome, CC, new Data(date[0], date[1], date[2])));
				len++;
			}
			if(in.hasNextLine()) in.nextLine();//empty line //System.out.println("in: "+)
		}
		in.close();
	}
	
	@Override
	public void listar() {
		for(Pessoa p : nokiaLista){
			System.out.println(p.toString());
		}
	}
	

}
