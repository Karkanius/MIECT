package aula01;
import java.util.*;

public class ex01 {

	static Scanner sc = new Scanner (System.in);

	public static void main (String[] args) {
		
		System.out.println ("Digite uma frase.");
		String str = sc.nextLine();
		
		System.out.println("Total de carateres numéricos: " + totalDigits(str));
		System.out.println();
		
		allLower(str);
		allUpper(str);
		separateWords(str);
		System.out.println(newString(str));
		
	}
	
	
	public static int totalDigits (String str) {
		
		int num = 0;
		
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {num++;}
		}

		System.out.println();
		
		return num;

	}
	
	
	public static void allLower (String str) {
		
		System.out.print("Only lower case: ");
		
		boolean verification = true;
		
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i)) && Character.isLowerCase(str.charAt(i))) {
				verification = false;
				break;
			}
		}
		
		if (totalDigits(str) < str.length())
			System.out.println(verification);
		else
			System.out.println("No Letters to be Analized");
		System.out.println();

	}
	
	
	public static void allUpper (String str) {
		
		System.out.print("Only high case: ");
		
		boolean verification = true;
		
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i)) && Character.isUpperCase(str.charAt(i))) {
				verification = false;
				break;
			}
		}
		
		if (totalDigits(str) < str.length())
			System.out.println(verification);
		else
			System.out.println("No Letters to be Analized");
		System.out.println();
	
	}
	

	public static void separateWords (String str) {
		
		String [] words = str.split("[ \t\n,.;:{}()!?]+");
		int num = words.length;
		
		System.out.println ("Número de palavras: " + num);
		
		for (int i = 0; i < num; i++) {
			System.out.println (words[i]);
		}
		
		System.out.println();
		
	}
	
	
	public static String newString (String str) {
		
		int n = str.length();
		if (n % 2 != 0) {n--;}
		String newStr = "";
		
		for (int i = 0; i < n; i+=2) {
			newStr = newStr + str.charAt(i+1) + str.charAt(i);
		}
		
		return newStr;
		
	}
}
