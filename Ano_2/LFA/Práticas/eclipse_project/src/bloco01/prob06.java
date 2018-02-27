/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Scanner;
import KarkaniusUtils.READ;

public class prob06 {

	public static void main(String[] args) {
		
		//a)
		
		HashMap<String, String> PTtoENG = new HashMap<>();
		HashMap<String, String> dic = new HashMap<>();
		String str;
		String[] words;
		
		//Files Reading
		Scanner scf;
		try {
			scf = new Scanner(new File("dic1.txt"));
			while(scf.hasNextLine()) {
				words = scf.nextLine().split(" ",2);
				PTtoENG.put(words[0], words[1]);
			}
			scf.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			scf = new Scanner(new File("dic2.txt"));
			while(scf.hasNextLine()) {
				words = scf.nextLine().split(" ",2);
				
				//Now to remove those stupid white spaces at the beginning of the second element
				for(int i=0; i<words[1].length(); i++) { if(words[1].charAt(i)!=' ') { words[1] = words[1].substring(i); break; } }
				
				dic.put(words[0], words[1]);
			}
			scf.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
		//b)
		
		str = "";
		words = READ.readString("Insira frase para traduzir").split(" ");
		for(int i=0; i<words.length; i++) {
			if(PTtoENG.containsKey(words[i])) { str += PTtoENG.get(words[i]); }
			else { str += "["+words[i]+"]"; }
			if(i!=words.length-1) { str += " "; }
		}
		System.out.println("\nFrase traduzida:");
		System.out.println(str+"\n\n");
		
		
		//c)
		
		str = "";
		words = READ.readString("Insira frase para substituir por sinónimos").split(" ");
		for(int i=0; i<words.length; i++) {
			if(dic.containsKey(words[i])) { str += dic.get(words[i]); }
			else { str += words[i]; }
			if(i!=words.length-1) { str += " "; }
		}
		System.out.println("\nFrase transformada:");
		System.out.println(str+"\n\n");
		
	}

}
