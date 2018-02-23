package aula05.prob03;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public interface CarregarAgenda {
	
	public void lerAgenda() throws IOException;
	
	public void listar();
	
	default String whatKind(File f) throws IOException{
		Scanner in = new Scanner(f);
		if(in.nextLine().equals("Nokia")) {
			in.close();
			return "Nokia";
		}
		else if(in.nextLine().equals("vCard")) {
			in.close();
			return "vCard";
		}
		else if(in.nextLine().equals("CSV")) {
			in.close();
			return "CSV";
		}
		else {
			in.close();
			return "agenda nao reconhecida";
		}
	}

	
}
