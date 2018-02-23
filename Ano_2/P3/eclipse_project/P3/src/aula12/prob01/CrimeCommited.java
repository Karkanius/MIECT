package aula12.prob01;

public class CrimeCommited extends Crime {
	
	//ATTRIBUTES
	
	private int amount;
	
	
	//CONSTRUCTORES
	
	public CrimeCommited(String name) {
		super(name);
	}
	
	public CrimeCommited(String name, int amount) {
		super(name);
		this.amount = amount;
	}
	
	
	//METHODS
	
	public int getConvictionsAmount() { return this.amount; }
	public void setConvictionsAmount(int n) {this.amount = n; }
	
	@Override
	public String toString() { 
		String str = super.getCrimeName().substring(0, 1).toUpperCase()+super.getCrimeName().substring(1);
		int n = 3-str.length()/8;
		for (int i=0; i<n; i++) { str += "\t"; }
		str += amount+" convictions";
		return str;
	}
}
