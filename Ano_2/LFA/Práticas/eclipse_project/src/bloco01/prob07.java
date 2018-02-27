/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

import KarkaniusUtils.Menu;
import KarkaniusUtils.READ;

public class prob07 {

	public static void main(String[] args) {
		
		// OperationTree
		OperationTree tree = new OperationTree();
		
		// Menu
		String[] notations = {"Infix notation", "Prefix notation", "Sufix notation"};
		Menu main = new Menu("CHOOSE NOTATION TO USE", notations);
		main.printMenu();
		
		// Notation selection
		int op = READ.readInteger();
		
		// Operation input
		String operation = READ.readString("\nInsert operation");
		
		// Operation decoding
		switch(op) {
		case 1:
			
		case 2:
			
		case 3:
			
		default:
			System.err.println("ERROR - Notation system chose out of boundries.");
			System.exit(-1);
		}

	}

}



class OperationTree {
	
	/*
	 * ATRIBUTTES
	 */
	
	private OperationElement elem;
	private OperationTree left;
	private OperationTree right;
	
//----------------------------------------------------------------------------------------------------

	/*
	 * CONSTRUCTORS
	 */
	
	public OperationTree() { }
	
	public OperationTree(String elem) {
		insert(elem);
	}
	
	public OperationTree(OperationElement elem) {
		insert(elem);
	}
	
//----------------------------------------------------------------------------------------------------

	/*
	 * BASIC METHODS
	 */
	
	public OperationElement getElem() { return this.elem; }
	public OperationTree getLeft() { return this.left; }
	public OperationTree getRight() { return this.right; }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((elem == null) ? 0 : elem.hashCode());
		result = prime * result + ((left == null) ? 0 : left.hashCode());
		result = prime * result + ((right == null) ? 0 : right.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OperationTree other = (OperationTree) obj;
		if (elem == null) {
			if (other.elem != null)
				return false;
		} else if (!elem.equals(other.elem))
			return false;
		if (left == null) {
			if (other.left != null)
				return false;
		} else if (!left.equals(other.left))
			return false;
		if (right == null) {
			if (other.right != null)
				return false;
		} else if (!right.equals(other.right))
			return false;
		return true;
	}
	
//----------------------------------------------------------------------------------------------------

	/*
	 * CUSTOM METHODS
	 */
	
	private void insert(String str) {
		OperationElement opElem = new OperationElement(str);
		insert(opElem);
	}
	
	private void insert(OperationElement opElem) {
		if(this.elem!=null) {
			this.elem = opElem;
		} else {
			if(opElem.getType().equals(OpElemType.OPERATOR) || this.left!=null) {
				// If opElem is operator or if left branch is already taken
				// Right branch
				right = new OperationTree(opElem);
			} else {
				// Else (if opElem is operand and left branch is available)
				// Left branch
				left = new OperationTree(opElem);
			}
		}
	}
	
	public double getResult() {
		if(this.elem.getType().equals(OpElemType.OPERATOR)) {
			char operator = this.elem.getElem().charAt(0);
			double arg0 = this.left.getResult();
			double arg1 = this.right.getResult() ;
			switch(operator) {
				case '+':
					return arg0 + arg1;
				case '-':
					return arg0 - arg1;
				case '*':
					return arg0 * arg1;
				case '/':
					return arg0 / arg1;
				case '^':
					return Math.pow(arg0, arg1);
				default:
					System.err.println("ERROR - Char is not an operator");
					System.exit(-1);
					return 0;
			}
		} else {
			return Double.parseDouble(this.elem.getElem());
		}
	}
	
}



class OperationElement {
	
	/*
	 * ATRIBUTTES
	 */
	
	private OpElemType type;
	private String elem;
	
//----------------------------------------------------------------------------------------------------

	/*
	 * CONSTRUCTORS
	 */
	
	public OperationElement (String str) {
		this.elem = str;
		if(str.length()==1 && isOperator(str.charAt(0))) {
			this.type = OpElemType.OPERATOR;
		} else {
			this.type = OpElemType.OPERAND;
		}
	}
	
	public OperationElement (char c) {
		this.elem = ""+c;
		if(isOperator(c)) {
			this.type = OpElemType.OPERATOR;
		} else {
			this.type = OpElemType.OPERAND;
		}
	}
	
//----------------------------------------------------------------------------------------------------

	/*
	 * BASIC METHODS
	 */
	
	public String getElem() { return this.elem; }
	public OpElemType getType() { return this.type; }
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((elem == null) ? 0 : elem.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OperationElement other = (OperationElement) obj;
		if (elem == null) {
			if (other.elem != null)
				return false;
		} else if (!elem.equals(other.elem))
			return false;
		if (type != other.type)
			return false;
		return true;
	}

	@Override
	public String toString() { return this.elem; }
	
//----------------------------------------------------------------------------------------------------

	/*
	 * CUSTOM METHODS
	 */
	
	private static boolean isOperator(char operator) {
		switch(operator) {
			case '+':
			case '-':
			case '*':
			case '/':
			case '^':
				return true;
			default:
				return false;
		}
	}
	
}



enum OpElemType {
    OPERATOR,
    OPERAND
}