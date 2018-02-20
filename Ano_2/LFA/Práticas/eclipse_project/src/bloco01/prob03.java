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
import java.util.LinkedList;
import java.util.Scanner;
import java.util.regex.Pattern;

import KarkaniusUtils.READ;

public class prob03 {

	public static void main(String[] args) {
		
		HashMap<String, Integer> dic = new HashMap<>();
		
		//File Reading
		Scanner scf;
		try {
			scf = new Scanner(new File("numbers.txt"));
			LinkedList<String> list = new LinkedList<String>();
			while(scf.hasNextLine()) { list.add(scf.nextLine()); }
			while(!list.isEmpty()) {
				String aux = list.get(0);
				list.removeFirst();
				String [] elements = aux.split(Pattern.quote(" - "));
				dic.put(elements[1], Integer.parseInt(elements[0]));
			}
			scf.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		while(true) {
			String [] num = READ.readString().split("[\\W]");
			if(num[0].equals("")) { break; }
			for(int i=0; i<num.length; i++) {
				System.out.print(dic.get(num[i])+" ");
			}
			System.out.println("\n");
		}
		
	}

}