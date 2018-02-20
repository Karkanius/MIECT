/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 february
 * 
 */

package bloco01;

public class Operation {
	
	/*
	 * ATRIBUTTES
	 */
	
	private double first;
	private double second;
	private char operator;
	
//----------------------------------------------------------------------------------------------------

	/*
	 * CONSTRUCTORS
	 */
	
	public Operation (double first, char operator, double second) {
		checkValidOperator(operator);
		this.first = first;
		this.second = second;
		this.operator = operator;
	}
	
	public Operation (double first, double second, char operator) {
		checkValidOperator(operator);
		this.first = first;
		this.second = second;
		this.operator = operator;
	}
	
//----------------------------------------------------------------------------------------------------

	/*
	 * BASIC METHODS
	 */
	
	public double getFirst() { return this.first; }
	public double getSecond() { return second; }
	public char getOperator() { return operator; }

	public void setFirst(double first) { this.first = first; }
	public void setSecond(double second) { this.second = second; }
	public void setOperator(char operator) { this.operator = operator; }
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(first);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + operator;
		temp = Double.doubleToLongBits(second);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		Operation other = (Operation) obj;
		if (Double.doubleToLongBits(first) != Double.doubleToLongBits(other.first))
			return false;
		if (operator != other.operator)
			return false;
		if (Double.doubleToLongBits(second) != Double.doubleToLongBits(other.second))
			return false;
		return true;
	}
	
	@Override
	public String toString() { return this.first + " " + this.operator + " " + this.second; }
	
//----------------------------------------------------------------------------------------------------

	/*
	 * CUSTOM METHODS
	 */
	
	public double getResult() {
		double retValue;
		switch(this.operator) {
			case '*':
				retValue = this.first * this.second;
				break;
			case '/':
				retValue = this.first / this.second;
				break;
			case '+':
				retValue = this.first + this.second;
				break;
			case '-':
				retValue = this.first - this.second;
				break;
			default:
				retValue = 0;
				break;
		}
		return retValue;
	}
	
	public static void checkValidOperator(char operator) {
		switch(operator) {
			case '+':
			case '-':
			case '*':
			case '/':
				break;
			default:
				System.err.println("Invalid operator");
				System.exit(-1);
				break;
		}
	}
	
	public String operationCompleted () {
		return this.first + " " + this.operator + " " + this.second + " = " + this.getResult();
	}
	
}