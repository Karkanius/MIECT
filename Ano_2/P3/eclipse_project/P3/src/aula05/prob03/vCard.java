package aula05.prob03;

import java.io.*;
import java.util.*;


public class vCard implements CarregarAgenda{
	/*CSV: Cada linha cont�m um registo e os campos est�o delimitados pelo caracter TAB (\t);*/
	
	private static LinkedList<Pessoa> vCardLista;
	private File file;
	private static int len = 0 ;
	
	public vCard(File file) {
		vCardLista = new LinkedList<>();
		this.file = file;
	}
	
	public int getLen() {
		return len;
	}
	
	public LinkedList<Pessoa> getVCardLista() {
		return vCardLista;
	}

	public File getFile() {
		return file;
	}

	@Override
	public void lerAgenda() throws IOException {
		Scanner scf = new Scanner(file);
		String [] line = new String [100];
		
		for (int i=0; scf.hasNextLine(); i++) { line[i] = scf.nextLine(); }
		for (int i=0; line[i]!=null; i++) {
			String [] parts = line[i].split("#");
			String [] data = parts[2].split("/");
			Pessoa p = new Pessoa (parts[0], Integer.parseInt(parts[1]), new Data (Integer.parseInt(data[0]), Integer.parseInt(data[1]), Integer.parseInt(data[2])));
			vCardLista.add(p);
		}
		
		scf.close();
	}
	
	@Override
	public void listar() {
		for(Pessoa p : vCardLista){
			System.out.println(p.toString());
		}
	}

}