/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import java.util.Arrays;
import java.util.HashMap;

import KarkaniusUtils.READ;

@SuppressWarnings("unlikely-arg-type")
public class prob05 {

	static HashMap<String, Double> reg = new HashMap<>();
	static char [] operatorChar = {'+','-','*','/'};
	
	public static void main(String[] args) {
		
		System.out.println("--- NUMERIC VARIABLES CALCULATOR ---");
		String instruction = "";
		do {
			instruction = READ.readString();
			if(!instruction.equals("exit") && !instruction.equals(""))
			INTERPRET_INSTRUCTION(instruction);
			System.out.println();
		} while (instruction!="exit");

	}
	
	private static void INTERPRET_INSTRUCTION(String instruction) {
		
		//Variable Value Attribution
		if(isVVA(instruction)) {
			String [] elems = instruction.split("[\\s]");
			instruction = "";
			for(int i=0; i<elems.length; i++) { instruction += elems[i]; }
			elems = instruction.split("=");
			if(Character.isLetter(elems[0].charAt(0))) {
				try {
					reg.put(elems[0], Double.parseDouble(elems[1]));
				} catch (NumberFormatException e) {
					for(int i=0; i<elems[1].length(); i++) {
						for (char c : operatorChar) {
						    if (c == elems[1].charAt(i)) { reg.put(elems[0], operationSolve(elems[1])); }
						}
					}
				}
			}
		}
		
		//Variable Value Print
		else if (isVVP(instruction)) {
			String [] arg = instruction.split("[\\s]");
			System.out.println(reg.get(arg[0]));
		}
		
		
		
	}
	
	//Variable Value Attribution
	private static boolean isVVA(String instruction) {
		String [] elems = instruction.split("[\\s]");
		instruction = "";
		int nEquals = 0;
		for(int i=0; i<elems.length; i++) { instruction += elems[i]; }
		for(int i=0; i<instruction.length(); i++) { if(instruction.charAt(i)=='=') { nEquals++; } }
		if(nEquals==1) {
			elems = instruction.split("=");
			//Variable name must start with a letter
			if(Character.isLetter(elems[0].charAt(0))) {
				try {
					Double.parseDouble(elems[1]);
					return true;
				} catch (NumberFormatException e) {
					if(isOperation(elems[1])) { return true; }
					else { return false; }
				}
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	//Variable Value Print
	private static boolean isVVP(String instruction) {
		if((instruction!="") && (Character.isLetter(instruction.charAt(0)))) {
			char [] ch = operatorChar;
			ch = Arrays.copyOf(ch, ch.length + 1);
			ch[ch.length-1] = '=';
			for(int i=0; i<instruction.length(); i++) {
				if(Arrays.asList(ch).contains(instruction.charAt(i))) { return false; }
			}
			return true;
		}
		return false;
	}
	
	//Arithmetic Calculus
	private static double operationSolve(String operation) {
		for(int i=0; i<operation.length(); i++) {
			for (char c : operatorChar) {
			    if (c == operation.charAt(i)) {
					String a = operation.substring(0, i);
					String b = operation.substring(i+1);
					double first, second;
					if(isNumber(a)) { first = Double.parseDouble(a); }
					else { first = reg.get(a); }
					if(isNumber(b)) { second = Double.parseDouble(b); }
					else { second = reg.get(b); }
					switch(operation.charAt(i)) {
						case '+':
							return first + second;
						case '-':
							return first - second;
						case '*':
							return first * second;
						case '/':
							return first / second;
						default:
							return 0;
					}
			    }
			}
		}
		return 0;
	}
	
	//isNumber
	public static boolean isNumber(String str)  
	{  
	  try  
	  {  
	    Double.parseDouble(str);
	  }  
	  catch(NumberFormatException nfe)  
	  {  
	    return false;  
	  }  
	  return true;  
	}
	
	//isOperation
	private static boolean isOperation(String str) {
		for(int i=0; i<str.length(); i++) {
			if(isOperator(str.charAt(i))) { return true; }
		}
		return false;
	}
	
	//isOperator
	private static boolean isOperator(char target) {
		for (char c : operatorChar) {
		    if (c == target) { return true; }
		}
		return false;
	}
}