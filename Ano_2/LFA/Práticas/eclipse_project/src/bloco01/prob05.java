/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import java.util.Arrays;
import java.util.HashMap;
import java.util.regex.Pattern;

import KarkaniusUtils.READ;

@SuppressWarnings("unlikely-arg-type")
public class prob05 {

	static HashMap<String, Double> reg = new HashMap<>();
	static char [] operatorChar = {'+','-','*','/','^'};
	
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
						    if (c == elems[1].charAt(i)) { reg.put(elems[0], SOLVE_OPERATION(elems[1])); }
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
	
	//SOLVE_OPERATION
	private static double SOLVE_OPERATION(String operation) {
		operation = cleanWhiteSpaces(operation);
		int beginIndex=0;
		double d=0;
		try {
			d = Double.parseDouble(operation);
		} catch (NumberFormatException e) { }
		
		// SEARCH FOR:
		
		// 1 - Parentheses
		
		if(operation.contains("(")) {
			for(int i=0; i<operation.length(); i++) {
				if(operation.charAt(i)=='(') {
					beginIndex=i;
				} else if(operation.charAt(i)==')') {
					int index = beginIndex;
					String subOp = operation.substring(index+1, i);
					d = SOLVE_OPERATION(subOp);
					operation = operation.substring(0,index)+d+operation.substring(i+1);
					return SOLVE_OPERATION(operation);
				}
			}
		}
		
		// 2 - Exponentiation

		else if(operation.contains("^")) {
			String [] elems = operation.split("[\\+\\-\\*\\/]");
			String subOp;
			for(String str : elems) {
				if(str.contains("^")) {
					subOp = str;
					String [] operators = subOp.split("\\^");
					d = Math.pow(Double.parseDouble(operators[0]), Double.parseDouble(operators[1]));
					String [] aux = operation.split(Pattern.quote(subOp));
					try {
						operation = aux[0];
					} catch (ArrayIndexOutOfBoundsException e) {
						operation = "";
					}
					for(int i=1; i<aux.length; i++) {
						operation += d+aux[i];
					}
					if(operation.equals("")) { return d; }
					return SOLVE_OPERATION(operation+d);
				}
			}
		}
		
		// 3 - Multiplication/Division

		else if((operation.contains("*"))||(operation.contains("/"))) {
			String [] elems = operation.split("[\\+\\-]");
			String subOp;
			for(String str : elems) {
				if(str.contains("*")) {
					subOp = str;
					String [] operators = subOp.split("[\\*\\/]");
					d = Double.parseDouble(operators[0]) * Double.parseDouble(operators[1]);
					String [] aux = operation.split(Pattern.quote(subOp));
					try {
						operation = aux[0];
					} catch (ArrayIndexOutOfBoundsException e) {
						operation = "";
					}
					try {
						for(int i=1; i<aux.length; i++) {
							operation += d+aux[i];
						}
					} catch (ArrayIndexOutOfBoundsException e) {
						operation += d;
					}
					return SOLVE_OPERATION(operation);
				}
				else if(str.contains("/")) {
					subOp = str;
					String [] operators = subOp.split("[\\*\\/]");
					d = Double.parseDouble(operators[0]) / Double.parseDouble(operators[1]);
					String [] aux = operation.split(Pattern.quote(subOp));
					try {
						operation = aux[0];
					} catch (ArrayIndexOutOfBoundsException e) {
						operation = "";
					}
					try {
						for(int i=1; i<aux.length; i++) {
							operation += d+aux[i];
						}
					} catch (ArrayIndexOutOfBoundsException e) {
						return d;
					}
					return SOLVE_OPERATION(operation);
				}
			}
		}
		
		// 4 - Addiction/Subtraction

		else if((operation.contains("+"))||(operation.contains("-"))) {
			if(operation.contains("+")) {
				String [] operators = operation.split("[\\+\\-]");
				d = Double.parseDouble(operators[0]) + Double.parseDouble(operators[1]);
				String [] aux = operation.split(Pattern.quote(operation));
				try {
					operation = aux[0];
				} catch (ArrayIndexOutOfBoundsException e) {
					operation = "";
				}
				try {
					for(int i=1; i<aux.length; i++) {
						operation += d+aux[i];
					}
				} catch (ArrayIndexOutOfBoundsException e) {
					return d;
				}
				return SOLVE_OPERATION(operation+d);
			}
			else if(operation.contains("-")) {
				String [] operators = operation.split("[\\+\\-]");
				d = Double.parseDouble(operators[0]) - Double.parseDouble(operators[1]);
				String [] aux = operation.split(Pattern.quote(operation));
				try {
					operation = aux[0];
				} catch (ArrayIndexOutOfBoundsException e) {
					operation = "";
				}
				try {
					for(int i=1; i<aux.length; i++) {
						operation += d+aux[i];
					}
				} catch (ArrayIndexOutOfBoundsException e) {
					return d;
				}
				return SOLVE_OPERATION(operation+d);
			}
		}
		return d;
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
	
	//cleanWhiteSpaces
	private static String cleanWhiteSpaces(String str) {
		String [] elems = str.split("[\\s]");
		str = "";
		for(String s : elems) { str += s; }
		return str;
	}
}