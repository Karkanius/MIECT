/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import java.util.Stack;
import java.util.regex.Pattern;

import KarkaniusUtils.READ;

public class prob01 {
	
	static Stack<Double> operands = new Stack<Double>();

	public static void main(String[] args) {
		
		/*
		 * OPERATOR PRIORITY
		 * 1 - Parentheses
		 * 2 - Exponentiation
		 * 3 - Multiplication/Division
		 * 4 - Addiction/Subtraction
		 * 
		 */
		
		System.out.println("--- SIMPLE CALCULATOR ---");
		String op = FETCH_OPERATION();
		System.out.println(SOLVE_OPERATION(op));

	}
	
	private static double SOLVE_OPERATION(String operation) {
		
		operation = cleanWhiteSpaces(operation);
		int beginIndex=0;
		
		// SEARCH FOR:
		
		// 1 - Parentheses
		
		if(operation.contains("(")) {
			for(int i=0; i<operation.length(); i++) {
				if(operation.charAt(i)=='(') {
					beginIndex=i;
				} else if(operation.charAt(i)==')') {
					int index = beginIndex;
					String subOp = operation.substring(index+1, i);
					double d = SOLVE_OPERATION(subOp);
					operation = operation.substring(0,index)+d+operation.substring(i+1);
					return SOLVE_OPERATION(operation);
				}
			}
		}
		
		// 2 - Exponentiation

		else if(operation.contains("^")) {
			String [] elems = operation.split("[\\+\\-\\*\\/]");
			String subOp;
			double d;
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
		
		// 3 - Multiplication/Division

		else if((operation.contains("*"))||(operation.contains("/"))) {
			String [] elems = operation.split("\\+\\-");
			String subOp;
			double d;
			for(String str : elems) {
				if(str.contains("*")) {
					subOp = str;
					String [] operators = subOp.split("\\*\\/]");
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
					String [] operators = subOp.split("\\*\\/");
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
			double d;
			if(operation.contains("+")) {
				String [] operators = operation.split("\\+\\-]");
				d = Double.parseDouble(operators[0]) * Double.parseDouble(operators[1]);
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
				return SOLVE_OPERATION(operation);
			}
			else if(operation.contains("-")) {
				String [] operators = operation.split("\\+\\-");
				d = Double.parseDouble(operators[0]) / Double.parseDouble(operators[1]);
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
				return SOLVE_OPERATION(operation);
			}
		}
		return Double.parseDouble(operation);
	}

	public static String FETCH_OPERATION() {
		String str = READ.readString();
		return str;
	}
	
	private static String cleanWhiteSpaces(String str) {
		String [] elems = str.split("[\\s]");
		str = "";
		for(String s : elems) { str += s; }
		return str;
	}

}